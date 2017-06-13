local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_POISONAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISON)

local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 30*1000)
condition:setFormula(0, -210, 0, -320)
combat:setCondition(condition)

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end