local M = {}
--------------------------------------------------------------------------------

---@param body string
---@param level? "info"|"trace"|"debug"|"warn"|"error"
---@param title? string
function M.notify(body, level, title)
	local pluginName = "PLACEHOLDER_plugin_name_short"
	local notifyTitle = title and pluginName .. ": " .. title or pluginName
	if not level then level = "info" end
	vim.notify(vim.trim(body), vim.log.levels[level:upper()], { title = notifyTitle })
end

--------------------------------------------------------------------------------
return M
