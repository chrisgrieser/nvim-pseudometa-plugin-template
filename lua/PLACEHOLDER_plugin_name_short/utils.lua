local M = {}
--------------------------------------------------------------------------------

---@param body string
---@param level? "info"|"trace"|"debug"|"warn"|"error"
---@param opts? table
function M.notify(body, level, opts)
	if not opts then opts = {} end
	if not level then level = "info" end

	local pluginName = "PLACEHOLDER_plugin_name_short"
	local notifyTitle = opts.title and pluginName .. ": " .. opts.title or pluginName

	vim.notify(vim.trim(body), vim.log.levels[level:upper()], { title = notifyTitle })
end

--------------------------------------------------------------------------------
return M
