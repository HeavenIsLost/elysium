local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_GREEN_RINGS)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISON)

local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 15*1000)
condition:setFormula(0, -80, 0, -240)

local area = createCombatArea(AREA_CIRCLE2X2)
combat:setArea(area)
combat:setCondition(condition)

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end