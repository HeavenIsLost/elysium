local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_LOSEENERGY)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_TICKS, 40000)
condition:setParameter(CONDITION_PARAM_SKILL_DISTANCEPERCENT, 50)
condition:setParameter(CONDITION_PARAM_SKILL_SHIELDPERCENT, 50)
condition:setParameter(CONDITION_PARAM_SKILL_MELEEPERCENT, 50)
condition:setParameter(CONDITION_PARAM_SKILL_FISTPERCENT, 50)
combat:setCondition(condition)

local area = createCombatArea(AREA_CIRCLE3X3)
combat:setArea(area)

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end