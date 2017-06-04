local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)

local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 10000)
condition:setFormula(-1.0, 0, -1.0, 0)
combat:setCondition(condition)

function onCastSpell(creature, var)
	if not combat:execute(creature, var) then
		return false
	end

	creature:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	return true
end
