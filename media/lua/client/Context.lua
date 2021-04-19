--- Add context option to inventory menu.
---@param player Integer
---@param context ISContextMenu
---@param item InventoryItem
local function addContextOption(player, context, item)

	if item ~= nil then
		local playerObj = getSpecificPlayer(player)
		if Lighter.isEquipped(playerObj) and Lighter.canSetOnFire(item) then
			context:addOption(getText("Set on fire"), player, Lighter.dummy, playerObj);
		end
	end
end

Events.OnFillInventoryObjectContextMenu.Add(function(player, context, worldobjects)

	for _,k in pairs(worldobjects) do
		if instanceof(k, "InventoryItem") then
			addContextOption(player, context, k);
		elseif k.items and #k.items > 1 then
			addContextOption(player, context, k.items[1]);
		end
	end
end)

---Add context option to given world object.
---@param player Integer
---@param context ISContextMenu
---@param object IsoWorldInventoryObject
local function addWorldContextOption(player, context, object)

	---@type InventoryItem
	local item = object:getItem()

	if item ~= nil then
		if Lighter.isEquipped(getSpecificPlayer(player)) and Lighter.canSetOnFire(item) then
			context:addOption(getText("Set on fire"), player, Lighter.setWorldObjectOnFire, object);
		end
	end
end

Events.OnFillWorldObjectContextMenu.Add(function(player, context, worldobjects, _)

	for _,k in pairs(worldobjects) do
		if instanceof(k, "IsoWorldInventoryObject") then
			addWorldContextOption(player, context, k)
		elseif k.items and #k.items > 1 then
			addWorldContextOption(player, context, k.items[1]);
		end
	end
end)