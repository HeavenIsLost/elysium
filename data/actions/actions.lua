dofile('data/actions/actionSystem.lua')

local toLoad = {
	"new/foods.lua",
	"new/quest_chest.lua",
}

--USE, IsType (Obj1,2948) -> Effect(Obj1,19)

--examples

-- the only condition is the position
-- better than using an action id or unique id on a certain item in that position
USE(
	CONDITION(
		IsPosition(ACTIONVAR_OBJ1, 32369, 32241, 7)
	),
	
	ACTION(
		EffectAction(ACTIONVAR_OBJ1, CONST_ME_FERUMBRAS)
	)
)

local function ChangeUse(changeUseTarget)
	return function(vars, fromPosition, isHotkey)
		local item = vars[ACTIONVAR_OBJ1]
		
		item:transform(changeUseTarget)
		
		return true
	end
end

--general purpuse actions

for _, itemType in ipairs(GetAllItemTypes()) do
	if itemType:isChangeUse() then
		local changeUseTarget = itemType:getChangeUseTarget()
		if changeUseTarget ~= 0 then
			USE(
				CONDITION(
					IsType(ACTIONVAR_OBJ1, itemType:getId())
				),
				
				ACTION(
					ChangeUse(changeUseTarget)
				)
			)
		end
	end
end

for _, scriptName in ipairs(toLoad) do
	dofile('data/actions/scripts/' .. scriptName)
end

print('Actions loaded!!!')
