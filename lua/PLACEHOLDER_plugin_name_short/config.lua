local M = {}
--------------------------------------------------------------------------------

---@class PLACEHOLDER_plugin_name_short.config
local defaultConfig = {
	enabled = true,
}

---@type PLACEHOLDER_plugin_name_short.config
M.config = defaultConfig

--------------------------------------------------------------------------------

---@param userConfig? PLACEHOLDER_plugin_name_short.config
M.setup = function(userConfig)
	M.config = vim.tbl_deep_extend("force", defaultConfig, userConfig or {})
end

--------------------------------------------------------------------------------
return M
