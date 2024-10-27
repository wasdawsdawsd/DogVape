--[[
                                                                                                                                                                                                        
                                                                                                                                                                                                        
                                                                                                                                                                                                        
                                                                                                                                                                                                        
                                                                                                                                                                                                        
                                                                                                                                                                                                        
                                                                                                                                                                                                        
                                                                                                                                                                                                        
                                                                                                                                                                                                        
                                                                                                                                                                                                        
                                                                                                                                                                                                        
                                                                                                                                                                                                        
                                                                                                                                                                                                        
                                                                                                                                                                                                        
                                                                                                                                                                                                        
                           .^~!77777!!~^.                                  ^~~~~^.                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^                                                                
                       :7YG#&@@@@@@@@@&&BPJ!.                            .J#&&&&&5:                :B@&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&G:                                                               
                    .!5#@@@@@@@@@@@@@@@@@@@@BJ^                          7#@@@@@@&Y.               :#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@B:                                                               
                   !G&@@@@@@&BG5YJY55G#&@@@@@@#?.                       ~B@@@@@@@@&7               .5BBBBBBBBBBBBB&@@@@@@&BBBBBBBBBBBBB5:                                                               
                 :Y&@@@@@@G?^.        :~Y&@@@@@@5:                     ^G@@@@@@@@@@#!                ........... :G@@@@@@5: ...........                                                                 
                :P@@@@@@#?.              7#@@@@@@5:                   :P@@@@@&&@@@@@B^                           .G@@@@@@5.                                                                             
               .Y&@@@@@B~                 !#@@@@@&7.                 .J&@@@@&J7#@@@@@P:                          .G@@@@@@5.                                                                             
               ~#@@@@@&7                  .5&@@@@@P:                 ?&@@@@@5. ?&@@@@@Y.                         .G@@@@@@5.                                                                             
              .5&@@@@@G:                   :!7777!~.                !#@@@@@G^  .5@@@@@&?.                        .G@@@@@@5.                                                                             
              .G@@@@@&J.                                           ^G@@@@@#~    :G@@@@@#!  :::::::.              :G@@@@@@Y. :::::::::.          ::::::::::::::::.       :::::::::::::::::::             
              .B@@@@@&?.                                          :P@@@@@&?      ~B@@@@@B~:Y######5^            .7#@@@@@#!.7G#######BY:        :5##############BG5?^.  ~G#################P^            
              :B@@@@@&?.                                         .Y&@@@@@Y.       7&@@@@@G^~G@@@@@&Y:           !B@@@@@#?:!B@@@@@@@@@&J.       :P@@@@@@@@@@@@@@@@@@#Y^ ~B@@@@@@@@@@@@@@@@@B~            
              :B@@@@@&?.                                         ?&@@@@@P:        .Y&@@@@@5:~G@@@@@&J.         ~B@@@@@&J:~G@@@@@@@@@@@#?.      :P@@@@@&P55555PB@@@@@@P^~B@@@@@BP5555555555J:            
              .G@@@@@&Y.                                        !#@@@@@#!..........^G@@@@@&J.!B@@@@@#?.       ^G@@@@@&Y:~G@@@@@&B&@@@@@#7.     :P@@@@@B~      ^5&@@@@&?!B@@@@&Y:                        
              .P@@@@@@P:                                       ~B@@@@@@&BBBBBBBBBBBB#@@@@@@&7.7#@@@@@#7.     ^P&@@@@&5^^P@@@@@&5~?#@@@@@B!     :P@@@@@B~      :Y&@@@@&?!B@@@@@G?!!!!!!!!~.              
              .?&@@@@@#~                   7PGGGGGY:          :P@@@@@@@@@@@@@@@@@@@@@@@@@@@@#~.?#@@@@@B!    :5&@@@@@P^:5&@@@@@P^ .J#@@@@@G~    :P@@@@@B~!YYYYPB&@@@@@G~~B@@@@@@@@@@@@@@@G:              
               :G@@@@@@G^                 ^B@@@@@@Y.         .5@@@@@@&&&&&&&&&&&&&&&&&&@@@@@@G^.J&@@@@@B~  :Y&@@@@@G~:Y&@@@@@G!!JY5#@@@@@@G~   :P@@@@@B!J&@@@@@@@@@&5~ ~B@@@@@@@@@@@@@@@P:              
                !#@@@@@@5:               :5&@@@@@B~         .J&@@@@@B~::::::::::::::::^P@@@@@@P::Y&@@@@@P~.J&@@@@@B!:J#@@@@@B!!B@@@@@@@@@@@P^  :P@@@@@B!?#&&&&##BPJ~.  ~B@@@@@GJ???????7~.              
                 7B@@@@@@G!.            ~P@@@@@@#!          7#@@@@@#!                  :G@@@@@&Y.:5&@@@@@PY#@@@@@B7.?#@@@@@B7~P&&&&&&&@@@@@&5: :P@@@@@B~:^^^^^^:.      ~B@@@@&Y.                        
                  ^P@@@@@@&BY7~^:::^~7JP&@@@@@@G~          ~B@@@@@&?.                   ~#@@@@@&7 ^P@@@@@@@@@@@@#7.7#@@@@@#?.:^~~~~~~7G@@@@@&J::P@@@@@B~               ~B@@@@@GJ??????????!.            
                   .7G&@@@@@@@@&&&&&@@@@@@@@@BJ:          :G@@@@@@Y.                     ?&@@@@@#! ~G@@@@@@@@@@&?:!B@@@@@#J.          !B@@@@@&J^Y&@@@@B~               ~B@@@@@@@@@@@@@@@@@B^            
                     .~YG&@@@@@@@@@@@@@@@&B57:           :P@@@@@@G:                      .Y@@@@@@B~ !G&&&&&&&@#J:~P&@&&&#J:            !B&&&&&#?~P&&&&G~               ~B&&&&&&&&&&&&&&&@&G^            
                        .^!?YPPPPPPPPP5J7~.              :J55555Y^                        .J55555Y!  ^~~~~~~~~~. :~~~~~~~.              ^~~~~~~^.:~~~~~.               .~~~~~~~~~~~~~~~~~~~.            
                                                                                                                                                                                                        
                                                                                                                                                                                                        
				catvape/CustomModules/893973440.lua
				by qwerty real realreal!!!
]]
local vape = vape
local GuiLibrary = vape.gui
local players = game:GetService("Players")
local textservice = game:GetService("TextService")
local lplr = players.LocalPlayer
local workspace = game:GetService("Workspace")
local lighting = game:GetService("Lighting")
local cam = workspace.CurrentCamera
local targetinfo = shared.VapeTargetInfo
local uis = game:GetService("UserInputService")
local repstorage = game:GetService("ReplicatedStorage")
local localmouse = lplr:GetMouse()
local requestfunc = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or getgenv().request or request
local getasset = getsynasset or getcustomasset

local RenderStepTable = {}
local StepTable = {}

local function BindToRenderStep(name, num, func)
	if RenderStepTable[name] == nil then
		RenderStepTable[name] = game:GetService("RunService").RenderStepped:connect(func)
	end
end
local function UnbindFromRenderStep(name)
	if RenderStepTable[name] then
		RenderStepTable[name]:Disconnect()
		RenderStepTable[name] = nil
	end
end

local function BindToStepped(name, num, func)
	if StepTable[name] == nil then
		StepTable[name] = game:GetService("RunService").Stepped:connect(func)
	end
end
local function UnbindFromStepped(name)
	if StepTable[name] then
		StepTable[name]:Disconnect()
		StepTable[name] = nil
	end
end

local function warningNotification(title, text, delay)
	pcall(function()
		local frame = GuiLibrary["CreateNotification"](title, text, delay, "assets/WarningNotification.png")
		frame.Frame.BackgroundColor3 = Color3.fromRGB(236, 129, 44)
		frame.Frame.Frame.BackgroundColor3 = Color3.fromRGB(236, 129, 44)
	end)
end

local function friendCheck(plr, recolor)
	return (recolor and GuiLibrary["ObjectsThatCanBeSaved"]["Recolor visualsToggle"]["Api"]["Enabled"] or (not recolor)) and GuiLibrary["ObjectsThatCanBeSaved"]["Use FriendsToggle"]["Api"]["Enabled"] and table.find(GuiLibrary["ObjectsThatCanBeSaved"]["FriendsListTextCircleList"]["Api"]["ObjectList"], plr.Name) and GuiLibrary["ObjectsThatCanBeSaved"]["FriendsListTextCircleList"]["Api"]["ObjectListEnabled"][table.find(GuiLibrary["ObjectsThatCanBeSaved"]["FriendsListTextCircleList"]["Api"]["ObjectList"], plr.Name)]
end

local function getPlayerColor(plr)
	return (friendCheck(plr, true) and Color3.fromHSV(GuiLibrary["ObjectsThatCanBeSaved"]["Friends ColorSliderColor"]["Api"]["Hue"], GuiLibrary["ObjectsThatCanBeSaved"]["Friends ColorSliderColor"]["Api"]["Sat"], GuiLibrary["ObjectsThatCanBeSaved"]["Friends ColorSliderColor"]["Api"]["Value"]) or tostring(plr.TeamColor) ~= "White" and plr.TeamColor.Color)
end

local function getcustomassetfunc(path)
	if not isfile(path) then
		spawn(function()
			local textlabel = Instance.new("TextLabel")
			textlabel.Size = UDim2.new(1, 0, 0, 36)
			textlabel.Text = "Downloading "..path
			textlabel.BackgroundTransparency = 1
			textlabel.TextStrokeTransparency = 0
			textlabel.TextSize = 30
			textlabel.Font = Enum.Font.SourceSans
			textlabel.TextColor3 = Color3.new(1, 1, 1)
			textlabel.Position = UDim2.new(0, 0, 0, -36)
			textlabel.Parent = GuiLibrary["MainGui"]
			repeat wait() until isfile(path)
			textlabel:Remove()
		end)
		local req = requestfunc({
			Url = "https://raw.githubusercontent.com/qwertyui-is-back/UpdatedV4ForBW/main/"..path:gsub("vape/assets", "assets"),
			Method = "GET"
		})
		writefile(path, req.Body)
	end
	return getasset(path) 
end

shared.vapeteamcheck = function(plr)
	return (GuiLibrary["ObjectsThatCanBeSaved"]["Teams by colorToggle"]["Api"]["Enabled"] and (plr.Team ~= lplr.Team or (lplr.Team == nil or #lplr.Team:GetPlayers() == #game:GetService("Players"):GetChildren())) or GuiLibrary["ObjectsThatCanBeSaved"]["Teams by colorToggle"]["Api"]["Enabled"] == false)
end

local function targetCheck(plr, check)
	return (check and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("ForceField") == nil or check == false)
end

local function isAlive(plr)
	if plr then
		return plr and plr.Character and plr.Character.Parent ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("Humanoid")
	end
	return lplr and lplr.Character and lplr.Character.Parent ~= nil and lplr.Character:FindFirstChild("HumanoidRootPart") and lplr.Character:FindFirstChild("Head") and lplr.Character:FindFirstChild("Humanoid")
end

local function isPlayerTargetable(plr, target, friend)
    return plr ~= lplr and plr and (friend and friendCheck(plr) == nil or (not friend)) and isAlive(plr) and targetCheck(plr, target) and shared.vapeteamcheck(plr)
end

local function vischeck(char, part)
	return not unpack(cam:GetPartsObscuringTarget({lplr.Character[part].Position, char[part].Position}, {lplr.Character, char}))
end

local function runcode(func)
	func()
end

local function GetAllNearestHumanoidToPosition(player, distance, amount)
	local returnedplayer = {}
	local currentamount = 0
    if isAlive() then
        for i, v in pairs(players:GetChildren()) do
            if isPlayerTargetable((player and v or nil), true, true) and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") and currentamount < amount then
                local mag = (lplr.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude
                if mag <= distance then
                    table.insert(returnedplayer, v)
					currentamount = currentamount + 1
                end
            end
        end
	end
	return returnedplayer
end

local function GetNearestHumanoidToPosition(player, distance)
	local closest, returnedplayer = distance, nil
    if isAlive() then
        for i, v in pairs(players:GetChildren()) do
            if isPlayerTargetable((player and v or nil), true, true) and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") then
                local mag = (lplr.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude
                if mag <= closest then
                    closest = mag
                    returnedplayer = v
                end
            end
        end
	end
	return returnedplayer
end

local function GetNearestHumanoidToMouse(player, distance, checkvis)
    local closest, returnedplayer = distance, nil
    if isAlive() then
        for i, v in pairs(players:GetChildren()) do
            if isPlayerTargetable((player and v or nil), true, true) and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") and (checkvis == false or checkvis and (vischeck(v.Character, "Head") or vischeck(v.Character, "HumanoidRootPart"))) then
                local vec, vis = cam:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
                if vis then
                    local mag = (uis:GetMouseLocation() - Vector2.new(vec.X, vec.Y)).magnitude
                    if mag <= closest then
                        closest = mag
                        returnedplayer = v
                    end
                end
            end
        end
    end
    return returnedplayer
end

local function CalculateObjectPosition(pos)
	local newpos = cam:WorldToViewportPoint(cam.CFrame:pointToWorldSpace(cam.CFrame:pointToObjectSpace(pos)))
	return Vector2.new(newpos.X, newpos.Y)
end

local function CalculateLine(startVector, endVector, obj)
	local Distance = (startVector - endVector).Magnitude
	obj.Size = UDim2.new(0, Distance, 0, 2)
	obj.Position = UDim2.new(0, (startVector.X + endVector.X) / 2, 0, ((startVector.Y + endVector.Y) / 2) - 36)
	obj.Rotation = math.atan2(endVector.Y - startVector.Y, endVector.X - startVector.X) * (180 / math.pi)
end

local function findTouchInterest(tool)
	for i,v in pairs(tool:GetDescendants()) do
		if v:IsA("TouchTransmitter") then
			return v
		end
	end
	return nil
end

local store = {
    beast = nil,
    gamebeast = nil,
    map = "nil",
    computers = 0,
    status = "spawn",
    gamestatus = "GAME OVER",
    ingame = false,
    timer = 0,
    escaped = false,
    captured = false,
    progress = 0,
    cancrawl = true,
    caninteract = true,
    isCaptured = function(plr)
    	plr = plr or lplr
    	return plr.TempPlayerStatsModule.Captured.Value
    end,
    autowinComps = 0
}

local function getAllTargets(range, captured)
	range = range or 9e9
	captured = captured or false
	local targets = {}
	for i,v in players:GetPlayers() do
		if isAlive(v) and isAlive(lplr) and v ~= lplr then
			local mag = (lplr.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude
			if mag <= range then
				if captured then
					
					if not store.isCaptured(v) then
						table.insert(targets, v)
					end
				else
					table.insert(targets, v)
				end
			end
		end
	end
	return targets
end

local run = runcode

task.spawn(function()
    local teams = game:GetService("Teams")
    if not teams:FindFirstChild("Survivors") then
        local Survivors = Instance.new("Team", teams)
        Survivors.Name = "Survivors"
        Survivors.TeamColor = BrickColor.new("Bright blue")
        Survivors.AutoAssignable = true
    end
    if not teams:FindFirstChild("Beast") then
        local Beast = Instance.new("Team", teams)
        Beast.Name = "Beast"
        Beast.TeamColor = BrickColor.new("Bright red")
        Beast.AutoAssignable = true
    end
    local survivor = teams.Survivors
    local beast = teams.Beast
    local connection = players.PlayerAdded:Connect(function(p)
        p.Team = survivor
    end)
    BindToStepped("Update",1,function()
        local status = "spawn"
        if repstorage.GameTimer.Value == 0 or repstorage.GameStatus.Value:lower():find("game over") then
            status = "spawn"
            store.beast = nil
        end
        if repstorage.GameStatus.Value:lower():find("computers") or repstorage.GameStatus.Value:lower() == "15 sec head start" or repstorage.IsGameActive.Value then
            status = "computers"
        end
        if repstorage.GameStatus.Value:lower():find("exit") then
            status = "exits"
        end
        store.gamebeast = lplr.TempPlayerStatsModule.IsBeast.Value
        store.map = repstorage.CurrentMap.Value
        if store.map == nil then
        	store.autowinComps = 0
        end
        store.computers = repstorage.ComputersLeft.Value
        store.status = status
        store.gamestatus = repstorage.GameStatus.Value
        store.ingame = repstorage.IsGameActive.Value
        store.timer = repstorage.GameTimer.Value
        store.escaped = lplr.TempPlayerStatsModule.Escaped.Value
        store.captured = lplr.TempPlayerStatsModule.Captured.Value
        store.progress = lplr.TempPlayerStatsModule.ActionProgress.Value * 100
        store.cancrawl = lplr.TempPlayerStatsModule.DisableCrawl.Value
        store.caninteract = lplr.TempPlayerStatsModule.DisableInteraction
        for i,v in players:GetPlayers() do
            if v.Character == nil then return end
            pcall(function()
                if store.timer > 0 then
                    if v.Character:FindFirstChild("BeastPowers") == nil then
                        v.Team = survivor
                    else
                        v.Team = beast
                        store.beast = v
                        if v.Name ~= lplr.Name then
                            if v.Character:FindFirstChild("WarningNotifDetector") == nil then
                                local p = Instance.new("Part", v.Character)
                                p.Name = "WarningNotifDetector"
                                warningNotification("Cat V5", v.Name.." is the beast!",10)
                            end
                        end
                    end
                else
                    v.Team = survivor
                    store.beast = nil
                end
            end)
        end
        if not shared.VapeExecuted then
        	survivor:Destroy()
        	beast:Destroy()
        	connection:Disconnect()
        	store = nil
            UnbindFromStepped("Update")
        end
    end)
end)

GuiLibrary.RemoveObject("KillauraOptionsButton")
local Hammeraura = {Enabled = false}
run(function()
	local range = {Value = 15}
	local swing = {Enabled = false}
	local autorope = {Enabled = true}
	
	Hammeraura = vape.windows.blatant.CreateOptionsButton({
		Name = "Hammeraura",
		Function = function(callback)
			if callback then
				repeat
					local remote
					if store.beast == lplr then
						remote = lplr.Character.Hammer.HammerEvent
						for i,v in getAllTargets(range.Value) do
							remote:FireServer("HammerHit", v.Character.Head)
							if (not swing.Enabled) then
								remote:FireServer("HammerClick", true)
							end
							if autorope.Enabled then
								remote:FireServer("HammerTieUp", v.Character.Torso, lplr.Character.HumanoidRootPart.Position)
							end
						end
					end
					task.wait(0.5)
				until (not Hammeraura.Enabled)
			end
		end
	})
	range = Hammeraura.CreateSlider({
		Name = "Range",
		Max = 30,
		Min = 1,
		Default = 30,
		Function = void
	})
	swing = Hammeraura.CreateToggle({
		Name = "No Swing",
		Function = void,
		Default = false,
		Function = void,
		HoverText = "Prevent the hammer from swinging"
	})
end)

run(function()
    local ZoomUnlocker = {Enabled = false}

    ZoomUnlocker = vape.windows.render.CreateOptionsButton({
        Name = "CameraUnlocker",
        Function = function(callback)
            if callback then
                BindToStepped("zu",1,function()
					workspace.CurrentCamera.CameraSubject = lplr.Character:FindFirstChildWhichIsA("Humanoid")
					workspace.CurrentCamera.CameraType = "Custom"
			        lplr.CameraMode = "Classic"
			        lplr.Character.Head.Anchored = false
                    lplr.CameraMaxZoomDistance = 25
                    lplr.CameraMinZoomDistance = 0.5
                end)
            else
                UnbindFromStepped("zu")
                lplr.CameraMaxZoomDistance = 10
                lplr.CameraMinZoomDistance = 0.5
            end
        end
    })
end)

run(function()
    local AutoHack = {Enabled = false}

    AutoHack = vape.windows.utility.CreateOptionsButton({
        Name = "AutoMinigame",
        HoverText = "Automatically completes the Hacking Minigame",
        Function = function(callback)
            if callback then
                BindToStepped("ah",1,function()
                    repstorage.RemoteEvent:FireServer("SetPlayerMinigameResult",true)
                end)
            else
                UnbindFromStepped("ah")
            end
        end,
        ExtraText = function() return "Remote" end
    })
end)

local AutoInteract = {Enabled = false}
run(function()

    AutoInteract = vape.windows.utility.CreateOptionsButton({
        Name = "AutoInteract",
        HoverText = "Automatically interact with anything",
        Function = function(callback)
            if callback then
                BindToStepped("ai",1,function()
                    repstorage.RemoteEvent:FireServer("Input", "Action", true)
                end)
            else
                UnbindFromStepped("ai")
            end
        end
    })
end)

run(function()
    local NoSlowdown = {Enabled = false}

    NoSlowdown = vape.windows.blatant.CreateOptionsButton({
        Name = "NoSlowdown",
        Function = function(callback)
            if callback then
                BindToStepped("nh",1,function()
                    pcall(function()
                        if lplr.Character.Humanoid.WalkSpeed < 16 then
                            lplr.Character.Humanoid.WalkSpeed = 16
                        end
                    end)
                end)
            else
                UnbindFromStepped("nh")
            end
        end,
        ExtraText = function() return "Spoof" end
    })
end)

run(function()
    local BeastNotifier = {Enabled = false}
    local Range = {Value = 25}
    local hasNotified = tick()
    notifiedUser = lplr.Name

    BeastNotifier = vape.windows.utility.CreateOptionsButton({
        Name = "BeastNotifier",
        Function = function()
            if callback then
                BindToStepped("bn",1,function()
                    --pcall(function()
                        local mag = (store.beast.Character.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).magnitude
                        if mag <= Range.Value then
                            if notifiedUser ~= store.beast.Name and store.status ~= "game over" then
                                warningNotification("Cat V5", "The beast is near you!", 10)
                                notifiedUser = store.beast.Name
                            end
                        else
                            notifiedUser = lplr.Name
                        end
                    --end)
                end)
            else
                UnbindFromStepped("bn")
            end
        end
    })
    Range = BeastNotifier.CreateSlider({
        Name = "Range",
        Min = 5,
        Max = 30,
        Default = "25",
        Function = function(val) end
    })
end)

run(function()
	local ChamsFolder = Instance.new("Folder")
	ChamsFolder.Name = "ChamsPCFolder"
	ChamsFolder.Parent = GuiLibrary.MainGui
	local chamstable = {}
	local ChamsColor = {Value = 0.44}
	local ChamsOutlineColor = {Value = 0.44}
	local ChamsTransparency = {Value = 1}
	local ChamsOutlineTransparency = {Value = 1}
	local ChamsOnTop = {Enabled = true}
	local ChamsTeammates = {Enabled = true}

	local function addfunc(ent)
		local hl = Instance.new("Highlight")
		hl.Parent = ent
		hl.FillColor = BrickColor.new("Bright green")
		hl.OutlineColor = Color3.fromRGB(255,255,255)
		h1.FullTransparency = 0.4
	end

	local function removefunc(ent)
		ent.Highlight:Destroy()
	end

	local Chams = {Enabled = false}
	Chams = vape.windows.render.CreateOptionsButton({
		Name = "ComputerESP",
		Function = function(callback)
			if callback then
                BindToStepped("ce",1,function()
                    pcall(function()
                        for i,v in pairs(store.map:GetChildren()) do
                            if v.Name == "ComputerTable" then
                                if v:FindFirstChild("Highlight") == nil then
                                    addfunc(v)
                                end
                                v.Highlight.FillColor = v.Screen.Color
                            end
                        end
                    end)
                end)
			else
				UnbindFromStepped("ce")
			end
		end,
		HoverText = "Render computers through walls"
	})
end)

run(function()

	local function addfunc(ent)
		local hl = Instance.new("Highlight")
		hl.Parent = ent
		hl.FillColor = Color3.fromRGB(121,121,255)
		hl.OutlineColor = Color3.fromRGB(255,255,255)
		h1.FullTransparency = 0.4
	end

	local function removefunc(ent)
		ent.Highlight:Destroy()
	end

	local Chams = {Enabled = false}
	Chams = vape.windows.render.CreateOptionsButton({
		Name = "PodESP",
		Function = function(callback)
			if callback then
                BindToStepped("pe",1,function()
                    pcall(function()
                        for i,v in pairs(store.map:GetChildren()) do
                            if v.Name == "FreezePod" then
                                if v:FindFirstChild("Highlight") == nil then
                                    addfunc(v)
                                end
                            end
                        end
                    end)
                end)
			else
				UnbindFromStepped("pe")
			end
		end,
		HoverText = "Render Freeze pods through walls"
	})
end)

run(function()

	local function addfunc(ent)
		local hl = Instance.new("Highlight")
		hl.Parent = ent
		hl.FillColor = Color3.fromRGB(55, 222, 89)
		hl.OutlineColor = Color3.fromRGB(255,255,255)
		h1.FullTransparency = 0.4
	end

	local function removefunc(ent)
		ent.Highlight:Destroy()
	end

	local Chams = {Enabled = false}
	Chams = vape.windows.render.CreateOptionsButton({
		Name = "ExitESP",
		Function = function(callback)
			if callback then
                BindToStepped("ee",1,function()
                    pcall(function()
                        for i,v in pairs(store.map:GetChildren()) do
                            if v.Name == "ExitDoor" then
                                if v:FindFirstChild("Highlight") == nil then
                                    addfunc(v)
                                end
                            end
                        end
                    end)
                end)
			else
				UnbindFromStepped("ee")
			end
		end,
		HoverText = "Render exits through walls"
	})
end)

run(function()
    local AutoWin = {Enabled = false}
    local SaveCaptured = {Enabled = false}
    local AutoRejoin = {Enabled = false}
    local AutoServerHop = {Enabled = false}
    local SpeedValue1 = {Value = 9}
    local SpeedValue2 = {Value = 11}
    local FastHack = {Enabled = false}
    local slot = "3"

    local function getComputer()
        for i,v in pairs(store.map:GetChildren()) do
            if v.Name == "ComputerTable" then
                if v.Screen.BrickColor ~= BrickColor.new("Dark green") then
                    local mag = (store.beast.Character.HumanoidRootPart.Position - v.ComputerTrigger3.Position).magnitude
                    if mag >= 70 then
                        local s = 3
                        for i2,v2 in pairs(players:GetChildren()) do
                            local mag2 = (v2.Character.HumanoidRootPart.Position - v["ComputerTrigger"..s].Position).magnitude
                            if mag2 < 1.15 and v2 ~= lplr then
                                s -= 1
                            end
                        end
                        if s > 0 then
                            local data = {
                                Object = v,
                                Index = i,
                                CFrame = v["ComputerTrigger"..s].CFrame,
                                Position = v["ComputerTrigger"..s].Position
                            }
                            return data
                        end
                    end
                end
            end
        end
        return nil
    end

    local function getExit()
        for i,v in pairs(store.map:GetChildren()) do
            if v.Name == "ExitDoor" then
                local mag = (store.beast.Character.HumanoidRootPart.Position - v.ExitDoorTrigger.Position).magnitude
                if mag >= 15 then
                    return v
                end
            end
        end
        return nil
    end

    local function getPod()
        for i,v in pairs(store.map:GetChildren()) do       --print(v)
            if v.Name == "FreezePod" then
                return v
            end
        end
        return nil
    end
    
    local function getAllPods()
	    local pods = {}
        for i,v in pairs(store.map:GetChildren()) do       --print(v)
            if v.Name == "FreezePod" then
                table.insert(pods, v)
            end
        end
        return pods
    end

	local function getEmptyPod()
        for i,v in pairs(store.map:GetChildren()) do
            if v.Name == "FreezePod" and v.PodTrigger.CapturedTorso.Value == nil then
                return v
            end
        end
        return nil
    end

    local function getPlayerInPod(pod)
        local cap = pod.PodTrigger.CapturedTorso
        if cap.Value ~= nil then
            return cap.Value
        end
        return nil
    end
    
    local computer = nil
    local exit = nil
    local tweening = false
    local doInteract = false
    local tween
    local function tweenCF(cf,time,safe)
        safe = safe or false
        local pos = safe and 150 or 0
        if tweening and (not store.gamestatus:lower():find("exit") or not store.status == "exits") then return end
        local comp = computer or {CFrame = 0, Position = 0}
        time = time or 0
        doInteract = false
        if cf == comp.CFrame then
        	if store.status == "exits" then
        		return nil
        	end
            local mag = (comp.Position - lplr.Character.HumanoidRootPart.Position).magnitude
            if mag <= 12 then
                time = 0.5
            end
            if store.autowinComps <= 0 then
            	time = 0.1
            end
            store.autowinComps += 1
        end
        lplr.Character.HumanoidRootPart.CFrame = CFrame.new(lplr.Character.HumanoidRootPart.CFrame.X, cf.Y + pos, lplr.Character.HumanoidRootPart.CFrame.Z)
        lplr.Character.Humanoid.CameraOffset = Vector3.new(0,-pos,0)
        local tweenservice = game:GetService("TweenService")
        local info = TweenInfo.new(time,Enum.EasingStyle.Linear)-- this is cringe i thought linear was the default :sob:
        tween = tweenservice:Create(lplr.Character.HumanoidRootPart,info,{CFrame = cf * CFrame.new(0,pos,0)})
        tween:Play()
        tweening = true
        tween.Completed:Connect(function()
            lplr.Character.HumanoidRootPart.CFrame = cf
            lplr.Character.Humanoid.CameraOffset = Vector3.new(0,0,0)
            doInteract = true
            tweening = false
        end)
    end
    
    local jumpTick = 0
    local target

    AutoWin = vape.windows.afk.CreateOptionsButton({
        Name = "AutoWin",
        Function = function(callback)
            if callback then
                table.insert(AutoWin.Connections, game:GetService("GuiService").ErrorMessageChanged:Connect(function() -- credits to Infinite Yield
                    if not AutoRejoin.Enabled then return end
                    game:FindService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, lplr)
                end))
                BindToStepped("aw",1,function()
                    pcall(function()
                        if AutoInteract.Enabled then AutoInteract.ToggleButton(false) end
                        if not isAlive() then return end
                        if store.status == "spawn" or store.escaped then
                            lplr.Character.HumanoidRootPart.CFrame = CFrame.new(104,8,-417)
                            jumpTick = 0
                            computer = nil
                            exit = nil
                            store.autowinComps = 0
                        end
                        local mag = (store.beast.Character.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).magnitude
                        repstorage.RemoteEvent:FireServer("Input", "Action", true)
                        if store.beast ~= lplr then
                        	lplr.Character.HumanoidRootPart.Velocity = Vector3.zero
                            --if store.beast == lplr then mag = 5000 end
                            if mag <= 25 and (not store.escaped and not store.status == "spawn") then
                                --tween:Cancel()
                                
                                lplr.Character.HumanoidRootPart.CFrame *= CFrame.new(0,100,0)
                                jumpTick = 0
                            else
                                jumpTick = jumpTick + 1
                                local pod = getAllPods()
                                local cap
                                for i,v in pod do
                                	local isThe = getPlayerInPod(v)
                                	if isThe ~= nil then
                                		cap = isThe
                                	end
                                end
                                local mag2 = 500
                        		if cap ~= nil then
                               		mag2 = (cap.Position - store.beast.Character.HumanoidRootPart.Position).magnitude
                               	end
                                if (cap ~= nil and SaveCaptured.Enabled) and mag2 >= 30 then
                                    lplr.Character.HumanoidRootPart.CFrame = cap.CFrame * CFrame.new(0,-2,4)
                                    tween:Cancel()
                                    tweening = false
                                    tween = nil
                                    store.autowinComps = 0
                                else
                                    if store.status == "computers" then
                                        local pos = lplr.Character.HumanoidRootPart.Position
                                        if computer == nil or computer.Object == nil or computer.Object.Screen.BrickColor == BrickColor.new("Dark green") or mag <= 30 then
                                            if mag <= 30 then
                                                warningNotification("Cat V5","The beast is near!",3)
                                            end
                                            if computer ~= nil then
                                                if computer.Object.Screen.BrickColor == BrickColor.new("Dark green") then
                                                    warningNotification("Cat V5","Computer successfully hacked!",3)
                                                end
                                            end
                                            warningNotification("Cat V5","Finding new computer..",1)
                                            computer = getComputer()
                                        end
                                        if not tweening then
                                            --local slot = "ComputerTrigger"..getAvailableSlot(computer)
                                            if pos.X ~= computer.Position.X or pos.Z ~= computer.Position.Z then tweenCF(computer.CFrame, math.random(SpeedValue1.Value,SpeedValue2.Value), true) end
                                            --warningNotification("Cat V5", "Teleporting to another computer..",5)
                                        end
                                        local s = 3
                                        for i2,v2 in pairs(players:GetChildren()) do
                                            local mag2 = (v2.Character.HumanoidRootPart.Position - computer.Position).magnitude
                                            if mag2 < 1.15 and v2 ~= lplr then
                                                computer = getComputer()
                                            end
                                        end
                                        if jumpTick > 249 and jumpTick < 256 and FastHack.Enabled then
                                            lplr.Character.Humanoid.JumpPower = 90
                                            lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                                        elseif jumpTick > 257 then
                                            jumpTick = 0
                                            lplr.Character.Humanoid.JumpPower = 36
                                            tweenCF(computer.CFrame, math.random(SpeedValue1.Value,SpeedValue2.Value), false)
                                        end
                                        -- lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0,computer.ComputerTrigger3.CFrame.Y,0)
                                    elseif store.status == "exits" then
                                    	local pos = lplr.Character.HumanoidRootPart.Position
                                        jumpTick = 0
                                        local additionalPos = CFrame.new(0,0,0)
                                        if store.timer == 0 then return end
                                        if store.escaped then return end
                                        if exit == nil or mag <= 15 then
                                            if mag <= 15 then
                                                warningNotification("Cat V5","The beast is near!",3)
                                            end
                                            exit = getExit()
                                        end
                                        local partTP = exit.ExitArea
                                        additionalPos = CFrame.new(0,10,0)
                                        speed = 1
                                        if exit.Door.Hinge.Rotation.Y == 0 or exit.Door.Hinge.Rotation.Y == 90 or exit.Door.Hinge.Rotation.Y == 180 or exit.Door.Hinge.Rotation.Y == 270 then
                                            partTP = exit.ExitDoorTrigger
                                            speed = 0.65
                                            additionalPos = CFrame.new(0,0,0)
                                        end
                                        if exit.Door.Hinge.Rotation.Y == -90 or exit.Door.Hinge.Rotation.Y == -180 or exit.Door.Hinge.Rotation.Y == -270 then
                                            partTP = exit.ExitDoorTrigger
                                            speed = 0.65
                                            additionalPos = CFrame.new(0,0,0)
                                        end
                                        if mag >= 15 then
                                        	if not tweening then
	                                            if pos.X ~= partTP.Position.X or pos.Z ~= partTP.Position.Z then
	                                            	tweenCF(partTP.CFrame * additionalPos, speed, false)
	                                            else
	                                            	if partTP.Name == "ExitArea" then
	                                            		lplr.Character.HumanoidRootPart.CFrame *= CFrame.new(0,-4,0)
	                                            	end
                                            	end
	                                        end
                                        else
                                            exit = getExit()
                                        end
                                    end
                                end
                            end
                        else
                        	lplr.Character.HumanoidRootPart.Velocity = Vector3.zero
                            if lplr.Character:FindFirstChild("Part") and lplr.Character.Part:FindFirstChild("RopeConstraint") then
                            	local pod = getEmptyPod()
                            	lplr.Character.HumanoidRootPart.CFrame = pod.PodTrigger.CFrame
                            else
                            	--print("beast")
                            	target = nil
                            	for i,v in getAllTargets(300, true) do
                            		target = v
                            		--print("targets")
                            		if target ~= nil then
                            			--print("go!!!")
                            			if not Hammeraura.Enabled then Hammeraura.ToggleButton() end
                            			lplr.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,4)
                            		end
                            	end
                            end
                        end
                    end)
                end)
            else
                UnbindFromStepped("aw")
            end
        end,
        HoverText = "Automatically win the game",
        ExtraText = function()
            return "Delay "..SpeedValue1.Value.."-"..SpeedValue2.Value
        end
    })
    AutoRejoin = AutoWin.CreateToggle({
        Name = "Auto Rejoin",
        Default = true,
        Function = function()
            AutoWin.ToggleButton(false)
            AutoWin.ToggleButton(false)
        end,
        HoverText = "Automatically rejoin if kicked"
    })
    AutoServerHop = AutoWin.CreateToggle({
        Name = "Auto ServerHop",
        Default = true,
        Function = function() end,
        HoverText = "Automatically server hop if you are the only player"
    })
    SpeedValue1 = AutoWin.CreateSlider({
        Name = "Speed 1",
        Min = 4,
        Max = 30,
        Default = 9,
        Function = function(val) end
    })
    SpeedValue2 = AutoWin.CreateSlider({
        Name = "Speed 2",
        Min = 4,
        Max = 30,
        Default = 11,
        Function = function(val) end
    })
    FastHack = AutoWin.CreateToggle({
        Name = "Fast Hack",
        Default = true,
        Function = function()
        end,
        HoverText = "Hack Faster"
    })
    SaveCaptured = AutoWin.CreateToggle({
    	Name = "Save captured players",
    	Default = true,
    	Function = void,
    	HoverText = "Save captured players in freeze podd"
    })
end)

run(function()
	local Health = {Enabled = false}
	Health =  vape.windows.render.CreateOptionsButton({
		Name = "Progress",
		Function = function(callback)
			if callback then
                task.spawn(function()
                    ProgressText = Drawing.new("Text")
                    ProgressText.Size = 20
                    ProgressText.Text = "0%"
                    ProgressText.Position = Vector2.new(0, 0)
                    ProgressText.Color = Color3.fromRGB(0, 255, 0)
                    ProgressText.Center = true
                    ProgressText.Visible = true
					repeat
						if isAlive() then
							ProgressText.Text = math.floor(store.progress).."%"
							ProgressText.Color = Color3.fromHSV(math.clamp(math.floor(store.progress) / 100, 0, 1) / 2.5, 0.89, 1)
						end
						ProgressText.Position = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2 + 95)
						task.wait()
					until not Health.Enabled
                end)
			else
				if ProgressText then ProgressText:Remove() end
			end
		end,
		HoverText = "Displays your progress in the center of your screen."
	})
end)

run(function()
	local BeastExploit = {Enabled = false}
	BeastExploit = vape.windows.exploit.CreateOptionsButton({
		Name = "BeastExploit",
		Function = function(callback)
			if callback then
				BindToStepped("beast",1,function()
					if store.beast == lplr then
						lplr.CameraMode = "Classic"
						lplr.Character.CrawlScript.Disabled = false
						if not store.cancrawl then
							lplr.TempPlayerStatsModule.DisableCrawl.Value = false
						end
						local t = lplr.Character
						if t.Hammer.Handle:FindFirstChild("SoundChaseMusic") then
							t.Hammer.Handle.SoundChaseMusic:Destroy()
						end
						if t.Hammer.Handle:FindFirstChild("SoundHeartBeat") then
							t.Hammer.Handle.SoundHeartBeat:Destroy()
						end
						if t.Gemstone:FindFirstChild("Handle") then
							t.Gemstone.Handle:Destroy()
						end
					end
				end)
			else
				UnbindFromStepped("beast")
			end
		end
	})
end)

run(function()
	local AntiRope = {Enabled = false}
	AntiRope = vape.windows.exploit.CreateOptionsButton({
		Name = "AntiRope",
		Function = function(callback)
			if callback then
				BindToStepped("any",1,function()
					if store.beast ~= lplr then
						if store.beast.Character:FindFirstChild("Part") and store.beast.Character.Part:FindFirstChild("RopeConstraint") then
							store.beast.Character.Part:Destroy()
						end
					end
				end)
			else
				UnbindFromStepped("any")
			end
		end,
		HoverText = "Prevents you from being\ndragged by the beast"
	})
end)