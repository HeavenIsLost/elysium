local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)

local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 30*1000)
condition:setFormula(0, -100, 0, -180)
combat:setCondition(condition)

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end