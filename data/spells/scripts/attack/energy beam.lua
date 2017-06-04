local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONHIT)

local area = createCombatArea(AREA_BEAM5, AREADIAGONAL_BEAM5)
combat:setArea(area)

function onGetFormulaValues(player, level, maglevel)
	min = -((level * 2) + (maglevel * 3)) * 0.68
	max = -((level * 2) + (maglevel * 3)) * 1.3
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
