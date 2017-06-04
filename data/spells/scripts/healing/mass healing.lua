local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

local area = createCombatArea(AREA_CIRCLE3X3)
combat:setArea(area)

function onGetFormulaValues(player, level, maglevel)
	if (((level * 2) + (maglevel * 3)) * 1.2) < 200 then
		min = 200
	else
		min = ((level * 2) + (maglevel * 3)) * 1.2
	end
	if (((level * 2) + (maglevel * 3)) * 1.5) < 250 then
		max = 250
	else
		max = ((level * 2) + (maglevel * 3)) * 1.5
	end
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, var)
	return combat:execute(creature, var)
end
