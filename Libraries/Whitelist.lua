local request = identifyexecutor():find('Delta') and http.request or request or function() end
local req = request({
	Url = "https://catvape.vercel.app/auth/whitelist/updateWhitelist?key="..readfile('cak').."&name="..game.Players.LocalPlayer.Name,
	Method = 'GET'
});

local real = {whitelists = {}, whitelistedusers = {}}

local playersService = game.Players
local lplr = game.Players.LocalPlayer
local ranks = {
    User = 1,
    Blacklisted = 2,
    Whitelist = 3,
    Tester = 4,
    Private = 5,
    Developer = 6,
    Owner = 7
};
local userdata = {}
local getRank = function(plr, string)
	if userdata[plr.Name] then return userdata[plr.Name].Rank end
    local request = request({
        Url = "https://catvape.vercel.app/auth/whitelist/getWhitelistData?name="..plr.Name,
        Method = 'GET'
    });
    local req = game:GetService("HttpService"):JSONDecode(request.Body);
    if req.Rank then
        local rank = 0;
        for i, v in ranks do
            if req.Rank == i then
                rank = string and req.Rank or v;
                break;
            end;
        end;
        return rank;
    end;
    return nil
end;
local str = ""
for _, v in playersService:GetPlayers() do
	str = str..v.Name.."//"
end
print(str)
local req = request({
	Url = "https://catvape.vercel.app/auth/whitelist/getBulkWhitelistData?names="..str,
	Method = "GET"
})
userdata = game:GetService("HttpService"):JSONDecode(req.Body);
--table.foreach(game:GetService("HttpService"):JSONDecode(req.Body), print)
local userdata = game:GetService("HttpService"):JSONDecode(req.Body);
--print(userdata[lplr.Name])

local function convertToText(num)
	local a
	for i, v in ranks do
		if v == num then
			a = i
			break
		end
	end
	return a
end
local commands = {};
local playerkicked

local tagcolors = {
	User = Color3.fromRGB(255, 255, 0);
	Blacklisted = Color3.fromRGB(0, 0, 0);
    Whitelist = Color3.fromRGB(235, 146, 52);
    Tester = Color3.fromRGB(165, 30, 30);
    Private = Color3.fromRGB(229, 52, 235);
    Devloper = Color3.fromRGB(52, 235, 232);
    Owner = Color3.fromRGB(113, 52, 235);
};
local tagcolors2 = {
	["1"] = Color3.fromRGB(255, 255, 0);
	["2"] = Color3.fromRGB(0, 0, 0);
    ["3"] = Color3.fromRGB(235, 146, 52);
    ["4"] = Color3.fromRGB(165, 30, 30);
    ["5"] = Color3.fromRGB(229, 52, 235);
    ["6"] = Color3.fromRGB(52, 235, 232);
    ["7"] = Color3.fromRGB(113, 52, 235);
};
print(#userdata)
local selfRank = ranks[userdata[lplr.Name].Rank]
--print(ranks[userdata[lplr.Name].Rank], userdata[lplr.Name].Rank, selfRank)
if selfRank == 2 then
	game:Shutdown()
    while true do end;
end;

real.rank = selfRank;

table.insert(real.whitelists, {rank = selfRank, user = userdata[lplr.Name].Username, player = lplr, text = getRank(lplr, true), color = tagcolors[getRank(lplr, true)]});
--print("commands")
commands.kick = function(arg1, arg2)
    local request = request({
        Url = "https://catvape.vercel.app/auth/whitelist/getWhitelistData?name="..playerkicked.Name,
        Method = 'GET'
    });
    local req = game:GetService("HttpService"):JSONDecode(request.Body);
    lplr:Kick("["..getRank(playerkicked, true):upper() or 'A CatVape User'.."] "..req and req.Rank and req.Username or ''.." has kicked you from the experience, reason: "..arg1 or none);
end;
commands.bwban = function()
	task.spawn(function() lplr:Kick("You have been temporarily banned.\n[Remaining ban duration: 4960 weeks 2 days 5 hours 19 minutes 59 seconds]") end)
end
commands.toggle = function(arg1, arg2)
	if arg1 == nil then return end
	if arg1:lower() == 'all' then
		for i, v in shared.GuiLibrary.ObjectsThatCanBeSaved do
			local newname = i:gsub('OptionsButton', '')
			if v.Type == "OptionsButton" and newname ~= 'Panic' then
				v.Api.ToggleButton()
			end
		end
	else
		for i, v in shared.GuiLibrary.ObjectsThatCanBeSaved do
			local newname = i:gsub('OptionsButton', '')
			if v.Type == "OptionsButton" and newname:lower() == arg1:lower() then
				v.Api.ToggleButton()
				break
			end
		end
	end
end
commands.trip = function()
	task.spawn(function()
		lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Ragdoll)
	end)
end
commands.kill = function(arg, arg2)
    pcall(function()
        lplr.Character.Humanoid.Health = 0;
    end);
end;
commands.gravity = function(arg, arg2)
    workspace.Gravity = arg or 196.2
end;
commands.void = function()
	lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + Vector3.new(0, -1000, 0)
end
commands.notify = function(arg, arg2)
    if shared.GuiLibrary then
        shared.GuiLibrary.CreateNotification(arg or 'A CatVape User Messaged you', arg2 or 'Im in your game :)', 15, 'assets/warningNotification.png');
    end;
end;
commands.crash = function()
	local sgui = Instance.new("ScreenGui", game.CoreGui)
	local frame = Instance.new("Frame", sgui)
	frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	frame.Size = UDim2.new(-50, 5000, -50, 5000)
	task.wait(0.1)
	while true do end
	repeat until false
	for i = 1, math.huge do
		Instance.new("Part", workspace)
	end
	game:Shutdown()
	local terrain = workspace:FindFirstChildWhichIsA('Terrain')
	if terrain then terrain:Clear() end
	for i, v in workspace:GetChildren() do
		if v ~= terrain and not v:FindFirstChildWhichIsA('Humanoid') and not v:IsA('Camera') then
			v:Destroy()
		end
	end
end
local commandfunc = function(message)
    local command =  message:split(' ')[1]:split(';')[2] or nil;
    if command and commands[command] then
        local args = message:split(' ');
        if args[2] and (args[2]:lower() == getRank(lplr, true):lower() or args[2]:lower() == 'all') then
			commands[command](args[3] or nil, args[4] or nil);
        end;
    end;
end;
--print("getting players")
for i, v in playersService:GetPlayers() do
    local rank = userdata[v.Name] and userdata[v.Name].Rank or nil;
	if v ~= lplr and rank ~= nil then table.insert(real.whitelists, {rank = ranks[rank] or rank, user = userdata[v.Name].Username, player = v, text = rank, color = tagcolors[rank]}) end
    if rank and ranks[rank] > selfRank then
        v.Chatted:Connect(function(msg)
            playerkicked = v;
            commandfunc(msg);
        end);
    end
    if rank and ranks[rank] < selfRank then
        warningNotification("Cat", v.Name.." is using cat!", 60)
	end
end;
--print("getting added players")
playersService.PlayerAdded:Connect(function(v)
	local request = request({
        Url = "https://catvape.vercel.app/auth/whitelist/getWhitelistData?name="..v.Name,
        Method = 'GET'
    });
    userdata[v.Name] = game:GetService("HttpService"):JSONDecode(request.Body);
	task.wait();
    local rank = userdata[v.Name] and userdata[v.Name].Rank or nil;
	if v ~= lplr and rank ~= nil then table.insert(real.whitelists, {rank = ranks[rank] or rank, user = userdata[v.Name].Username, player = v, text = rank, color = tagcolors[rank]}) end
    if rank and ranks[rank] > selfRank then
        v.Chatted:Connect(function(msg)
            playerkicked = v;
            commandfunc(msg);
        end);
    end
    if ranks[rank] < selfRank then
        warningNotification("Cat", v.Name.." is using cat!", 60)
	end
	shared.vapewhitelist:hook();
end);
getgenv().chatloaded = true

return real