local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONAREA)

local area = createCombatArea(AREA_CROSS5X5)
combat:setArea(area)

function onGetFormulaValues(player, level, maglevel)
	if (((level * 2) + (maglevel * 3)) * 2.3) < 250 then
		min = -250
	else
		min = -((level * 2) + (maglevel * 3)) * 2.3
	end
	if (((level * 2) + (maglevel * 3)) * 3) < 250 then
		max = -250
	else
		max = -((level * 2) + (maglevel * 3)) * 3
	end
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, var)
	-- check for stairHop delay
	if not getCreatureCondition(creature, CONDITION_PACIFIED) then
		return combat:execute(creature, var)
	else
		creature:sendCancelMessage(RETURNVALUE_YOUAREEXHAUSTED)
		creature:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end
end