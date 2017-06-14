local foods = {
	[2362] = {5, "Crunch."}, -- carrot
	[3577] = {15, "Munch."}, -- meat
	[3578] = {12, "Munch."}, -- fish
	[3579] = {10, "Mmmm."}, -- salmon
	[3580] = {17, "Munch."}, -- northern pike
	[3581] = {4, "Gulp."}, -- shrimp
	[3582] = {30, "Chomp."}, -- ham
	[3583] = {60, "Chomp."}, -- dragon ham
	[3584] = {5, "Yum."}, -- pear
	[3585] = {6, "Yum."}, -- red apple
	[3586] = {13, "Yum."}, -- orange
	[3587] = {8, "Yum."}, -- banana
	[3588] = {1, "Yum."}, -- blueberry
	[3589] = {18, "Slurp."}, -- coconut
	[3590] = {1, "Yum."}, -- cherry
	[3591] = {2, "Yum."}, -- strawberry
	[3592] = {9, "Yum."}, -- grapes
	[3593] = {20, "Yum."}, -- melon
	[3594] = {17, "Munch."}, -- pumpkin
	[3595] = {5, "Crunch."}, -- carrot
	[3596] = {6, "Munch."}, -- tomato
	[3597] = {9, "Crunch."}, -- corncob
	[3598] = {2, "Crunch."}, -- cookie
	[3599] = {2, "Munch."}, -- candy cane
	[3600] = {10, "Crunch."}, -- bread
	[3601] = {3, "Crunch."}, -- roll
	[3602] = {8, "Crunch."}, -- brown bread
	[3606] = {6, "Gulp."}, -- egg
	[3607] = {9, "Smack."}, -- cheese
	[2787] = {9, "Munch."}, -- white mushroom
	[3723] = {4, "Munch."}, -- red mushroom
	[3724] = {22, "Munch."}, -- brown mushroom
	[3725] = {30, "Munch."}, -- orange mushroom
	[3727] = {9, "Munch."}, -- wood mushroom
	[3728] = {6, "Munch."}, -- dark mushroom
	[3729] = {12, "Munch."}, -- some mushrooms
	[3730] = {3, "Munch."}, -- some mushrooms
	[3731] = {36, "Munch."}, -- fire mushroom
	[3732] = {5, "Munch."}, -- green mushroom
}

function onUseFood(vars, fromPosition, isHotkey)
	local itemId = vars[ACTIONVAR_OBJ1ID]
	local player = vars[ACTIONVAR_USER]
	local item = vars[ACTIONVAR_OBJ1]
	local toPosition = fromPosition
	
	local food = foods[itemId]
	if not food then
		return false
	end

	local condition = player:getCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)
	if condition and math.floor(condition:getTicks() / 1000 + (food[1] * 12)) >= 1200 then
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "You are full.")
	else
		player:feed(food[1] * 12)
		player:say(food[2], TALKTYPE_MONSTER_SAY)
		item:remove(1)
	end
	
	return true
end

for foodItemId, _ in pairs(foods) do
	USE(
		CONDITION(
			IsType(ACTIONVAR_OBJ1, foodItemId)
		),
		
		ACTION(
			onUseFood
		)
	)
end
