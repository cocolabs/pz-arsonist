require 'ArsonistUtils'

Lighter = {}

---Returns true if Lighter item can set the given item on fire.
---Items like literature, clothing and campfire fule are considered flammable.
---@param item InventoryItem
---@return boolean
function Lighter.canSetOnFire(item)

	--literature and clothing burns
	if item:IsLiterature() or item:IsClothing() then
		return true
	end
	--store here every camping fuel
	local fuelTypes = {}
	for k,v in pairs(campingFuelType) do fuelTypes[k] = v end
	for k,v in pairs(campingLightFireType) do fuelTypes[k] = v end

	local itemName = item:getScriptItem():getName()
	for k,_ in pairs(fuelTypes) do
		if (itemName == k) then
			return true
		end
	end
	return false
end

---Returns true if Lighter item is equipped in player primary or secondary hand.
---@param player IsoGameCharacter
---@return boolean
function Lighter.isEquipped(player)

	local prim = player:getPrimaryHandItem()
	local sec = player:getSecondaryHandItem()
	return ArsonistUtils.isItemName(prim, "Lighter") or ArsonistUtils.isItemName(sec, "Lighter")
end

---Starts a fire on the location of given world object.
---@param object IsoObject
function Lighter.setWorldObjectOnFire(_, object)
	--print('setting on fire object at [x:' .. object:getX() .. ", y:" .. object:getY())
	IsoFireManager.StartFire(object:getCell(), object:getSquare(), true, 100, 700)
end

function Lighter.dummy(_, object)

end