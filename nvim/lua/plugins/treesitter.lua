return {
	{ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },

	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = function()
			-- Alternative build method
			local ok, _ = pcall(vim.cmd, "TSUpdate")
			if not ok then
				vim.notify("TSUpdate failed, trying manual installation", vim.log.levels.WARN)
				-- Fallback: install essential parsers one by one
				local essential_parsers = { "lua", "vim", "vimdoc", "json", "javascript", "typescript" }
				for _, parser in ipairs(essential_parsers) do
					pcall(vim.cmd, "TSInstall " .. parser)
				end
			end
		end,
		opts = {
			-- Reduce the parser list to only essential ones initially
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"json",
				"javascript",
				"typescript",
				"html",
				"css",
				"markdown",
				"markdown_inline",
			},

			-- Disable auto installation temporarily
			auto_install = false,
			sync_install = false,

			-- Add ignore_install to skip problematic parsers
			ignore_install = { "jsonc" },

			highlight = {
				enable = true,
				-- Disable for jsonc files temporarily
				disable = function(lang, buf)
					if lang == "jsonc" then
						return true
					end
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
			},

			-- https://github.com/nvim-treesitter/playground#query-linter
			query_linter = {
				enable = true,
				use_virtual_text = true,
				lint_events = { "BufWrite", "CursorHold" },
			},

			playground = {
				enable = true,
				disable = {},
				updatetime = 25,
				persist_queries = true,
				keybindings = {
					toggle_query_editor = "o",
					toggle_hl_groups = "i",
					toggle_injected_languages = "t",
					toggle_anonymous_nodes = "a",
					toggle_language_display = "I",
					focus_language = "f",
					unfocus_language = "F",
					update = "R",
					goto_node = "<cr>",
					show_help = "?",
				},
			},
		},
		config = function(_, opts)
			local ok, treesitter = pcall(require, "nvim-treesitter.configs")
			if not ok then
				vim.notify("nvim-treesitter not found!", vim.log.levels.ERROR)
				return
			end

			treesitter.setup(opts)

			-- MDX
			vim.filetype.add({
				extension = {
					mdx = "mdx",
				},
			})
			vim.treesitter.language.register("markdown", "mdx")

			-- Add a command to retry problematic parsers later
			vim.api.nvim_create_user_command("TSInstallJsonc", function()
				vim.cmd("TSInstall jsonc")
			end, {})
		end,
	},
}
