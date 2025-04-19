getgenv().printtab = function(tab, func) table.foreach(tab, func or print) end
local repo = 'https://raw.githubusercontent.com/mstudio45/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
local Options = Library.Options
local Toggles = Library.Toggles
local players = cloneref(game:GetService('Players'))
local lplr = players.LocalPlayer
local runService = cloneref(game:GetService('RunService'))
local inputservice = cloneref(game:GetService('UserInputService'))
local textService = cloneref(game:GetService('TextService'))
local replicatedstorage = cloneref(game:GetService('ReplicatedStorage'))
local httpservice = cloneref(game:GetService('HttpService'))
local getRoot = function(char)
	local suc, res = pcall(function()
        local humanoid = char.Humanoid.Health > 0
		return humanoid and char.PrimaryPart
	end)
	return suc and res or nil
end
local gameFont = Font.new('rbxasset://fonts/families/Arimo.json', Enum.FontWeight.Regular)

local Window = Library:CreateWindow({
	Title = `Bubble gum simulator`,
	Center = true,
	AutoShow = true,
	Resizable = true,
	ShowCustomCursor = false,
	ShowToggleFrameInKeybinds = true,
	NotifySide = 'Right',
	TabPadding = 8,
	MenuFadeTime = 0.2
})

local tabs = {
	Main = Window:AddTab('Main'),
	Visual = Window:AddTab('Visual'),
	Player = Window:AddTab('Player'),
	World = Window:AddTab('World'),
	['UI Settings'] = Window:AddTab('UI Settings')
}

local store = setmetatable({
	remotes = setmetatable({}, {
		__index = function(self, index)
			self[index] = replicatedstorage.Shared.Framework.Network.Remote:FindFirstChild(index)
			if self[index] == nil then
				self[index] = replicatedstorage.Remotes:FindFirstChild(index)
			end
			return self[index]
		end
	}),
	modules = {
        egg = require(replicatedstorage.Shared.Data.Eggs),
		data = {
            localdata = replicatedstorage.Client.Framework.Services.LocalData,
			gums = require(replicatedstorage.Shared.Data.Gum),
			flavors = require(replicatedstorage.Shared.Data.Flavors)
		}
	}
}, {})

function store:getgumdata(gum)
	return self.modules.data.gums[gum]
end

function store:getflavordata(flavor)
	return self.modules.data.flavors[flavor]
end

function store:getCurrency(currency)
	local text = lplr.PlayerGui.ScreenGui.HUD.Left.Currency:FindFirstChild(currency) and lplr.PlayerGui.ScreenGui.HUD.Left.Currency[currency].Frame.Label.Text:gsub(',', '') or '0'
	return tonumber(text) or 0
end

function store:hasUnlockedArea(area)
    return area:lower() == 'the overworld' and true or require(self.modules.data.localdata):Get(area).AreasUnlocked[area]
end

function store:getItemData()
	local attribute = httpservice:JSONDecode(lplr:GetAttribute('Bubble'))
	local data = {
		Gum = store:getgumdata(attribute.Gum),
		Flavor = store:getflavordata(attribute.Flavor)
	}

	for i,v in self.modules.data.gums do
		if type(v.Cost) == 'table' and store:getCurrency(v.Cost.Currency) >= v.Cost.Amount and self:hasUnlockedArea(v.Area) and v.Storage > data.Gum.Storage then
			data.Gum = table.clone(v)
			data.Gum.Name = i
		end
	end

	for i,v in self.modules.data.flavors do
		if type(v.Cost) == 'table' and store:getCurrency(v.Cost.Currency) >= v.Cost.Amount and self:hasUnlockedArea(v.Area) and v.Bubbles > data.Flavor.Bubbles then
			data.Flavor = table.clone(v)
			data.Flavor.Name = i
		end
	end

	return data
end

xpcall(function()
	local farmSection = tabs.Main:AddLeftGroupbox('Farm')
	farmSection:AddToggle('AutoBlow', {
		Text = 'Auto Blow Bubbles',
		Callback = function(call)
			if call then
				repeat
					local bubble = httpservice:JSONDecode(lplr:GetAttribute('Bubble'))
					local data = store:getgumdata(bubble.Gum)
					if data.Storage ~= bubble.Amount then
						store.remotes.Event:FireServer('BlowBubble')
					end
					task.wait(0.1)
				until not Toggles.AutoBlow.Value
			end
		end
	})

    local riftguis = {}

    local function addesp(instance)
        local size = Instance.new('GetTextBoundsParams')
        size.Width = math.huge
        size.Size = 19
        size.Text = instance.Name
        size.Font = gameFont

        local textSize = textService:GetTextBoundsAsync(size)

        local gui = Instance.new('BillboardGui', instance)
        gui.Size = UDim2.new(0, textSize.X, 0, 27)
        gui.Name = 'esplol'
        gui.StudsOffset = Vector3.new(0, 6, 0)
        gui.AlwaysOnTop = true

        table.insert(riftguis, gui)
        
        local label = Instance.new('TextLabel', gui)
        label.BackgroundTransparency = 0.3
        label.Text = instance.Name
        label.TextSize = 16
        label.FontFace = gameFont
        label.BorderSizePixel = 0
        label.TextColor3 = Color3.new(1, 1, 1)
        label.BackgroundColor3 = Color3.new()
        label.Size = UDim2.new(1, 0, 1, 0)
    end
    farmSection:AddToggle('RiftEsp', {
        Text = 'Rifts ESP',
        Callback = function(call)
            if call then
                for i,v in workspace.Rendered.Rifts:GetChildren() do
                    addesp(v)
                    if v.Name == 'man-egg' or v.Name == 'royal-chest' then
                        warn('wtf real '.. v.Name)
                        for i = 1, 5 do
                            Library:Notify('OMG THATS SO RARE WTF?? -> '.. v.Name, 7)
                        end
                    end
                end
            else
                for i,v in riftguis do
                    v:Destroy()
                end
                table.clear(riftguis)
            end
        end
    })
    workspace.Rendered.Rifts.ChildAdded:Connect(function(v)
        if Toggles.RiftEsp.Value then
            addesp(v)
        end
    end)
    farmSection:AddToggle('AutoEquipPets', {
        Text = 'Auto Equip Best Pets',
        Callback = function(call)
            if call then
                repeat
                    store.remotes.Event:FireServer('EquipBestPets')                    
                    task.wait(1)
                until not Toggles.AutoEquipPets.Value
            end
        end
    })
    farmSection:AddToggle('AutoCollect', {
		Text = 'Auto Collect Pickups',
		Callback = function(call)
			if call then
				repeat
                    for i,v in workspace.Rendered:GetDescendants() do
						if v.Parent and v.Parent.Name == 'Chunker' and #v.Name >= 36 then
                            replicatedstorage.Remotes.Pickups.CollectPickup:FireServer(v.Name)      
                            task.wait(0.05)                      
                        end
                    end
					task.wait(1)
				until not Toggles.AutoCollect.Value
			end
		end
	})
	farmSection:AddToggle('AutoSell', {
		Text = 'Auto Sell Bubbles',
		Callback = function(call)
			if call then
				repeat
					local bubble = httpservice:JSONDecode(lplr:GetAttribute('Bubble'))
					local data = store:getgumdata(bubble.Gum)
					if data.Storage == bubble.Amount then
						store.remotes.Event:FireServer('SellBubble')
					end
					task.wait(0.1)
				until not Toggles.AutoSell.Value
			end
		end
	})

	local autoBuySection = tabs.Main:AddRightGroupbox('Auto Buy')
	autoBuySection:AddToggle('AutoBuy', {
		Text = 'Auto Buy',
		Callback = function(call)
			if call then
				repeat
					local data = store:getItemData()
					if data.Gum.Name then
						store.remotes.Event:FireServer('GumShopPurchase', data.Gum.Name)
					end
					if data.Flavor.Name then
						store.remotes.Event:FireServer('GumShopPurchase', data.Flavor.Name)
					end
					task.wait(0.5)
				until not Toggles.AutoBuy.Value
			end
		end
	})
	--> player
	local speedtab = tabs.Player:AddLeftTabbox('Speed')

	local speedmodule = speedtab:AddTab('Speed Module')
	local speedsettings = speedtab:AddTab('Settings')

	local speedcon = nil

	local heatseekertick = tick()
	local heatseekertick2 = tick() + 1

	speedmodule:AddToggle('Speed', {
		Text = 'Enabled',
		Callback = function(call)
			if call then
				speedcon = runService.PreSimulation:Connect(function(delta: number)
					if Options.SpeedMode.Value == 'Heatseeker' and heatseekertick > tick() then return end
					local newPos = lplr.Character.Humanoid.MoveDirection * ((Options.SpeedValue.Value * (Options.SpeedMode.Value == 'Heatseeker' and 1.5 or 1)) - 16) * delta
					local raycast = RaycastParams.new()
					raycast.FilterDescendantsInstances = {lplr.Character, workspace.CurrentCamera}
					raycast.CollisionGroup = lplr.Character.HumanoidRootPart.CollisionGroup
					raycast = workspace:Raycast(lplr.Character.HumanoidRootPart.Position, newPos, raycast)
					if raycast then
						newPos = ((raycast.Position + raycast.Normal) - lplr.Character.HumanoidRootPart.Position)
					end
					if tick() > heatseekertick2 then
						heatseekertick = tick() + 0.5
						heatseekertick2 = tick() + 1
					end
					lplr.Character.HumanoidRootPart.CFrame += newPos
				end)
			else
				if speedcon then
					speedcon:Disconnect()
				end
			end
		end
	})
	speedsettings:AddSlider('SpeedValue', {
		Text = 'Value',
		Min = 1,
		Max = 600,
		Default = 70,
		Rounding = 0,
		Callback = function() end
	})
	speedsettings:AddDropdown('SpeedMode', {
		Text = 'Mode',
		Values = {'Heatseeker', 'Normal'},
		Default = 2,
		Callback = function() end
	})

	local flytab = tabs.Player:AddRightTabbox('Fly')

	local flymodule = flytab:AddTab('Flight Module')
	local flysettings = flytab:AddTab('Settings')

	local goingup = false
	local goingdown = false

	local flycon

	flymodule:AddToggle('Flight', {
		Text = 'Enabled',
		Callback = function(call)
			if call then
				local ycf = getRoot(lplr.Character).CFrame.Y
				flycon = runService.PreSimulation:Connect(function(delta: number)
					if getRoot(lplr.Character) then
						ycf = ycf + ((goingup and Options.VerticalSpeed.Value or goingdown and -Options.VerticalSpeed.Value or 0) * delta)
						local raycast = RaycastParams.new()
						raycast.FilterDescendantsInstances = {lplr.Character, workspace.CurrentCamera}
						raycast.CollisionGroup = lplr.Character.HumanoidRootPart.CollisionGroup
						raycast = workspace:Raycast(lplr.Character.HumanoidRootPart.Position, Vector3.new(0, ycf - lplr.Character.HumanoidRootPart.Position.Y, 0), raycast)
						if raycast then
							ycf = raycast.Position.Y + lplr.Character.Humanoid.HipHeight
						end
						getRoot(lplr.Character).AssemblyLinearVelocity = Vector3.new(lplr.Character.HumanoidRootPart.AssemblyLinearVelocity.X, 0, lplr.Character.HumanoidRootPart.AssemblyLinearVelocity.Z)
						getRoot(lplr.Character).CFrame += Vector3.new(0, ycf - lplr.Character.HumanoidRootPart.CFrame.Position.Y, 0)
					end
				end)
			else
				if flycon then
					flycon:Disconnect()
				end
			end
		end
	}):AddKeyPicker('FlyKeybind', {
		Text = 'Fly Bind',
		Mode = 'Toggle',
		Default = 'R',
		NoUI = false,
		Callback = function(call)
			Toggles.Flight:SetValue(call)
		end
	})

	flysettings:AddSlider('VerticalSpeed', {
		Text = 'Vertical Speed',
		Min = 1,
		Max = 1000,
		Rounding = 0,
		Default = 80,
		Callback = function() end
	})

	inputservice.InputBegan:Connect(function(input)
		if input.KeyCode == Enum.KeyCode.LeftShift or input.KeyCode == Enum.KeyCode.Space then
			goingup = input.KeyCode == Enum.KeyCode.Space and true or false
			goingdown = input.KeyCode == Enum.KeyCode.LeftShift and true or false
		end
	end)
	
	inputservice.InputEnded:Connect(function(input)
		if input.KeyCode == Enum.KeyCode.LeftShift or input.KeyCode == Enum.KeyCode.Space then
			goingup = input.KeyCode == Enum.KeyCode.Space and false
			goingdown = input.KeyCode == Enum.KeyCode.LeftShift and false
		end
	end)

    local minigameslist = {
        DoggyJump = 'DoggyJumpWin'
    }

    local minigames = tabs.Main:AddRightGroupbox('Mini Games')
    minigames:AddToggle('AutoPlay_MiniGames', {
        Text = 'Auto Win Minigames',
        Callback = function(call)
            if call then
                repeat
                    for i,v in Options.Minigames_Dropdown.Value do
                        for i2 = 1, 6 do
                            store.remotes.Event:FireServer(minigameslist[i], i2)
                            task.wait(0.03)
                        end
                    end
                    task.wait(1)
                until not Toggles.AutoPlay_MiniGames.Value
            end
        end
    })
    minigames:AddDropdown('Minigames_Dropdown', {
        Text = 'Minigames',
        Values = {'DoggyJump'},
        Multi = true,
        Default = {'DoggyJump'},
        Callback = function() end
    })
    minigames:AddToggle('AutoClaimQuests', {
        Text = 'Auto Claim Quests',
        Callback = function(call)
            if call then
                repeat
                    for i = 1, 20 do
                        store.remotes.Event:FireServer('ClaimPrize', i)
                        task.wait(0.05)
                    end
                    task.wait(1)
                until not Toggles.AutoClaimQuests.Value
            end
        end
    })
    minigames:AddToggle('AutoHatch', {
        Text = 'Auto Hatch Egg',
        Callback = function(call)
            if call then
                repeat
                    store.remotes.Event:FireServer('HatchEgg', Options.AutoHatchEggs.Value, 6)
                    task.wait(0.5)
                until not Toggles.AutoHatch.Value
            end
        end
    })

    local eggs = {}

    for i,v in store.modules.egg do
        table.insert(eggs, i)
    end

    local egglabel = nil
    local eggprice = nil

    local labels = {}

    minigames:AddDropdown('AutoHatchEggs', {
        Text = 'Eggs',
        Values = eggs,
        AllowNull = true,
        Callback = function(val)
            local eggs = {}
            local real = 1
            eggprice:SetText('Egg Price: '..store.modules.egg[val].Cost.Amount.. ' '.. store.modules.egg[val].Cost.Currency)
            for i,v in store.modules.egg[val].Pool do
                if labels[real] then
                    labels[real]:SetText(`{v.Item.Name} ({v.Chance}%)`)
                else
                    labels[real] = minigames:AddLabel(`{v.Item.Name} ({v.Chance}%)`)
                end
                real += 1
            end
        end
    })
    
    eggprice = minigames:AddLabel('Egg Price: ')
    egglabel = minigames:AddLabel('Pets & Chances:')

end, function(...)
	task.spawn(error, ...)
end)

xpcall(function()
    local lastgetentity = {
        rate = tick(),
        entities = {}
    }
    local getentities = function(ignoreplayer)
        if lastgetentity.rate > tick() then return lastgetentity.entities end
        local entitytable = {}
        for i,v in workspace:GetDescendants() do
            if v ~= lplr.Character and v:FindFirstChild('HumanoidRootPart') and v:FindFirstChild('Humanoid') then
                local isplayer = players:GetPlayerFromCharacter(v)
                if ignoreplayer and not isplayer then
                    table.insert(entitytable, {
                        Name = isplayer ~= nil and isplayer.DisplayName or v.Name,
                        Character = v,
                        isAlive = v:FindFirstChild('Humanoid') and v.Humanoid.Health > 0 and getRoot(v) and true or false,
                        Player = isplayer
                    })
                end
            end
        end
        lastgetentity.entities = entitytable
        lastgetentity.rate = tick() + 4
        return entitytable
    end
    
    local esptab = tabs.Visual:AddLeftTabbox('ESP')
    
    local highlightsettings = {
        fill = Color3.new(1,1,1),
        outline = Color3.new(1,1,1),
        filltransprency = 0.5,
        outlinetransparency = 0.5
    }
    
    local tracerlinecolor = Color3.new(1,1,1)
    
    local nametagscolor = Color3.new(1,1,1)
    
    local espmodule = esptab:AddTab('ESP Modules')
    local drawinglibtable = {}
    local espsettings = esptab:AddTab('Settings')
    local function func()
        for i,v in getentities() do
            if v.Character:FindFirstChild('Head') and v.Character.Head:FindFirstChild('esplol') then
                v.Character.Head.esplol:Destroy()
            end
            if v.Character:FindFirstChild('esplol') then
                for i = 1, 5 do
                    local part = v.Character:FindFirstChild('esplol')
                    if part then part:Destroy() end
                end
            end
            if Toggles.IgnorePlayer.Value and v.Player then return end
            if Toggles.Highlight.Value and v.isAlive then
                local highlight = Instance.new('Highlight', v.Character)
                highlight.Name = 'esplol'
                highlight.FillColor = highlightsettings.fill
                highlight.OutlineColor = highlightsettings.outline
                highlight.FillTransparency = highlightsettings.filltransprency
                highlight.OutlineTransparency = highlightsettings.outlinetransparency
            end
            if Toggles.NameTags.Value and v.isAlive then
                local size = Instance.new('GetTextBoundsParams')
                size.Width = math.huge
                size.Size = 19
                size.Text = v.Name
                size.Font = gameFont
    
                local textSize = textService:GetTextBoundsAsync(size)
    
                local gui = Instance.new('BillboardGui', v.Character:FindFirstChild('Head') and v.Character.Head or v.Character.PrimaryPart)
                gui.Size = UDim2.new(0, textSize.X, 0, 27)
                gui.Name = 'esplol'
                gui.StudsOffset = Vector3.new(0, 3, 0)
                gui.AlwaysOnTop = true
                
                local label = Instance.new('TextLabel', gui)
                label.BackgroundTransparency = 0.3
                label.Text = v.Name
                label.TextSize = 16
                label.FontFace = gameFont
                label.BorderSizePixel = 0
                label.TextColor3 = nametagscolor
                label.BackgroundColor3 = Color3.new()
                label.Size = UDim2.new(1, 0, 1, 0)
            end
        end
    end
    espmodule:AddToggle('NameTags', {
        Text = 'Name Tags',
        Callback = func
    })
    espmodule:AddToggle('Highlight', {
        Text = 'Highlights',
        Callback = func
    })
    local tracercon
    
    espmodule:AddToggle('Tracers', {
        Text = 'Tracers',
        Callback = function(call)
            if call then
                tracercon = task.spawn(function()
                    repeat
                        for i,v in drawinglibtable do
                            v:Destroy()
                        end
                        table.clear(drawinglibtable)
                        for i,v in getentities(Toggles.IgnorePlayer.Value) do
                            if not getRoot(lplr.Character) then return end
                            if not getRoot(v.Character) then return end
                            local localchar = inputservice:GetMouseLocation() --workspace.CurrentCamera:WorldToViewportPoint(getRoot(lplr.Character).Position) funny
                            local entchar = workspace.CurrentCamera:WorldToViewportPoint(getRoot(v.Character).Position)
                            local a, onscreen = workspace.CurrentCamera:WorldToScreenPoint(getRoot(v.Character).Position)
                            if onscreen and Drawing then
                                local line = Drawing.new('Line')
                                line.Visible = true
                                line.From = Vector2.new(localchar.X, localchar.Y)
                                line.To =  Vector2.new(entchar.X, entchar.Y)
                                line.Color = tracerlinecolor
                                line.Thickness = 1
                                table.insert(drawinglibtable, line)
                            end
                        end
                        task.wait(0)
                    until false
                end)
            else
                for i,v in drawinglibtable do
                    v:Destroy()
                end
                table.clear(drawinglibtable)
                if tracercon then
                    pcall(task.cancel, tracercon)
                end
            end
        end
    })
    espsettings:AddLabel('Highlight Fill Color'):AddColorPicker('FillColorPicker', {
        Title = 'Highlight Fill Color',
        Default = Color3.new(1, 1, 1),
        Transparency = 0,
        Callback = function(val)
            highlightsettings.fill = val
            spawn(func)
        end
    })
    espsettings:AddLabel('Highlight Outline Color'):AddColorPicker('OutlineColorPicker', {
        Title = 'Highlight Outline Color',
        Transparency = 0,
        Default = Color3.new(1, 1, 1),
        Callback = function(val)
            highlightsettings.outline = val
            spawn(func)
        end
    })
    espsettings:AddSlider('FillTrans', {
        Text = 'Highlight Fill Transparency',
        Min = 0,
        Max = 1,
        Rounding = 2,
        Default = 0.5,
        Callback = function(val)
            highlightsettings.filltransprency = val
            spawn(func)
        end
    })
    espsettings:AddSlider('OutlineTrans', {
        Text = 'Highlight Outline Transparency',
        Min = 0,
        Max = 1,
        Rounding = 2,
        Default = 0.2,
        Callback = function(val)
            highlightsettings.outlinetransparency = val
            spawn(func)
        end
    })
    espsettings:AddLabel('Tracer Line Color'):AddColorPicker('TracerColorPicker', {
        Title = 'Tracer Line Color',
        Default = Color3.new(1, 1, 1),
        Transparency = 0,
        Callback = function(val)
            tracerlinecolor = val
        end
    })
    espsettings:AddLabel('NameTags Color'):AddColorPicker('NameTagsColorPicker', {
        Title = 'NameTags Color',
        Default = Color3.new(1, 1, 1),
        Transparency = 0,
        Callback = function(Value)
            nametagscolor = Value
        end
    })
    
    espsettings:AddToggle('IgnorePlayer', {
        Text = 'Ignore Players'
    })

    espsettings:AddToggle('IncludeIsland', {
        Text = 'Include Islands',
        Callback = function(call)
            if call then
                
            end
        end
    })
end, function(...)
    task.spawn(error, ...)
end)

--> settigns

local MenuGroup = tabs['UI Settings']:AddLeftGroupbox('Menu')
MenuGroup:AddDivider()
MenuGroup:AddToggle('KeybindMenuOpen', { Default = Library.KeybindFrame.Visible, Text = 'Open Keybind Menu', Callback = function(value) Library.KeybindFrame.Visible = value end})
MenuGroup:AddToggle('ShowCustomCursor', {Text = 'Custom Cursor', Default = false, Callback = function(Value) Library.ShowCustomCursor = Value end})
MenuGroup:AddDivider()
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'RightShift', NoUI = false, Text = 'Menu keybind' })
MenuGroup:AddButton('Unload', function() 
	Library:Unload() 
end)
Library.ToggleKeybind = Options.MenuKeybind
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
ThemeManager:SetFolder('bloxfruit/settings')
SaveManager:SetFolder('bloxfruit/settings')
SaveManager:BuildConfigSection(tabs['UI Settings'])
ThemeManager:ApplyToTab(tabs['UI Settings'])
SaveManager:LoadAutoloadConfig()