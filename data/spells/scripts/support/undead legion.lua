local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)

local area = createCombatArea(AREA_CIRCLE3X3)
combat:setArea(area)

function onTargetCorpse(player, pos)
	local getPos = pos
	getPos.stackpos = 255
	corpse = getThingfromPos(getPos)
	if(corpse.uid > 0 and isCreature(corpse.uid) == FALSE and isInArray(CORPSES, corpse.itemid)) then
		doRemoveItem(corpse.uid)
		local monster = Game.createMonster("Skeleton", pos)
		monster:setMaster(player)
	end
end
combat:setCallback(CALLBACK_PARAM_TARGETTILE, "onTargetCorpse")

function onCastSpell(creature, var)
	return combat:execute(creature, var)
end