if vim.loader then
	vim.loader.enable()
end

-- _G.dd = function(...)
--     require("util.debug").dump(...)
-- end
-- vim.print = _G.dd

_G.Duckuments = require("duckuments.utils")
require("duckuments.config.options")
require("duckuments.config.keymaps")
require("duckuments.config.autocmds")
require("duckuments.config.commands")
require("duckuments.config.workarounds")
require("duckuments.plugins")
