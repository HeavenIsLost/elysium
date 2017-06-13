local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_POISONAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISON)

local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 20*1000)
condition:setFormula(0, -120, 0, -200)
combat:setCondition(condition)

local area = createCombatArea(AREA_CIRCLE3X3)
combat:setArea(area)

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end