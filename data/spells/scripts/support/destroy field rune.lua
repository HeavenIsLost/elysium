function onCastSpell(creature, var)
	local position = variantToPosition(var)
	local tile = Tile(position)
	local items = tile and tile:getItems()
	local removed = false

	for k, item in pairs(items) do
		if item and isInArray(FIELDS, item:getId()) then
			item:remove()
			removed = true
		end
	end
	
	if removed then
		position:sendMagicEffect(CONST_ME_POFF)
		return true
	end

	creature:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
	creature:getPosition():sendMagicEffect(CONST_ME_POFF)
	return false
end
