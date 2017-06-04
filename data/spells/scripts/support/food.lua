local food = {
	3577, -- meat
	3582, -- ham
	3592, -- grape
	3585, -- apple
	3600, -- bread
	3601, -- roll
	3607  -- cheese
}

function onCastSpell(creature, var)
	creature:addItem(food[math.random(#food)])
	if math.random(1, 100) > 50 then
		creature:addItem(food[math.random(#food)])
	end

	creature:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	return true
end