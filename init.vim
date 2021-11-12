call plug#begin()

" StatusLine
Plug 'beauwilliams/statusline.lua'
" Signify 
Plug 'mhinz/vim-signify'
" Colorscheme 
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" Which Key (no really, which key is for exiting out of insert mode)
Plug 'folke/which-key.nvim'
" Nvim-cmp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" Vsnip
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
" LspKind
Plug 'onsails/lspkind-nvim'
" Tabnine
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
" Tabline
Plug 'noib3/cokeline.nvim'
" Nvim-web-devicons
Plug 'kyazdani42/nvim-web-devicons'
" Notification service
Plug 'rcarriga/nvim-notify'
" Dashboard and fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'glepnir/dashboard-nvim'
" Better Escape (less lag when escaping insert mode)
Plug 'max397574/better-escape.nvim'
" Nvim Tree (To be more like vscode)
Plug 'kyazdani42/nvim-tree.lua'
" Nvim-treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Colorizer (haha colors go brrr!)
Plug 'norcalli/nvim-colorizer.lua'
" Smooth Scroll for neovim XD
Plug 'karb94/neoscroll.nvim'
" AutoSave Function because why not
Plug 'Pocco81/AutoSave.nvim'
" OrgMode (this isn't emacs so why did I include this :thinking:)
Plug 'kristijanhusak/orgmode.nvim'
call plug#end()

" Set Icons for nvim-tree
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }

" Required for cokeline.nvim and nvim-tree
set termguicolors
" Set leader key from / to ;
let mapleader = ";"
" Change colorscheme to tokyonight
colorscheme tokyonight

" nvim-cmp stuff (i have no idea what this does)
set completeopt=menu,menuone,noselect

" Set telescope to default fuzzy finder
let g:dashboard_default_executive = 'telescope'

" Keybind
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

" cool Dashboard-nvim logo B)
let g:dashboard_custom_header =<< trim END
=================     ===============     ===============   ========  ========
\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
||.=='    _-'                                                     `' |  /==.||
=='    _-'                        Station's                           \/   `==
\   _-'                          N E O V I M                           `-_   /
 `''                                                                      ``'
END
" Disable tabline in the dashboard buffer
autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2

lua <<EOF

	-- Set nvim-notify as the default notification service
	vim.notify = require 'notify'
	-- Cokeline.nvim stuff
	require('cokeline').setup({})
	-- Setup LspKind
	local lspkind = require('lspkind')

	local source_mapping = {
		buffer = "[Buffer]",
		nvim_lsp = "[LSP]",
		nvim_lua = "[Lua]",
		cmp_tabnine = "[TN]",
		path = "[Path]",
	}
	-- Setup nvim-cmp
	local cmp = require'cmp'

	cmp.setup({
		snippet = {
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body)
				end,
			},
		mapping = {
			['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      			['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      			['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      			['<C-y>'] = cmp.config.disable,
      			['<C-e>'] = cmp.mapping({
        				i = cmp.mapping.abort(),
        				c = cmp.mapping.close(),
      			}),
      			['<CR>'] = cmp.mapping.confirm({ select = true }),
			},
		sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'vsnip' },
			{ name = 'cmp_tabnine' },
			{ name = 'orgmode' },
		},
		{ 
			{ name = 'buffer' },
			}),

		formatting = {
			format = function(entry, vim_item)
				vim_item.kind = lspkind.presets.default[vim_item.kind]
				local menu = source_mapping[entry.source.name]
				if entry.source.name == 'cmp_tabnine' then
					if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
						menu = entry.completion_item.data.detail .. ' ' .. menu
					end
					vim_item.kind = ''
				end
				vim_item.menu = menu
				return vim_item
			end
	},
	})

	-- Setup orgmode for nvim	
	local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
		parser_config.org = {
  			install_info = {
   			url = 'https://github.com/milisims/tree-sitter-org',
    			revision = 'main',
    			files = {'src/parser.c', 'src/scanner.cc'},
  		},
  		filetype = 'org',
	}

	require'nvim-treesitter.configs'.setup {
  		-- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  		highlight = {
    			enable = true,
    			disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    			additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  		},
  		ensure_installed = {'org'}, -- Or run :TSUpdate org
	}

	require('orgmode').setup({
  		 org_agenda_files = {'~/org/*', '~/my-orgs/**/*'},
 		 org_default_notes_file = '~/org/refile.org',
	})

	-- Setup lspconfig.
  	local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  	-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  	require'lspconfig'.eslint.setup {}
	require'lspconfig'.svelte.setup{}
	require'lspconfig'.cmake.setup{}

	-- Setup cmp_tabnine
	local tabnine = require('cmp_tabnine.config')
	tabnine:setup({
		max_lines = 1000;
		max_num_results = 10;
		sort = true;
		run_on_every_keystroke = true;
		snippet_placeholder = '..';
	})

	-- Setup which-key
	require("which-key").setup {}

	-- Setup nvim-tree
	require'nvim-tree'.setup {
  		disable_netrw       = true,
  		hijack_netrw        = true,
  		open_on_setup       = false,
  		ignore_ft_on_setup  = {},
  		auto_close          = false,
  		open_on_tab         = false,
  		hijack_cursor       = false,
  		update_cwd          = false,
  		update_to_buf_dir   = {
    		enable = true,
    		auto_open = true,
  		},
  		diagnostics = {
    			enable = false,
    			icons = {
      				hint = "",
      				info = "",
      				warning = "",
      				error = "",
    			}
  		},
  		update_focused_file = {
   			enable      = false,
    			update_cwd  = false,
    			ignore_list = {}
  		},
  		system_open = {
    			cmd  = nil,
    			args = {}
  		},
  		filters = {
    			dotfiles = false,
    			custom = {}
  		},
  		view = {
    			width = 30,
    			height = 30,
    			hide_root_folder = false,
    			side = 'left',
    			auto_resize = false,
   			mappings = {
      				custom_only = false,
      				list = {}
    			}
  		}
	}
	-- Config Autosave
	local autosave = require ("autosave")

	autosave.setup {
			enable = true,
			execution_message = "Saved Automaticly at :" .. vim.fn.strftime "%H:%M%S",
			events = { "InsertLeave", "TextChanged" },
			conditions = {
					exists = true,
					filetype_is_not = {},
					modifiable = true,
				},
			clean_command_line_interval = 2500,
			on_off_commands = true,
			write_all_buffers = false,
		}
	-- Config Notification service
	require("notify").setup({
  		-- Animation style (see below for details)
  			stages = "slide",

  		-- Function called when a new window is opened, use for changing win settings/config
  			on_open = nil,

  		-- Default timeout for notifications (3 secs)
  			timeout = 3000,

  		-- For stages that change opacity this is treated as the highlight behind the window
  		-- Set this to either a highlight group or an RGB hex value e.g. "#000000"
  			background_colour = "#414868",

  		-- Icons for the different levels
  			icons = {
    				ERROR = "",
    				WARN = "",
    				INFO = "",
    				DEBUG = "",
   				TRACE = "✎",
  			},
	})
	-- Start Colorizer
	require'colorizer'.setup()

	-- Start neoscroll
	require'neoscroll'.setup()
	
	-- Display Notification
	vim.notify("Welcome back, StationaryStation!")
EOF
