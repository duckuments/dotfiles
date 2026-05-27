return {
	-- incremental rename
	{
		"smjonas/inc-rename.nvim",
		cmd = "increname",
		config = true,
	},

	-- go forward/backward with square brackets
	{
		"nvim-mini/mini.bracketed",
		event = "bufreadpost",
		config = function()
			local bracketed = require("mini.bracketed")
			bracketed.setup({
				file = { suffix = "" },
				window = { suffix = "" },
				quickfix = { suffix = "" },
				yank = { suffix = "" },
				treesitter = { suffix = "n" },
			})
		end,
	},

	-- better increase/descrease
	{
		"monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<c-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "increment" },
      { "<c-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "decrement" },
    },
		config = function()
			local augend = require("dial.augend")
			require("dial.config").augends:register_group({
				default = {
					augend.integer.alias.decimal,
					augend.integer.alias.hex,
					augend.date.alias["%y/%m/%d"],
					augend.constant.alias.bool,
					augend.semver.alias.semver,
					augend.constant.new({ elements = { "let", "const" } }),
				},
			})
		end,
	},

	-- copilot
	{
		"zbirenbaum/copilot.lua",
		opts = {
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<c-l>",
					accept_word = "<m-l>",
