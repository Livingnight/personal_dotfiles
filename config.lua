--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "tokyonight-moon"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
-- NOTE: Normal Mode

lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- NOTE: Telekasten
lvim.keys.normal_mode[",c"] = ":Telekasten show_calendar<cr>"
lvim.keys.normal_mode[",n"] = ":Telekasten find_notes<cr>"
lvim.keys.normal_mode["<C-n>"] = ":Telekasten panel<cr>"

-- NOTE:
lvim.keys.normal_mode["<C-p>"] = "<cmd>Telescope projects<CR>"

-- NOTE: Goto Preview
lvim.keys.normal_mode[".pd"] = "<cmd>lua require('goto-preview').goto_preview_definition()<CR>"
lvim.keys.normal_mode[".pt"] = "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>"
lvim.keys.normal_mode[".pi"] = "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>"
lvim.keys.normal_mode[".P"] = "<cmd>lua require('goto-preview').close_all_win()<CR>"
lvim.keys.normal_mode[".pr"] = "<cmd>lua require('goto-preview').goto_preview_references()<CR>"

-- NOTE: Insert Mode
lvim.keys.insert_mode["jk"] = "<ESC>"
lvim.keys.insert_mode["jj"] = "<ESC>"

--NOTE: Nvim Options
vim.o.timeoutlen = 300
vim.o.cmdheight = 0
vim.o.relativenumber = 1

vim.g.gitblame_enabled = 0

-- vim.opt.foldlevel = 3
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.pickers.find_files.previewer = nil
lvim.builtin.telescope.defaults.mappings = {
	-- for input mode
	i = {
		["<C-g>"] = actions.move_to_top,
		["<C-G>"] = actions.move_to_bottom,
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
		["<TAB>"] = actions.move_selection_next,
		["<S-TAB>"] = actions.move_selection_previous,
		["<C-n>"] = actions.cycle_history_next,
		["<C-p>"] = actions.cycle_history_prev,
		["<C-c>"] = actions.close,
	},
	-- for normal mode
	n = {
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
		["<TAB>"] = actions.move_selection_next,
		["<S-TAB>"] = actions.move_selection_previous,
		["<C-c>"] = actions.close,
	},
}

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"
lvim.builtin.treesitter.rainbow.enable = true

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["r"] = {
	name = "Replace",
	r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
	w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
	f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
}
lvim.builtin.which_key.mappings["g"] = {
	g = {
		name = "Git",
		g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
		l = { "<cmd>GitBlameToggle<CR>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		C = {
			"<cmd>Telescope git_bcommits<cr>",
			"Checkout commit(for current file)",
		},
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Git Diff",
		},
	},
}
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"tsx",
	"css",
	"rust",
	"java",
	"yaml",
	"vue",
	"html",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require("lvim.lsp.null-ls.formatters")
lvim.reload_config_on_save = true
formatters.setup({
	{ command = "black", filetypes = { "python" } },
	--   { command = "isort", filetypes = { "python" } },
	{
		command = "prettierd",
		extra_filetypes = { "telekasten" },
		env = {
			PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/linter-config/.prettierrc.json"),
		},
	},
	{ command = "stylua" },
	{ command = "clang-format" },
	{ command = "markdownlint" },
	{ command = "shfmt" },
	{ command = "sql-formatter" },
	--   {
	--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
	--     command = "prettier",
	--     ---@usage arguments to pass to the formatter
	--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
	--     extra_args = { "--print-with", "100" },
	--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
	--     filetypes = { "typescript", "typescriptreact" },
	--   },
})

-- -- set additional linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ command = "eslint_d" },
	--   { command = "flake8", filetypes = { "python" } },
	--   {
	--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
	--     command = "shellcheck",
	--     ---@usage arguments to pass to the formatter
	--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
	--     extra_args = { "--severity", "warning" },
	--   },
	--   {
	--     command = "codespell",
	--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
	--     filetypes = { "javascript", "python" },
	--   },
})

-- Additional Plugins
lvim.plugins = {
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"p00f/nvim-ts-rainbow",
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			})
		end,
	},
	{
		"tzachar/cmp-tabnine",
		run = "./install.sh",
		requires = "hrsh7th/nvim-cmp",
		event = "InsertEnter",
	},
	{
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({
				width = 120, -- Width of the floating window
				height = 25, -- Height of the floating window
				default_mappings = false, -- Bind default mappings
				debug = false, -- Print debug information
				opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
				post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
				resizing_mappings = true,
				references = {
					telescope = require("telescope.themes").get_dropdown({ hide_preview = false }),
				},
				-- You can use "default_mappings = true" setup option
				-- Or explicitly set keybindings
				-- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
				-- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
				-- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
			})
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").on_attach()
		end,
	},
	{
		"karb94/neoscroll.nvim",
		event = "WinScrolled",
		config = function()
			require("neoscroll").setup({
				-- All these keys will be mapped to their corresponding default scrolling animation
				mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>" },
				hide_cursor = true, -- Hide cursor while scrolling
				stop_eof = true, -- Stop at <EOF> when scrolling downwards
				use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
				respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
				cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
				easing_function = nil, -- Default easing function
				pre_hook = nil, -- Function to run before the scrolling animation starts
				post_hook = nil, -- Function to run after the scrolling animation ends
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		config = function()
			require("todo-comments").setup()
		end,
	},
	{
		"renerocksai/telekasten.nvim",
		requires = {
			{ "nvim-telescope/telescope-symbols.nvim" },
			{ "nvim-telescope/telescope-media-files.nvim" },
			{ "mattn/calendar-vim" },
			{ "seebye/ueberzug" },
			{ "dirkvdb/ffmpegthumbnailer" },
		},
		setup = function()
			local home = vim.fn.expand("~/notes")

			local status_ok, telekasten = pcall(require, "telekasten")

			if not status_ok then
				return
			end

			-- NOTE for Windows users:
			-- - don't use Windows
			-- - try WSL2 on Windows and pretend you're on Linux
			-- - if you **must** use Windows, use "/Users/myname/zettelkasten" instead of "~/zettelkasten"
			-- - NEVER use "C:\Users\myname" style paths
			-- - Using `vim.fn.expand("~/zettelkasten")` should work now but mileage will vary with anything outside of finding and opening files
			telekasten.setup({
				home = home,

				-- if true, telekasten will be enabled when opening a note within the configured home
				take_over_my_home = true,

				-- auto-set telekasten filetype: if false, the telekasten filetype will not be used
				--                               and thus the telekasten syntax will not be loaded either
				auto_set_filetype = true,

				-- dir names for special notes (absolute path or subdir name)
				dailies = home .. "/" .. "daily",
				weeklies = home .. "/" .. "weekly",
				templates = home .. "/" .. "templates",

				-- image (sub)dir for pasting
				-- dir name (absolute path or subdir name)
				-- or nil if pasted images shouldn't go into a special subdir
				image_subdir = "img",

				-- markdown file extension
				extension = ".md",

				-- Generate note filenames. One of:
				-- "title" (default) - Use title if supplied, uuid otherwise
				-- "uuid" - Use uuid
				-- "uuid-title" - Prefix title by uuid
				-- "title-uuid" - Suffix title with uuid
				new_note_filename = "title",
				-- file uuid type ("rand" or input for os.date()")
				uuid_type = "%Y%m%d%H%M",
				-- UUID separator
				uuid_sep = "-",

				-- following a link to a non-existing note will create it
				follow_creates_nonexisting = true,
				dailies_create_nonexisting = true,
				weeklies_create_nonexisting = true,

				-- skip telescope prompt for goto_today and goto_thisweek
				journal_auto_open = false,

				-- template for new notes (new_note, follow_link)
				-- set to `nil` or do not specify if you do not want a template
				template_new_note = home .. "/" .. "templates/new_note.md",

				-- template for newly created daily notes (goto_today)
				-- set to `nil` or do not specify if you do not want a template
				template_new_daily = home .. "/" .. "templates/daily.md",

				-- template for newly created weekly notes (goto_thisweek)
				-- set to `nil` or do not specify if you do not want a template
				template_new_weekly = home .. "/" .. "templates/weekly.md",

				-- image link style
				-- wiki:     ![[image name]]
				-- markdown: ![](image_subdir/xxxxx.png)
				image_link_style = "markdown",

				-- default sort option: 'filename', 'modified'
				sort = "filename",

				-- integrate with calendar-vim
				plug_into_calendar = true,
				calendar_opts = {
					-- calendar week display mode: 1 .. 'WK01', 2 .. 'WK 1', 3 .. 'KW01', 4 .. 'KW 1', 5 .. '1'
					weeknm = 4,
					-- use monday as first day of week: 1 .. true, 0 .. false
					calendar_monday = 1,
					-- calendar mark: where to put mark for marked days: 'left', 'right', 'left-fit'
					calendar_mark = "left-fit",
				},

				-- telescope actions behavior
				close_after_yanking = false,
				insert_after_inserting = true,

				-- tag notation: '#tag', ':tag:', 'yaml-bare'
				tag_notation = "#tag",

				-- command palette theme: dropdown (window) or ivy (bottom panel)
				command_palette_theme = "dropdown",

				-- tag list theme:
				-- get_cursor: small tag list at cursor; ivy and dropdown like above
				show_tags_theme = "dropdown",

				-- when linking to a note in subdir/, create a [[subdir/title]] link
				-- instead of a [[title only]] link
				subdirs_in_links = true,

				-- template_handling
				-- What to do when creating a new note via `new_note()` or `follow_link()`
				-- to a non-existing note
				-- - prefer_new_note: use `new_note` template
				-- - smart: if day or week is detected in title, use daily / weekly templates (default)
				-- - always_ask: always ask before creating a note
				template_handling = "smart",

				-- path handling:
				--   this applies to:
				--     - new_note()
				--     - new_templated_note()
				--     - follow_link() to non-existing note
				--
				--   it does NOT apply to:
				--     - goto_today()
				--     - goto_thisweek()
				--
				--   Valid options:
				--     - smart: put daily-looking notes in daily, weekly-looking ones in weekly,
				--              all other ones in home, except for notes/with/subdirs/in/title.
				--              (default)
				--
				--     - prefer_home: put all notes in home except for goto_today(), goto_thisweek()
				--                    except for notes with subdirs/in/title.
				--
				--     - same_as_current: put all new notes in the dir of the current note if
				--                        present or else in home
				--                        except for notes/with/subdirs/in/title.
				new_note_location = "smart",

				-- should all links be updated when a file is renamed
				rename_update_links = true,

				vaults = {
					vault2 = {
						-- alternate configuration for vault2 here. Missing values are defaulted to
						-- default values from telekasten.
						-- e.g.
						-- home = "/home/user/vaults/personal",
					},
				},

				-- how to preview media files
				-- "telescope-media-files" if you have telescope-media-files.nvim installed
				-- "catimg-previewer" if you have catimg installed
				media_previewer = "telescope-media-files",
			})
		end,
	},
	{
		"tpope/vim-surround",
	},
	{
		"ggandor/lightspeed.nvim",
		event = "BufRead",
	},
	{
		"kevinhwang91/nvim-bqf",
		event = { "BufRead", "BufNew" },
		config = function()
			require("bqf").setup({
				auto_enable = true,
				preview = {
					win_height = 12,
					win_vheight = 12,
					delay_syntax = 80,
					border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
				},
				func_map = {
					vsplit = "",
					ptogglemode = "z,",
					stoggleup = "",
				},
				filter = {
					fzf = {
						action_for = { ["ctrl-s"] = "split" },
						extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
					},
				},
			})
		end,
	},
	{
		"windwp/nvim-spectre",
		event = "BufRead",
		config = function()
			require("spectre").setup({
				color_devicons = true,
				highlight = {
					ui = "String",
					search = "DiffChange",
					replace = "DiffDelete",
				},
				mapping = {
					["toggle_line"] = {
						map = "t",
						cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
						desc = "toggle current item",
					},
					["enter_file"] = {
						map = "<cr>",
						cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
						desc = "goto current file",
					},
					["send_to_qf"] = {
						map = "Q",
						cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
						desc = "send all item to quickfix",
					},
					["replace_cmd"] = {
						map = "c",
						cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
						desc = "input replace vim command",
					},
					["show_option_menu"] = {
						map = "o",
						cmd = "<cmd>lua require('spectre').show_options()<CR>",
						desc = "show option",
					},
					["run_replace"] = {
						map = "R",
						cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
						desc = "replace all",
					},
					["change_view_mode"] = {
						map = "m",
						cmd = "<cmd>lua require('spectre').change_view()<CR>",
						desc = "change result view mode",
					},
					["toggle_ignore_case"] = {
						map = "I",
						cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
						desc = "toggle ignore case",
					},
					["toggle_ignore_hidden"] = {
						map = "H",
						cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
						desc = "toggle search hidden",
					},
					-- you can put your mapping here it only use normal mode
				},
				find_engine = {
					-- rg is map with finder_cmd
					["rg"] = {
						cmd = "rg",
						-- default args
						args = {
							"--color=never",
							"--no-heading",
							"--with-filename",
							"--line-number",
							"--column",
						},
						options = {
							["ignore-case"] = {
								value = "--ignore-case",
								icon = "[I]",
								desc = "ignore case",
							},
							["hidden"] = {
								value = "--hidden",
								desc = "hidden file",
								icon = "[H]",
							},
							-- you can put any option you want here it can toggle with
							-- show_option function
						},
					},
					["ag"] = {
						cmd = "ag",
						args = {
							"--vimgrep",
							"-s",
						},
						options = {
							["ignore-case"] = {
								value = "-i",
								icon = "[I]",
								desc = "ignore case",
							},
							["hidden"] = {
								value = "--hidden",
								desc = "hidden file",
								icon = "[H]",
							},
						},
					},
				},
				replace_engine = {
					["sed"] = {
						cmd = "sed",
						args = nil,
					},
					options = {
						["ignore-case"] = {
							value = "--ignore-case",
							icon = "[I]",
							desc = "ignore case",
						},
					},
				},
				default = {
					find = {
						--pick one of item in find_engine
						cmd = "rg",
						options = { "ignore-case" },
					},
					replace = {
						--pick one of item in replace_engine
						cmd = "sed",
					},
				},
				replace_vim_cmd = "cdo",
				is_open_target_win = true, --open file on opener window
				is_insert_mode = false, -- start open panel on is_insert_mode
			})
		end,
	},
	{
		"f-person/git-blame.nvim",
		event = "BufRead",
		config = function()
			vim.cmd("highlight default link gitblame SpecialComment")
			vim.g.gitblame_enabled = 0
		end,
	},
	{
		"anuvyklack/pretty-fold.nvim",
		config = function()
			require("pretty-fold").setup({
				sections = {
					left = {
						"content",
					},
					right = {
						" ",
						"number_of_folded_lines",
						": ",
						"percentage",
						" ",
						function(config)
							return config.fill_char:rep(3)
						end,
					},
				},
				fill_char = "•",

				remove_fold_markers = true,

				-- Keep the indentation of the content of the fold string.
				keep_indentation = true,

				-- Possible values:
				-- "delete" : Delete all comment signs from the fold string.
				-- "spaces" : Replace all comment signs with equal number of spaces.
				-- false    : Do nothing with comment signs.
				process_comment_signs = "spaces",

				-- Comment signs additional to the value of `&commentstring` option.
				comment_signs = {},

				-- List of patterns that will be removed from content foldtext section.
				stop_words = {
					"@brief%s*", -- (for C++) Remove '@brief' and all spaces after.
				},

				add_close_pattern = true, -- true, 'last_line' or false

				matchup_patterns = {
					{ "{", "}" },
					{ "%(", ")" }, -- % to escape lua pattern char
					{ "%[", "]" }, -- % to escape lua pattern char
				},

				ft_ignore = { "neorg" },
			})
		end,
	},
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = {
		"Jaq",
		"qf",
		"help",
		"man",
		"lspinfo",
		"spectre_panel",
		"lir",
		"DressingSelect",
		"tsplayground",
		"Markdown",
	},
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR> 
      nnoremap <silent> <buffer> <esc> :close<CR> 
      set nobuflisted 
    ]])
	end,
})

-- local parsers = {
-- 	"bash",
-- 	"bibtex",
-- 	"c",
-- 	"cmake",
-- 	"comment",
-- 	"cpp",
-- 	"css",
-- 	"dockerfile",
-- 	"fennel",
-- 	"fish",
-- 	"go",
-- 	"graphql",
-- 	"html",
-- 	"http",
-- 	"java",
-- 	"javascript",
-- 	"jsdoc",
-- 	"json",
-- 	"jsonc",
-- 	"latex",
-- 	"lua",
-- 	"make",
-- 	"ninja",
-- 	"nix",
-- 	"norg",
-- 	"org",
-- 	"perl",
-- 	"php",
-- 	"python",
-- 	"r",
-- 	"rasi",
-- 	"regex",
-- 	"ruby",
-- 	"rust",
-- 	"scss",
-- 	"tsx",
-- 	"typescript",
-- 	"vim",
-- 	"vue",
-- 	"xml",
-- 	"yaml",
-- 	"zig",
-- }

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*" },
	callback = function()
		vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		vim.opt.foldlevel = 3
		vim.opt.foldmethod = "expr"
		vim.cmd("normal zx")
	end,
})

-- local function nvim_create_augroup(definitions)
-- 	for group_name, definition in pairs(definitions) do
-- 		vim.api.nvim_command("augroup " .. group_name)
-- 		vim.api.nvim_command("autocmd!")
-- 		for _, def in ipairs(definition) do
-- 			local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
-- 			vim.api.nvim_command(command)
-- 		end
-- 		vim.api.nvim_command("augroup END")
-- 	end
-- end

-- local autoCommands = {
-- 	-- other autocommands
-- 	open_folds = {
-- 		{ "BufReadPost", "FileReadPost", "*", "normal zR" },
-- 	},
-- }

-- nvim_create_augroup(autoCommands)
