local M = {}
--------------------------------------------------------------------------------

---@class PLACEHOLDER_plugin_name_short_capitalized.config
local defaultConfig = {
	enabled = true,
}

M.config = defaultConfig

--------------------------------------------------------------------------------

---@param userConfig? PLACEHOLDER_plugin_name_short_capitalized.config
M.setup = function(userConfig)
	M.config = vim.tbl_deep_extend("force", defaultConfig, userConfig or {})
end

--------------------------------------------------------------------------------
return M
