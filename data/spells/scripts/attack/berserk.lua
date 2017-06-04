local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)

local area = createCombatArea(AREA_SQUARE1X1)
combat:setArea(area)

function onGetFormulaValues(player, level, maglevel)
	min = -(level * 2.2)
	max = -(level * 3.85)
--	min = -((level * 2) + (maglevel * 3)) * 1.4
--	max = -((level * 2) + (maglevel * 3)) * 1.65
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
