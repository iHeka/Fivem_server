MSCore = nil

TriggerEvent('MSCore:GetObject', function(obj) MSCore = obj end)

MSCore.Commands.Add("me", "Character interactions", {}, false, function(source, args)
	local text = table.concat(args, ' ')
	local Player = MSCore.Functions.GetPlayer(source)
	TriggerClientEvent('3dme:triggerDisplay', -1, text, source)
    TriggerEvent("ms-log:server:CreateLog", "me", "Me", "white", "**"..GetPlayerName(source).."** (CitizenID: "..Player.PlayerData.citizenid.." | ID: "..source..")** " ..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.. " **" ..text, false)
end)