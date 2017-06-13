local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

local condition = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_TICKS, 5000)
condition:setParameter(CONDITION_PARAM_SKILL_DISTANCEPERCENT, 160)
condition:setParameter(CONDITION_PARAM_SKILL_SHIELDPERCENT, 160)
condition:setParameter(CONDITION_PARAM_SKILL_MELEEPERCENT, 160)
condition:setParameter(CONDITION_PARAM_SKILL_FISTPERCENT, 160)
combat:setCondition(condition)

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end