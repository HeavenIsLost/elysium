function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end
	
	saveServer()

	return false
end
