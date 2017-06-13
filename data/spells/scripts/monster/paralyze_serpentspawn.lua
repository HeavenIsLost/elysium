local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_GREEN_RINGS)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISON)

local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 120*1000)
condition:setFormula(0, -110, 0, -150)
combat:setCondition(condition)

local area = createCombatArea(AREA_CIRCLE2X2)
combat:setArea(area)

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end