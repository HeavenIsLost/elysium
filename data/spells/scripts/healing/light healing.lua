local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

function onGetFormulaValues(player, level, maglevel)
	if (((level * 2) + (maglevel * 3)) * 0.1) < 20 then
		min = 20
	else
		min = ((level * 2) + (maglevel * 3)) * 0.1
	end
	if (((level * 2) + (maglevel * 3)) * 0.35) < 25 then
		max = 25
	else
		max = ((level * 2) + (maglevel * 3)) * 0.35
	end
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, var)
	return combat:execute(creature, var)
end
