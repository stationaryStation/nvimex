"  _   _       _                     
" | \ | |_   _(_)_ __ ___   _____  __
" |  \| \ \ / / | '_ ` _ \ / _ \ \/ /
" | |\  |\ V /| | | | | | |  __/>  < 
" |_| \_| \_/ |_|_| |_| |_|\___/_/\_\ 
" -----------------------------------------
"  A neovim configuration file for Neovim.
"
"  Author: StationaryStation 
"  Version: 1.0.2
"
call plug#begin()

" StatusLine
Plug 'tamton-aquib/staline.nvim'
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
" Tabline (not to be confused with tabline)
Plug 'noib3/cokeline.nvim'
" Minimap
" Plug 'wfxr/minimap.vim'
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
" ScrollBar (Because why not)
Plug 'Xuyuanp/scrollbar.nvim'
" CheatSheet (for n00bs)
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'nvim-lua/popup.nvim'
" vscode-rename like interface for neovim
Plug 'filipdutescu/renamer.nvim'
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
" Set vim-clap as the default for dashboard 
let g:dashboard_default_executive ='telescope'
" Required for cokeline.nvim and nvim-tree
set termguicolors
" Show line numbers 
set number
" Set leader key from / to ;
let mapleader = ";"
" Change colorscheme to tokyonight
colorscheme tokyonight
" Configure scrollbar.nvim 
augroup ScrollbarInit
  autocmd!
  autocmd CursorMoved,VimResized,QuitPre * silent! lua require('scrollbar').show()
  autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
  autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
augroup end
" Configure minimap.vim (no longer needed)
"let g:minimap_width = 10
"let g:minimap_auto_start = 1
"let g:minimap_auto_start_win_enter = 1
"let g:minimap_close_filetypes = ['dashboard']
"let g:minimap_block_filetypes = ['fugitive', 'nerdtree', 'tagbar', 'NvimTree']
" nvim-cmp stuff (i have no idea what this does)
set completeopt=menu,menuone,noselect
" Add mouse support 
set mouse=a
" Disable word wrapping
set nowrap
" Keybindings
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" nnoremap <leader>mt :MinimapToggle<CR>
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
nnoremap <Leader>ld :Telescope lsp_definitions<CR>
nnoremap <leader>lr :Telescope lsp_references<CR>
nnoremap <leader>gs :Telescope git_status<CR>
nnoremap <leader>gb :Telescope git_branches<CR>
nnoremap <leader>gc :Telescope git_bcommits<CR>
nnoremap <leader>ls :Telescope lsp_document_symbols<CR>
nnoremap <leader>r :Telescope reloader<CR>
nnoremap <Leader>m :Telescope man_pages<CR>
inoremap <silent> <F2> <cmd>lua require('renamer').rename()<cr>
nnoremap <silent> <leader>rn <cmd>lua require('renamer').rename()<cr>
vnoremap <silent> <leader>rn <cmd>lua require('renamer').rename()<cr>
nnoremap <Leader>nt :tabedit ./<CR>
" cool Dashboard-nvim logo B)
let g:dashboard_custom_header =<< trim END
   ▐ ▄  ▌ ▐·▪  • ▌ ▄ ·. ▄▄▄ .▐▄• ▄ 
  •█▌▐█▪█·█▌██ ·██ ▐███▪▀▄.▀· █▌█▌▪
  ▐█▐▐▌▐█▐█•▐█·▐█ ▌▐▌▐█·▐▀▀▪▄ ·██· 
  ██▐█▌ ███ ▐█▌██ ██▌▐█▌▐█▄▄▌▪▐█·█▌
  ▀▀ █▪. ▀  ▀▀▀▀▀  █▪▀▀▀ ▀▀▀ •▀▀ ▀▀
        By: StationaryStation
END
" Disable tabline in the dashboard buffer
autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2

" Setup highlights for rename.nvim 
hi default link RenamerNormal Normal
hi default link RenamerBorder RenamerNormal
hi default link RenamerTitle Identifier

lua <<EOF

	-- Set nvim-notify as the default notification service
	vim.notify = require 'notify'
	-- Cokeline.nvim stuff
	require('cokeline').setup({})
	-- Configure Staline 
	require('staline').setup {
	defaults = {
		left_separator  = "",
		right_separator = "",
		line_column     = "[%l/%L] :%c 並%p%% ", -- `:h stl` to see all flags.
		fg              = "#1a1b26",  -- Foreground text color.
		bg              = "none",     -- Default background is transparent.
		cool_symbol     = " ",
		branch_symbol = " ", 
	},
	mode_colors = {
		n = "#2ac3de",
		i = "#9ece6a",
		c = "#f7768e",
		v = "#bb9af7",   -- etc..
	},
	mode_icons = {
		n = " ",
		i = " ",
		c = " ",
		v = " ",   -- etc..
	},
	sections = {
		left = { '- ', '-mode', '-file_name', 'left_sep_double', 'branch' },
		mid = { '  ', 'lsp_name' },
		right = { 'cool_symbol','right_sep_double', '-line_column' }
	}
}
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

	-- Setup linters for typescript, svelte, javascript and css files
  	local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  	capabilities.textDocument.completion.completionItem.snippetSupport = true
  	require'lspconfig'.eslint.setup {}
	require'lspconfig'.svelte.setup{}
	require'lspconfig'.cmake.setup{}
	require'lspconfig'.cssls.setup{
		capabilities = capabilities,
	}
	require'lspconfig'.emmet_ls.setup{}
	-- for tsserver to work you need the npm package for typescript and typescript-language-server to be installed plus a optional tsconfig.json
	require'lspconfig'.tsserver.setup{}

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
	-- Setup CheatSheet
	require"cheatsheet".setup({
    
		-- For generic cheatsheets like default, unicode, nerd-fonts, etc
    		bundled_cheatsheets = true,
    		-- bundled_cheatsheets = {
    		--     enabled = {},
    		--     disabled = {},
    		-- },

    		-- For plugin specific cheatsheets
    		bundled_plugin_cheatsheets = true,
    		-- bundled_plugin_cheatsheets = {
    		--     enabled = {},
    		--     disabled = {},
    		-- }

    		include_only_installed_plugins = true,
	})
	
	-- Config Telescope.nvim
	require('telescope').setup({
  		defaults = {
			previewer = true,
			file_previewer = require'telescope.previewers'.vim_buffer_cat.new, 
			grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
			qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    			layout_config = {
				vertical = { width = 0.5 }
   				 },
  			},
		pickers = {
    			find_files = {
      				theme = "dropdown",
    			}
  		},
	})
	-- Config Rename.nvim	
	local mappings_utils = require('renamer.mappings.utils')
	require('renamer').setup {
    		-- The popup title, shown if `border` is true
    		title = 'Rename',
   		 -- The padding around the popup content
    		padding = {
        		top = 0,
        		left = 0,
        		bottom = 0,
        		right = 0,
    		},
    		-- Whether or not to shown a border around the popup
    		border = true,
    		-- The characters which make up the border
    		border_chars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    		-- Whether or not to highlight the current word references through LSP
    		show_refs = true,
    		-- Whether or not to add resulting changes to the quickfix list
    		with_qf_list = true,
    		-- Whether or not to enter the new name through the UI or Neovim's `input`
    		-- prompt
   	 	with_popup = true,
    		-- The keymaps available while in the `renamer` buffer. The example below
    		-- overrides the default values, but you can add others as well.
    		mappings = {
        		['<c-i>'] = mappings_utils.set_cursor_to_start,
        		['<c-a>'] = mappings_utils.set_cursor_to_end,
        		['<c-e>'] = mappings_utils.set_cursor_to_word_end,
        		['<c-b>'] = mappings_utils.set_cursor_to_word_start,
        		['<c-c>'] = mappings_utils.clear_line,
        		['<c-u>'] = mappings_utils.undo,
        		['<c-r>'] = mappings_utils.redo,
    		},
	}
	
	-- Display Notification
	vim.notify("Welcome back, StationaryStation!")
EOF
