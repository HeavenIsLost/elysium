function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end	
	
	if not param or (param == "") then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "It need at least one parameter.")
		return false
	end

	local t = param:split(",")

	local toPlayer = Player(t[1])
	
	if not toPlayer then
		--global storage
		if tonumber(t[1]) then
			if not t[2] then
				local valueGlobalStorage = Game.getStorageValue(tonumber(t[1]))
				if not valueGlobalStorage then
					valueGlobalStorage = -1
				end
				
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE," [" .. "Global Storage" .. " - " .. t[1] .. "] = " .. valueGlobalStorage )
			else
				if not tonumber(t[2]) then
					player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Storage value must be a number.")	
					return false
				end
				
				Game.setStorageValue(tonumber(t[1]), tonumber(t[2])) 
				
				if not valueGlobalStorage then
					valueGlobalStorage = -1
				end
				
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE," [" .. "Global Storage" .. " - " .. t[1] .. "] = " .. valueGlobalStorage )
			end
			
			return false
		end
		
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Player " .. t[1] .. " not found.")
		return false
	end
	
	if not tonumber(t[2]) then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Storage key must be a number.")	
		return false
	end

	if not t[3] then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE," [" .. t[1] .. " - " .. t[2] .. "] = " .. player:getStorageValue(tonumber(t[2])))
	else
		if not tonumber(t[3])  then
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Storage value must be a number.")	
			return false
		end
		
		player:setStorageValue(tonumber(t[2]), tonumber(t[3]))
		
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE," [" .. t[1] .. " - " .. t[2] .. "] = " .. player:getStorageValue(tonumber(t[2])))
	end

	return false
end
