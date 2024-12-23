--This watermark is used to delete the file if its cached, remove it to make the file persist after commits.
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
                                                                                                                                                                                                        
                                                                                                                                                                                                        
				catvape/CustomModules/1240123653.lua - Zombie Attack
				by qwertyui
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

local function getAllTargets(range, captured)
	range = range or 9e9
	local targets = {}
	for i,v in players:GetPlayers() do
		if isAlive(v) and isAlive(lplr) and v ~= lplr then
			local mag = (lplr.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude
			if mag <= range then
				table.insert(targets, v)
			end
		end
	end
	return targets
end

local function getZombieTargets(range, sortMode)
	range = range or 9e9
	sortMode = sortMode or "Magnitude"
	local targets = {}
	for i,v in workspace.enemies:GetChildren() do
		if isAlive(lplr) and v:FindFirstChildOfClass("Humanoid") ~= nil then
			local mag = (lplr.Character.Head.Position - v.Head.Position).magnitude
			if mag <= range then
				table.insert(targets, v)
			end
		end
	end
	for i,v in workspace.BossFolder:GetChildren() do
		if isAlive(lplr) and v:FindFirstChildOfClass("Humanoid") ~= nil then
			local mag = (lplr.Character.Head.Position - v.Head.Position).magnitude
			if mag <= range then
				table.insert(targets, v)
			end
		end
	end
	table.sort(targets, function(a, b)
		local aMag = (a.Head.Position - b.Head.Position).magnitude
		local bMag = (b.Head.Position - a.Head.Position).magnitude
		if sortMode == "Magnitude" then
			return aMag < bMag
		elseif sortMode == "Health" then
			return a.Humanoid.Health < b.Humanoid.Health
		end
	end)
	return targets
end

local run = runcode

local function isVulnerable(plr)
	return plr.Humanoid.Health > 0 and not plr.Character.FindFirstChildWhichIsA(plr.Character, "ForceField")
end

local entityLibrary = shared.vapeentity
local function EntityNearPosition(distance, checktab)
	checktab = checktab or {}
	if isAlive() then
		local sortedentities = {}
		for i, v in pairs(entityLibrary.entityList) do -- loop through playersService
			if not v.Targetable then continue end
            if isVulnerable(v) then -- checks
				local playerPosition = v.RootPart.Position
				local mag = (entityLibrary.character.HumanoidRootPart.Position - playerPosition).magnitude
				if checktab.Prediction and mag > distance then
					mag = (entityLibrary.LocalPosition - playerPosition).magnitude
				end
                if mag <= distance then -- mag check
					table.insert(sortedentities, {entity = v, Magnitude = v.Target and -1 or mag})
                end
            end
        end
		table.sort(sortedentities, function(a, b) return a.Magnitude < b.Magnitude end)
		for i, v in pairs(sortedentities) do
			if checktab.WallCheck then
				if not raycastWallCheck(v.entity, checktab) then continue end
			end
			return v.entity
		end
	end
end

local shootTick = 0
getgenv().store = {
	AFTarget = nil,
	Entities = {
		Zombies = {}
	},
	getGunData = function(gun)
		local data = require(repstorage.GunData)
		return data[gun]
	end,
	Remotes = {
		Shoot = function(args)
			if (shootTick - tick()) >= 0 then return end
			local gundata = require(repstorage.GunData)
			local weapons = {
			    ["Pistol"] = {damage = 17, firerate = 6},
			    ["Revolver"] = {damage = 36, firerate = 4},
			    ["Uzi"] = {damage = 17, firerate = 10},
			    ["Trench Shotgun"] = {damage = 115, firerate = 2.5},
			    ["M1 Garand"] = {damage = 60, firerate = 3},
			    ["Type 100"] = {damage = 23, firerate = 6},
			    ["M16"] = {damage = 19, firerate = 8},
			    ["Sniper"] = {damage = 100, firerate = 1.5},
			    ["Tactical Shotgun"] = {damage = 100, firerate = 3},
			    ["Thompson"] = {damage = 16, firerate = 12},
			    ["Blaster"] = {damage = 62, firerate = 3.5},
			    ["Machine Gun"] = {damage = 16, firerate = 16},
			    ["Cobra"] = {damage = 125, firerate = 1.5},
			    ["Fiery Cannon"] = {damage = 90, firerate = 2.5},
			    ["Toxic"] = {damage = 19, firerate = 10},
			    ["Retribution Ray"] = {damage = 50, firerate = 6},
			    ["Platinum Gun"] = {damage = 70, firerate = 4},
			    ["Scope Rifle"] = {damage = 100, firerate = 2.5},
			    ["Space Gun"] = {damage = 41, firerate = 8},
			    ["Railgun"] = {damage = 400, firerate = 1},
			    ["Ghost"] = {damage = 27, firerate = 10},
			    ["Alien Rifle"] = {damage = 40, firerate = 7},
			    ["Ray Gun"] = {damage = 51, firerate = 6},
			    ["Annihilator"] = {damage = 17.5, firerate = 18.5},
			    ["Biohazard"] = {damage = 30, firerate = 10},
			    ["Venom"] = {damage = 350, firerate = 1},
			    ["Golden Pistol"] = {damage = 49, firerate = 6},
			    ["Rainbow Blaster"] = {damage = 24, firerate = 15},
			    ["Hex Spitter"] = {damage = 45, firerate = 8},
			    ["Beam Launcher"] = {damage = 319, firerate = 1.5},
			    ["Gatling Laser"] = {damage = 25, firerate = 20},
			    ["Tri Laser"] = {damage = 150, firerate = 3.5},
			    ["Techno Rifle"] = {damage = 175, firerate = 3},
			    ["Minigun"] = {damage = 26, firerate = 22},
			    ["Viper Strike"] = {damage = 325, firerate = 2.5},
			    ["Alien Blaster"] = {damage = 22, firerate = 20},
			    ["Invader Crossbow"] = {damage = gundata["Invader Crossbow"].Damage, firerate = 1.5}, -- Can't find damage.
			    ["Rocket Launcher"] = {damage = math.random(330, 1650), firerate = 0.5},
			    ["Pumpkin Blaster"] = {damage = gundata["Pumpkin Blaster"].Damage, firerate = 21},
			    ["Halloween Staff"] = {damage = gundata["Halloween Staff"].Damage, firerate = gundata["Halloween Staff"].Firerate}, -- Can't find any data
			    ["Candy Cane Minigun"] = {damage = 12, firerate = 24}
			}
			for i, v in gundata do
				if not weapons[args.Name] and tostring(v) == args.Name then
					weapons[args.Name] = {damage = v.Damage or 0, firerate = v.Firerate or 0.01}
				end
			end
			if not weapons[args.Name] then
				weapons[args.Name] = {damage = gundata[args.Name].Damage or 0, firerate = gundata[args.Name].Firerate or 0.01}
			end
			shootTick = tick() + 1
			for i = 0, weapons[args.Name].firerate do
				repstorage.Gun:FireServer(args)
			end
		end,
		ToggleFlamethrower = function(args)
			return repstorage.FlamethrowerRemote:InvokeServer(args)
		end
	}
}

task.spawn(function()
	repeat
		task.wait()
		store.Entities.Zombies = getZombieTargets()
	until (not vape)
end)

for i, v in {"HitBoxes"} do
	vape.RemoveObject(v)
end

run(function()
	local Hitboxes = {Enabled = false}
	local HitboxMode = {Value = "HumanoidRootPart"}
	local HitboxExpand = {Value = 1}
	Hitboxes = vape.windows.blatant.CreateOptionsButton({
		Name = "HitBoxes",
		Function = function(callback)
			if callback then
				task.spawn(function()
					repeat
						for i,plr in pairs(store.Entities.Zombies) do
							if HitboxMode.Value == "HumanoidRootPart" then
								plr.HumanoidRootPart.Size = Vector3.new(2 * (HitboxExpand.Value / 10), 2 * (HitboxExpand.Value / 10), 1 * (HitboxExpand.Value / 10))
							else
								plr.Head.Size = Vector3.new((HitboxExpand.Value / 10), (HitboxExpand.Value / 10), (HitboxExpand.Value / 10))
							end
						end
						task.wait()
					until (not Hitboxes.Enabled)
				end)
			else
				for i,plr in pairs(store.Entities.Zombies) do
					plr.RootPart.Size = Vector3.new(2, 2, 1)
					plr.Head.Size = Vector3.new(1, 1, 1)
				end
			end
		end
	})
	HitboxMode = Hitboxes.CreateDropdown({
		Name = "Expand part",
		List = {"HumanoidRootPart", "Head"},
		Function = void
	})
	HitboxExpand = Hitboxes.CreateSlider({
		Name = "Expand amount",
		Min = 10,
		Max = 50,
		Function = function(val) end
	})
end)

run(function()
	local AutoShoot = {Enabled = false}
	local range = {Value = 25}
	AutoShoot = vape.windows.combat.CreateOptionsButton({
		Name = "AutoShoot",
		HoverText = "Automatically shoot nearby zombies.",
		Function = function(callback: boolean)
			if callback then
				BindToStepped("as",1,function()
					if isAlive() then
						local plrs = getZombieTargets(range.Value, "Magnitude")
						if #plrs > 0 then
							for i, plr in plrs do
								if lplr.Character:FindFirstChildOfClass("Tool") then
									if store.AFTarget ~= nil then return end
									store.Remotes.Shoot({
										Normal = Vector3.zero,
										Direction = plr.Head.Position,
										Name = lplr.Character:FindFirstChildOfClass("Tool").Name,
										Hit = plr.Head,
										Origin = plr.Head.Position,
										Pos = plr.Head.Position
									})
								end
							end
						end
					end
				end)
			else
				UnbindFromStepped("as")
			end
		end,
		ExtraText = function() return range.Value end
	})
	range = AutoShoot.CreateSlider({
		Name = "Range",
		Min = 5,
		Max = 60,
		Default = 40,
		Function = void
	})
end)

run(function()
	local AutoPowerup = {Enabled = false}
	local mode = {Value = "Spoof"}
	AutoPowerup = vape.windows.utility.CreateOptionsButton({
		Name = "AutoPowerup",
		HoverText = "Automatically grab powerups.",
		Function = function(callback: boolean)
			if callback then
				BindToStepped("ap", 1, function()
					if #workspace.Powerups:GetChildren() > 0 then
						for i,v in workspace.Powerups:GetDescendants() do
							if v.Name == "TouchInterest" then
								firetouchinterest(lplr.Character.HumanoidRootPart, v.Parent, 0)
								--print("touch")
							end
						end
					end
				end)
			else
				UnbindFromStepped("ap")
			end
		end
	})
end)

run(function()
	local AutoFarm = {Enabled = false}
	local lockCam = {Enabled = false}
	local xoff = {Value = 0}
	local yoff = {Value = 0}
	AutoFarm = vape.windows.afk.CreateOptionsButton({
		Name = "AutoFarm",
		HoverText = "Automatically kill zombies while you AFK.",
		Function = function(callback: boolean)
			if callback then
				BindToStepped("af", 1, function()
					if store.AFTarget == nil then
						store.Remotes.ToggleFlamethrower(false)
						local plrs = getZombieTargets(inf, "Health")
						if #plrs > 0 then
							for i, v in plrs do
								if i == 1 then
									store.AFTarget = v
									break
								end
							end
						end
					else
						if not store.AFTarget:FindFirstChild("Head") or not store.AFTarget:FindFirstChild("HumanoidRootPart") or (store.AFTarget.Parent ~= workspace.enemies and store.AFTarget.Parent ~= workspace.BossFolder) or store.AFTarget.Humanoid.Health == 0 then
							store.AFTarget = nil
						end
						store.Remotes.ToggleFlamethrower(true)
						lplr.Character.HumanoidRootPart.CFrame = store.AFTarget.HumanoidRootPart.CFrame * CFrame.new(0, 0 + yoff.Value, 1 + xoff.Value)
						if lplr.Character:FindFirstChildOfClass("Tool") then
							store.Remotes.Shoot({
								Normal = Vector3.zero,
								Direction = store.AFTarget.Head.Position,
								Name = lplr.Character:FindFirstChildOfClass("Tool").Name,
								Hit = store.AFTarget.Head,
								Origin = store.AFTarget.Head.Position,
								Pos = store.AFTarget.Head.Position
							})
							if lplr.Character:FindFirstChildOfClass("Tool").Name:lower() == "flamethrower" or lockCam.Enabled then
								workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.p, store.AFTarget.Head.Position)
							end
						end
						lplr.Character.HumanoidRootPart.Velocity = Vector3.zero
					end
				end)
			else
				UnbindFromStepped("af")
				store.AFTarget = nil
			end
		end
	})
	lockCam  = AutoFarm.CreateToggle({
		Name = "Lock Camera",
		Function = void
	})
	xoff = AutoFarm.CreateSlider({
		Name = "X Offset",
		Min = 0,
		Max = 15,
		Default = 5,
		Function = void
	})
	yoff = AutoFarm.CreateSlider({
		Name = "Y Offset",
		Min = 0,
		Max = 15,
		Default = 5,
		Function = void
	})
end)