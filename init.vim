"  _   _       _
" | \ | |_   _(_)_ __ ___   _____  __
" |  \| \ \ / / | '_ ` _ \ / _ \ \/ /
" | |\  |\ V /| | | | | | |  __/>  < 
" |_| \_| \_/ |_|_| |_| |_|\___/_/\_\ 
" -----------------------------------------
"  A neovim configuration file for Neovim.
"
"  Author: StationaryStation 
"  Version: 1.0.3
"

" Install vim-plug automatically for managing and updating plugins
" Only works on linux
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif 


"Install plugins
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
" Discord Rich Precence :flushed:
Plug 'andweeb/presence.nvim'
" Clipboard Plugin 
Plug 'AckslD/nvim-neoclip.lua'
Plug 'tami5/sqlite.lua'
" Session autosave plugin 
Plug 'thaerkh/vim-workspace'
" Floating Terminal 
Plug 'numToStr/FTerm.nvim'
" Lightspeed (haha neovim go woosh!)
Plug 'ggandor/lightspeed.nvim'
Plug 'tpope/vim-repeat'

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

" Set nvim-telescope as the default for dashboard 
let g:dashboard_default_executive ='telescope'

" Required for cokeline.nvim and nvim-tree
set termguicolors

" Show line numbers 
set number


" Change colorscheme to tokyonight
colorscheme tokyonight

" Configure scrollbar.nvim 
augroup ScrollbarInit
  autocmd!
  autocmd CursorMoved,VimResized,QuitPre * silent! lua require('scrollbar').show()
  autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
  autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
augroup end

" nvim-cmp stuff (i have no idea what this does)
set completeopt=menu,menuone,noselect

" Add mouse support 
set mouse=a

" Disable word wrapping
set nowrap

" Keybindings
" By default the leader key is set to ';'
" Change mapleader's string to the key you want (Example: let mapleader = '<Space>')
let mapleader = ';'
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
nmap <Leader>s :ToggleWorkspace<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>vc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>fn :DashboardNewFile<CR>
nnoremap <silent> <Leader>h :Dashboard<CR>
nnoremap <Leader>ld :Telescope lsp_definitions<CR>
nnoremap <leader>lr :Telescope lsp_references<CR>
nnoremap <leader>gs :Telescope git_status<CR>
nnoremap <leader>gb :Telescope git_branches<CR>
nnoremap <leader>gc :Telescope git_bcommits<CR>
nnoremap <leader>ls :Telescope lsp_document_symbols<CR>
nnoremap <leader>cr :Telescope reloader<CR>
nnoremap <Leader>m :Telescope man_pages<CR>
inoremap <silent> <F2> <cmd>lua require('renamer').rename()<cr>
nnoremap <silent> <leader>rn <cmd>lua require('renamer').rename()<cr>
nnoremap <Leader>nt :tabedit ./<CR>
nnoremap <Leader>ch :Telescope neoclip<CR>
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>tt :FTerm<CR>
nnoremap <leader>tx :FTermClose<CR>
nnoremap <leader>to :FTermOpen<CR>
nnoremap <leader>gp :gitpush<CR>
nnoremap <leader>ce :edit ~/.config/nvim/init.vim<cr>
" cool Dashboard-nvim logo B)
let g:dashboard_custom_header =<< trim END

   ▐ ▄  ▌ ▐·▪  • ▌ ▄ ·. ▄▄▄ .▐▄• ▄ 
  •█▌▐█▪█·█▌██ ·██ ▐███▪▀▄.▀· █▌█▌▪
  ▐█▐▐▌▐█▐█•▐█·▐█ ▌▐▌▐█·▐▀▀▪▄ ·██· 
  ██▐█▌ ███ ▐█▌██ ██▌▐█▌▐█▄▄▌▪▐█·█▌
  ▀▀ █▪. ▀  ▀▀▀▀▀  █▪▀▀▀ ▀▀▀ •▀▀   

END

" vim-workspace configuration 
let g:workspace_autocreate = 1 
let g:workspace_autosave_ignore = ['gitcommit', 'dashboard']
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_session_name = 'session.vim'
let g:workspace_create_new_tabs = 1

" Disable tabline in the dashboard buffer
autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2

" Setup highlights for rename.nvim 
hi default link RenamerNormal Normal
hi default link RenamerBorder RenamerNormal
hi default link RenamerTitle Identifier

lua <<EOF
	-- Make local variable for FTerm 
	local fterm = require('FTerm')
	-- Set nvim-notify as the default notification service
	vim.notify = require 'notify'
	-- Cokeline.nvim stuff
	require('cokeline').setup({})
	-- Configure Staline 
	require('staline').setup {
	defaults = {
		left_separator  = "",
		right_separator = "",
		line_column     = "[%l/%L] :%c 並%p%% ", -- `:h stl` to see all flags.
		fg              = "#1a1b26",
		bg              = "none",
		cool_symbol     = " NvimEX 1.0.3",
		branch_symbol = " ", 
	},
	-- TODO Make these colors change according to the colorscheme 
	mode_colors = {
		n = "#2ac3de",
		i = "#9ece6a",
		c = "#f7768e",
		v = "#bb9af7",
	},
	mode_icons = {
		n = " ",
		i = " ",
		c = " ",
		v = " ",   -- etc..
	},
	sections = {
		left = { '- ', '-mode', '-file_name', 'left_sep_double', 'branch' },
		mid = { 'right_sep_double', '- ', '-lsp', '- ', 'left_sep_double' },
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
	-- Disable lspconfig for cmake if you are having trobules on windows.
	require'lspconfig'.cmake.setup{}
	require'lspconfig'.cssls.setup{
		capabilities = capabilities,
	}
	-- You need to install the emmet language server from npm (npm install -g emmet-ls)
	require'lspconfig'.emmet_ls.setup{}
	-- for tsserver to work you need the npm package for typescript and typescript-language-server to be installed (npm install -g typescript-language-server typescript) plus a optional tsconfig.json
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
    			enable = true,
    			icons = {
      				hint = "",
      				info = "",
      				warning = "",
      				error = "",
    			}
  		},
  		update_focused_file = {
   			enable      = true,
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
    			auto_resize = true,
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
	require("presence"):setup({
  	  	-- General options
    		auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
    		neovim_image_text   = "NeoVim Extended 1.0.3", -- Text displayed when hovered over the Neovim image
    		main_image          = "file",                   -- Main image display (either "neovim" or "file")
    		client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
    		log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    		debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    		enable_line_number  = false,                      -- Displays the current line number instead of the current project
    		blacklist           = {"dashboard", "vim-plug"},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    		buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)

    		-- Rich Presence text options
    		editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    		file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    		git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    		plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    		reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    		workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    		line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
	})
	-- Setup nvim-neoclip 
	require('telescope').load_extension('neoclip')
	require('neoclip').setup({
      		history = 1000,
     		enable_persistant_history = false,
      		db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
      		filter = nil,
      		preview = true,
      		default_register = '"',
      		content_spec_column = false,
      		on_paste = {
        		set_reg = false,
      		},
      		keys = {
        		i = {
          			select = '<cr>',
          			paste = '<c-p>',
          			paste_behind = '<c-k>',
          			custom = {},
        		},
        		n = {
          			select = '<cr>',
          			paste = '<leader>cp',
          			paste_behind = '<leader>cP',
          			custom = {},
        		},
      		},
    	})
	fterm.setup({
    		border = 'double',
    		dimensions  = {
        		height = 0.9,
        		width = 0.9,
    		},
	})
	-- Create FTerm Commands for vim 
	vim.cmd('command! FTermOpen lua require("FTerm").open()')
	vim.cmd('command! FTermClose lua require("FTerm").close()')
	vim.cmd('command! FTermExit lua require("FTerm").exit()')
	vim.cmd('command! FTermClose lua require("FTerm").toggle()')
	vim.cmd('command! GitPush lua require("FTerm").scratch({ cmd = "git push"})')
	-- Display Notification
	vim.notify("Welcome back, StationaryStation!")
EOF
