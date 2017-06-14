ACTIONVAR_USER = 1
ACTIONVAR_OBJ1 = 2
ACTIONVAR_OBJ2 = 3
ACTIONBAR_TEMP = 4
ACTIONVAR_USERPOS = 5
ACTIONVAR_OBJ1POS = 6
ACTIONVAR_OBJ2POS = 7
ACTIONVAR_OBJ2TYPE = 8
ACTIONVAR_OBJ1ID = 9

ActionSystem = {
	actionList = {},
}

function ActionSystem:executeConditions(conditionList, vars, fromPosition, isHotkey)
	if #conditionList == 0 then
		return true
	end
	
	for _, func in ipairs(conditionList) do
		if not func(vars, fromPosition, isHotkey) then
			return false
		end
	end
	
	return true
end

function ActionSystem:executeActions(actionList, vars, fromPosition, isHotkey)
	for _, func in ipairs(actionList) do
		if not func(vars, fromPosition, isHotkey) then
			return false
		end
	end
	
	return true
end

function ActionSystem:doActionList(list, vars, fromPosition, isHotkey)
	for _, data in ipairs(list) do
		if self:executeConditions(data.conditions, vars, fromPosition, isHotkey) then
			if self:executeActions(data.actions, vars, fromPosition, isHotkey) then
				return true
			end	
		end		
	end
	
	return false
end

function ActionSystem:getActions(whichObjectId, list, id)
	return list[whichObjectId][id]
end

function ActionSystem:onUseEventCallback(player, item, playerPosition, itemPosition, fromPosition, target, toPosition, isHotkey)
	local itemId = item:getId()
	local actionId = item:getActionId()
	local uniqueId = item:getAttribute(ITEM_ATTRIBUTE_UNIQUEID)	
	
	local vars = {
		[ACTIONVAR_USER] = player,
		[ACTIONVAR_OBJ1] = item,
		[ACTIONVAR_OBJ1POS] = itemPosition,	
		[ACTIONVAR_OBJ1ID] = itemId,
		[ACTIONVAR_OBJ2] = target,
		[ACTIONVAR_OBJ2POS] = toPosition,
		
	}
	
	for _, data in ipairs(self.actionList) do
		if self:executeConditions(data.conditions, vars, fromPosition, isHotkey) then
			if self:executeActions(data.actions, vars, fromPosition, isHotkey) then
				return true
			end	
		end	
	end
	
	return false
end

function ActionSystem:convertObjVarToPosVar(var)
	if var == ACTIONVAR_OBJ1 then
		var = ACTIONVAR_OBJ1POS
	end
	
	return var
end

function ActionSystem:convertObjVarToItemId(var)
	if var == ACTIONVAR_OBJ1 then
		var = ACTIONVAR_OBJ1ID
	end
	
	return var
end

-- functions to be used in actions.lua 

function CONDITION(...)
	return {...}
end

function ACTION(...)
	return {...}
end

function USE(conditions, actions)
	local data = {conditions = conditions, actions = actions}
	
	table.insert(ActionSystem.actionList, data)
end

-- CONDITIONS/ACTIONS

function IsType(var, id)
	local targetVar = ActionSystem:convertObjVarToItemId(var)
	
	return function(vars)
		return (vars[targetVar] == id)
	end
end

function IsActionId(var, id)
	return function(vars)
		return (vars[var]:getActionId() == id)
	end
end

function IsUniqueId(var, id)
	return function(vars)
		return (vars[var]:getUniqueId() == id)
	end
end

function IsPosition(target, x, y, z)
	local p = Position(x, y, z)
	local posVar = ActionSystem:convertObjVarToPosVar(target)
		
	return function(vars, fromPosition, isHotkey)
		return (vars[posVar] == p)
	end
end

function EffectAction(target, effect)
	local posVar = ActionSystem:convertObjVarToPosVar(target)
		
	return function(vars, fromPosition, isHotkey)
		vars[posVar]:sendMagicEffect(effect)
		return true
	end
end



