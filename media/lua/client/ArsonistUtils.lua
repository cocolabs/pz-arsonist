ArsonistUtils = {}

---Returns true if given item name matches designated name.
---The item script name (instead of display name) is used for comparison.
---@param item InventoryItem
---@param name String
---@return boolean
function ArsonistUtils.isItemName(item, name)
	return item ~= nil and item:getScriptItem():getName() == name
end