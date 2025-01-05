local mainapi = {
	Categories = {},
	GUIColor = {
		Hue = 1,
		Sat = 1,
		Value = 1
	},
	HeldKeybinds = {},
	Keybind = {'RightShift'},
	Loaded = false,
	Libraries = {},
	Modules = {},
	Place = game.PlaceId,
	Profile = 'default',
	Profiles = {},
	RainbowSpeed = {Value = 1},
	RainbowUpdateSpeed = {Value = 60},
	RainbowTable = {},
	Scale = {Value = 1},
	ThreadFix = setthreadidentity and true or false,
	ToggleNotifications = {},
	Version = '5.0',
	Visible = false,
	Windows = {}
}

local cloneref = cloneref or function(obj)
	return obj
end
local tweenService = cloneref(game:GetService('TweenService'))
local inputService = cloneref(game:GetService('UserInputService'))
local textService = cloneref(game:GetService('TextService'))
local guiService = cloneref(game:GetService('GuiService'))
local httpService = cloneref(game:GetService('HttpService'))
local fpsmode = inputService.TouchEnabled

local fontsize = Instance.new('GetTextBoundsParams')
fontsize.Width = math.huge
local notifications
local assetfunction = getcustomasset
local getcustomasset
local clickgui
local scaledgui
local mainframe
local mainscale
local sidebar
local categoryholder
local categoryhighlight
local lastSelected
local guiTween
local scale
local gui

local color = {}
local tween = {
	tweens = {},
	tweenstwo = {}
}

local uipallet = {
	Main = Color3.fromRGB(254, 254, 254),
	MainColor = Color3.fromRGB(41, 166, 255),
	TextLight = Color3.new(1, 1, 1),
	TextDark = Color3.new(0, 0, 0),
	Tween1 = TweenInfo.new(0.1, Enum.EasingStyle.Linear),
	Tween2 = TweenInfo.new(0.2, Enum.EasingStyle.Linear),
}

local getcustomassets = {
    ["newcatvape/assets/sigma/check.png"] = "rbxassetid://105451289257415",
    ["newcatvape/assets/sigma/circleblur.png"] = "rbxassetid://70471624673038",
    ['newcatvape/assets/sigma/blur.png'] = 'rbxassetid://14898786664',
    ['newcatvape/assets/sigma/alert.png'] = 'rbxasset://newcatvape/assets/sigma/alert.png',
    ['newcatvape/assets/sigma/cancel.png'] = 'rbxasset://newcatvape/assets/sigma/cancel.png',
    ['newcatvape/assets/sigma/done.png'] = 'rbxasset://newcatvape/assets/sigma/done.png',
    ['newcatvape/assets/sigma/gingerbread.png'] = 'rbxasset://newcatvape/assets/sigma/gingerbread.png',
    ['newcatvape/assets/sigma/info.png'] = 'rbxasset://newcatvape/assets/sigma/info.png',
    ['newcatvape/assets/sigma/play.png'] = 'rbxasset://newcatvape/assets/sigma/play.png',
    ['newcatvape/assets/sigma/warn.png'] = 'rbxasset://newcatvape/assets/sigma/warn.png'
}

local isfile = isfile or function(file)
	local suc, res = pcall(function()
		return readfile(file)
	end)
	return suc and res ~= nil and res ~= ''
end

local getfontsize = function(text, size, font)
	fontsize.Text = text
	fontsize.Size = size
	if typeof(font) == 'Font' then
		fontsize.Font = font
	end
	return textService:GetTextBoundsAsync(fontsize)
end

local function addBlur(parent, notif)
	local blur = Instance.new('ImageLabel')
	blur.Name = 'Blur'
	blur.Size = UDim2.new(1, 89, 1, 52)
	blur.Position = UDim2.fromOffset(-48, -31)
	blur.ImageColor3 = parent.BackgroundColor3
	blur.BackgroundTransparency = 1
	blur.Image = getcustomasset('newcatvape/assets/sigma/blur.png')
	blur.ScaleType = Enum.ScaleType.Slice
	blur.SliceCenter = Rect.new(52, 31, 261, 502)
	blur.Parent = parent

	return blur
end

local function addCorner(parent, radius)
	local corner = Instance.new('UICorner')
	corner.CornerRadius = radius or UDim.new(0, 5)
	corner.Parent = parent

	return corner
end

local function addMaid(object)
	object.Connections = {}
	function object:Clean(callback)
		if typeof(callback) == 'Instance' then
			table.insert(self.Connections, {
				Disconnect = function()
					callback:ClearAllChildren()
					callback:Destroy()
				end
			})
		elseif type(callback) == 'function' then
			table.insert(self.Connections, {
				Disconnect = callback
			})
		else
			table.insert(self.Connections, callback)
		end
	end
end

local function createMobileButton(buttonapi, position)
	if not inputService.TouchEnabled then return end
	local heldbutton = false
	local button = Instance.new('TextButton')
	button.Size = UDim2.fromOffset(40, 40)
	button.Position = UDim2.fromOffset(position.X, position.Y)
	button.AnchorPoint = Vector2.new(0.5, 0.5)
	button.BackgroundColor3 = buttonapi.Enabled and Color3.new(0, 0.7, 0) or Color3.new()
	button.BackgroundTransparency = 0.5
	button.Text = buttonapi.Name
	button.TextColor3 = Color3.new(1, 1, 1)
	button.TextScaled = true
	button.Font = Enum.Font.Gotham
	button.Parent = mainapi.gui
	local buttonconstraint = Instance.new('UITextSizeConstraint')
	buttonconstraint.MaxTextSize = 16
	buttonconstraint.Parent = button
	addCorner(button, UDim.new(0.1, 0))

	button.MouseButton1Down:Connect(function()
		heldbutton = true
		local holdtime, holdpos = tick(), inputService:GetMouseLocation()
		repeat
			heldbutton = (inputService:GetMouseLocation() - holdpos).Magnitude < 6
			task.wait()
		until (tick() - holdtime) > 1 or not heldbutton
		if heldbutton then
			buttonapi.Bind = {}
			button:Destroy()
		end
	end)
	button.MouseButton1Up:Connect(function()
		heldbutton = false
	end)
	button.MouseButton1Click:Connect(function()
		buttonapi:Toggle()
		button.BackgroundColor3 = buttonapi.Enabled and Color3.new(0, 0.7, 0) or Color3.new()
	end)

	buttonapi.Bind = {Button = button}
end

local function downloadFile(path, func)
	if not isfile(path) then
		createDownloader(path)
		local suc, res = pcall(function()
			return game:HttpGet('https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/'..readfile('newcatvape/profiles/commit.txt')..'/'..select(1, path:gsub('newcatvape/', '')), true)
		end)
		if not suc or res == '404: Not Found' then
			error(res)
		end
		if path:find('.lua') then
			res = '--This watermark is used to delete the file if its cached, remove it to make the file persist after vape updates.\n'..res
		end
		writefile(path, res)
	end
	return (func or readfile)(path)
end

getcustomasset = not inputService.TouchEnabled and assetfunction and function(path)
	return downloadFile(path, assetfunction)
end or identifyexecutor():lower():find("delta") and assetfunction and function(path)
	return downloadFile(path, assetfunction)
end or function(path)
	return getcustomassets[path] or ''
end

local function writeSffont()
	if not assetfunction then return 'rbxasset://fonts/roboto.json' end
	writefile('newcatvape/assets/sigma/sfdisplay.json', httpService:JSONEncode({
		name = 'SF-UI Display',
		faces = {
			--{style = 'normal', assetId = getcustomasset('newcatvape/assets/sigma/fonts/Geomanist-Regular.otf'), name = 'Geomanist', weight = 400},
			--{style = 'normal', assetId = getcustomasset('newcatvape/assets/sigma/fonts/HelveticaNeue-Light.ttf'), name = 'HelveticaNeueLight', weight = 300},
			{style = 'normal', assetId = getcustomasset('newcatvape/assets/sigma/fonts/SF-UI-Display-Bold.otf'), name = 'Bold', weight = 600},
			{style = 'normal', assetId = getcustomasset('newcatvape/assets/sigma/fonts/SF-UI-Display-Light.otf'), name = 'Light', weight = 300},
			{style = 'normal', assetId = getcustomasset('newcatvape/assets/sigma/fonts/SF-UI-Display-Medium.otf'), name = 'Medium', weight = 500},
			{style = 'normal', assetId = getcustomasset('newcatvape/assets/sigma/fonts/SF-UI-Display-Regular.otf'), name = 'Regular', weight = 400},
			{style = 'normal', assetId = getcustomasset('newcatvape/assets/sigma/fonts/SF-UI-Display-Semibold.otf'), name = 'SemiBold', weight = 550},
			{style = 'normal', assetId = getcustomasset('newcatvape/assets/sigma/fonts/SF-UI-Display-Semibold-1.otf'), name = 'Black', weight = 550},
			{style = 'normal', assetId = getcustomasset('newcatvape/assets/sigma/fonts/SF-UI-Display-Thin.otf'), name = 'Thin', weight = 350},
		}
	}))
	return getcustomasset('newcatvape/assets/sigma/sfdisplay.json')
end
local function writeSigmafont()
	if not assetfunction then return 'rbxasset://fonts/roboto.json' end
	writefile('newcatvape/assets/sigma/sigmafont.json', httpService:JSONEncode({
		name = 'Sigma',
		faces = {
			{style = 'normal', assetId = getcustomasset('newcatvape/assets/sigma/fonts/Geomanist-Regular.otf'), name = 'Regular', weight = 400},
			{style = 'normal', assetId = getcustomasset('newcatvape/assets/sigma/fonts/HelveticaNeue-Light.ttf'), name = 'Light', weight = 300},
    	}
	}))
	return getcustomasset('newcatvape/assets/sigma/sigmafont.json')
end

local function getTableSize(tab)
	local ind = 0
	for _ in tab do ind += 1 end
	return ind
end

local function loopClean(tab)
	for i, v in tab do
		if type(v) == 'table' then
			loopClean(v)
		end
		tab[i] = nil
	end
end

local function loadJson(path)
	local suc, res = pcall(function()
		return httpService:JSONDecode(readfile(path))
	end)
	return suc and type(res) == 'table' and res or nil
end

local function makeDraggable(gui, window)
	gui.InputBegan:Connect(function(inputObj)
		if window and not window.Visible then return end
		if
			(inputObj.UserInputType == Enum.UserInputType.MouseButton1 or inputObj.UserInputType == Enum.UserInputType.Touch)
			and (inputObj.Position.Y - gui.AbsolutePosition.Y < 40 or window)
		then
			local dragPosition = Vector2.new(
				gui.AbsolutePosition.X - inputObj.Position.X,
				gui.AbsolutePosition.Y - inputObj.Position.Y + guiService:GetGuiInset().Y
			) / scale.Scale

			local changed = inputService.InputChanged:Connect(function(input)
				if input.UserInputType == (inputObj.UserInputType == Enum.UserInputType.MouseButton1 and Enum.UserInputType.MouseMovement or Enum.UserInputType.Touch) then
					local position = input.Position
					if inputService:IsKeyDown(Enum.KeyCode.LeftShift) then
						dragPosition = (dragPosition // 3) * 3
						position = (position // 3) * 3
					end
					gui.Position = UDim2.fromOffset((position.X / scale.Scale) + dragPosition.X, (position.Y / scale.Scale) + dragPosition.Y)
				end
			end)

			local ended
			ended = inputObj.Changed:Connect(function()
				if inputObj.UserInputState == Enum.UserInputState.End then
					if changed then
						changed:Disconnect()
					end
					if ended then
						ended:Disconnect()
					end
				end
			end)
		end
	end)
end

local function randomString()
	local array = {}
	for i = 1, math.random(10, 100) do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end

local function removeTags(str)
	str = str:gsub('<br%s*/>', '\n')
	return str:gsub('<[^<>]->', '')
end

do
    local sfdisplayfont = writeSffont()
	uipallet.Font = Font.new(sfdisplayfont, Enum.FontWeight.Regular)
	uipallet.FontMedium = Font.new(sfdisplayfont, Enum.FontWeight.Medium)
	uipallet.FontSemiBold = Font.new(sfdisplayfont, Enum.FontWeight.SemiBold)
	uipallet.FontLight = Font.new(sfdisplayfont, Enum.FontWeight.Light)
	uipallet.FontBold = Font.new(sfdisplayfont, Enum.FontWeight.Bold)
	local sigmafont = writeSigmafont()
	uipallet.FontGeomanist = Font.new(sigmafont, Enum.FontWeight.Regular)
	uipallet.FontHelvetica = Font.new(sigmafont, Enum.FontWeight.Light)
	local res = isfile('newcatvape/profiles/color.txt') and loadJson('newcatvape/profiles/color.txt')
	fontsize.Font = uipallet.Font
end

do
	function color.Dark(col, num)
		local h, s, v = col:ToHSV()
		return Color3.fromHSV(h, s, math.clamp(select(3, uipallet.Main:ToHSV()) > 0.5 and v + num or v - num, 0, 1))
	end

	function color.Light(col, num)
		local h, s, v = col:ToHSV()
		return Color3.fromHSV(h, s, math.clamp(select(3, uipallet.Main:ToHSV()) > 0.5 and v - num or v + num, 0, 1))
	end

	function mainapi:Color(h)
		local s = 0.75 + (0.15 * math.min(h / 0.03, 1))
		if h > 0.57 then
			s = 0.9 - (0.4 * math.min((h - 0.57) / 0.09, 1))
		end
		if h > 0.66 then
			s = 0.5 + (0.4 * math.min((h - 0.66) / 0.16, 1))
		end
		if h > 0.87 then
			s = 0.9 - (0.15 * math.min((h - 0.87) / 0.13, 1))
		end
		return h, s, 1
	end

	function mainapi:TextColor(h, s, v)
		if v >= 0.7 and (s < 0.6 or h > 0.04 and h < 0.56) then
			return Color3.new(0.19, 0.19, 0.19)
		end
		return Color3.new(1, 1, 1)
	end
end

do
	function tween:Tween(obj, tweeninfo, goal, tab)
		tab = tab or self.tweens
		if tab[obj] then
			tab[obj]:Cancel()
		end

		if obj.Parent and obj.Visible then
			tab[obj] = tweenService:Create(obj, tweeninfo, goal)
			tab[obj].Completed:Once(function()
				if tab then
					tab[obj] = nil
					tab = nil
				end
			end)
			tab[obj]:Play()
		else
			for i, v in goal do
				obj[i] = v
			end
		end
	end

	function tween:Cancel(obj)
		if self.tweens[obj] then
			self.tweens[obj]:Cancel()
			self.tweens[obj] = nil
		end
	end
end

mainapi.Libraries = {
	color = color,
	getcustomasset = getcustomasset,
	getfontsize = getfontsize,
	tween = tween,
	uipallet = uipallet,
	base64 = loadstring(downloadFile("newcatvape/libraries/base64.lua"), "base64")(),
	spotify = loadstring(downloadFile("newcatvape/libraries/spotify.lua"), "spotify")()
}

local components
components = {
	Button = function(optionsettings, children, api)
	    
    end,
	ColorSlider = function(optionsettings, children, api)
	    
    end,
	Dropdown = function(optionsettings, children, api)
	    
	end,
	Font = function(optionsettings, children, api)
	    
	end,
	Slider = function(optionsettings, children, api)
	    
	end,
	Targets = function(optionsettings, children, api)
	    
	end,
	TargetsButton = function(optionsettings, children, api)
	    
	end,
	TextBox = function(optionsettings, children, api)
	    
	end,
	TextList = function(optionsettings, children, api)
	    
	end,
	Toggle = function(optionsettings, children, api)
	    
	end,
	TwoSlider = function(optionsettings, children, api)
	    
	end,
	Divider = function(children, text)
	    
	end
}

mainapi.Components = setmetatable(components, {
	__newindex = function(self, ind, func)
		for _, v in mainapi.Modules do
			rawset(v, 'Create'..ind, function(_, settings)
				return func(settings, v.Children, v)
			end)
		end

		if mainapi.Legit then
			for _, v in mainapi.Legit.Modules do
				rawset(v, 'Create'..ind, function(_, settings)
					return func(settings, v.Children, v)
				end)
			end
		end

		rawset(self, ind, func)
	end
})

addMaid(mainapi)

function mainapi:CreateNotification()
	
end

local categories = 0
function mainapi:CreateGUI()
    local categoryapi = {
		Type = 'MainWindow',
		Buttons = {},
		Options = {}
	}
	
	function categoryapi:CreateButton()
        
	end
    
	function categoryapi:CreateDivider(text)
		return components.Divider(children, text)
	end
	
	function categoryapi:CreateOverlayBar()
        
	end
    
    function categoryapi:CreateSettingsDivider()
        return components.Divider(settingschildren)
    end
    
    function categoryapi:CreateSettingsPane()
        
    end
    
    function categoryapi:CreateGUISlider()
        
    end
    return categoryapi
end

function mainapi:CreateCategory(categorysettings)
	local categoryapi = {
		Type = 'Category',
		Expanded = false
	}
	
	local function calculatePosition(layout)
		local x, y = 0, 0
        if layout < 5 then
            x = 210 * categories
			y = 90
		elseif layout >= 5 then
			x = 210 * (categories - 4)
			y = 420
        end
        return x, y
	end
	
    local window = Instance.new("Frame", clickgui)
	window.Name = categorysettings.Name.."Category"
	window.Position = UDim2.fromOffset(calculatePosition(categorysettings.Layout or categories))
	window.BackgroundColor3 = uipallet.Main
	window.Size = UDim2.fromOffset(200, 60)
	window.BackgroundTransparency = 0.07
	window.BorderSizePixel = 0
	makeDraggable(window)
	local windowname = Instance.new("TextLabel", window)
	windowname.Position = UDim2.new(0.091, 2, 0.238, 2)
	windowname.Size = UDim2.fromOffset(150, 30)
	windowname.FontFace = uipallet.FontHelvetica
	windowname.Text = categorysettings.Name
	windowname.BackgroundTransparency = 1
	windowname.TextScaled = true
	windowname.TextSize = 30
	windowname.TextColor3 = Color3.fromRGB(160, 160, 160)
	windowname.TextXAlignment = "Left"
	local moduleholder = Instance.new("ScrollingFrame", window)
	moduleholder.Name = "ModuleHolder"
	moduleholder.BackgroundColor3 = uipallet.Main
	moduleholder.Position = UDim2.fromScale(0, 1)
	moduleholder.Size = UDim2.new(1, 0, 0, 260)
	moduleholder.BorderSizePixel = 0
	moduleholder.BottomImage = ""
	moduleholder.ScrollingDirection = "Y"
	moduleholder.ScrollBarThickness = 0
	local layout = Instance.new("UIListLayout", moduleholder)
	categoryapi.Object = window
	--[[local shadow = moduleholder:Clone()
	shadow:ClearAllChildren()
	shadow.Size = UDim2.new(1, 0, 0, 320)
	shadow.Active = false
	shadow.BackgroundTransparency = 1
	shadow.Parent = window
	shadow.Position = UDim2.fromScale(0, 0)
	addBlur(shadow)]]
	self.Categories[categorysettings.RealName or categorysettings.Name] = categoryapi
	
	function categoryapi:CreateModule(modulesettings)
		--mainapi:Remove(modulesettings.Name)
		local moduleapi = {
			Enabled = false,
			Options = {},
			Bind = {},
			Index = getTableSize(mainapi.Modules),
			ExtraText = modulesettings.ExtraText,
			Name = modulesettings.Name,
			Connections = {},
			Category = categorysettings.Name
		}
		
		local modulebutton = Instance.new("TextButton", moduleholder)
		modulebutton.Size = UDim2.fromOffset(200, 30)
		modulebutton.Position = UDim2.fromScale(0, 0)
		modulebutton.BorderSizePixel = 0
		modulebutton.BackgroundColor3 = uipallet.Main
		modulebutton.Text = ""
		modulebutton.Name = modulesettings.Name
		modulebutton.AutoButtonColor = false
		local modulename = Instance.new("TextLabel", modulebutton)
		modulename.Size = UDim2.fromScale(0.884, 0.8)
		modulename.Position = UDim2.new(0.091, 2, 0.15, 0)
		modulename.FontFace = uipallet.FontHelvetica
		modulename.Text = modulesettings.Name
		modulename.BackgroundTransparency = 1
		modulename.TextScaled = true
		modulename.TextColor3 = uipallet.TextDark
		modulename.TextXAlignment = "Left"
		
		local hovershadow = modulebutton:Clone()
		hovershadow.Name = modulebutton.Name.."Shadow"
		hovershadow.Size = UDim2.fromScale(1, 1)
		hovershadow.Position = UDim2.fromScale(0, 0)
		hovershadow.BackgroundColor3 = Color3.new(0, 0, 0)
		hovershadow.BackgroundTransparency = 1
		hovershadow.Parent = modulebutton
		hovershadow.Active = false
		
		addMaid(moduleapi)
		
		function moduleapi:SetBind(tab)
			if tab.Mobile then
			    createMobileButton(moduleapi, Vector2.new(tab.X, tab.Y))
				return
			end

			self.Bind = table.clone(tab)
		end
		
		local hovered = false
		function moduleapi:Toggle(multiple)
			if mainapi.ThreadFix then
				setthreadidentity(8)
			end
			self.Enabled = not self.Enabled
			modulename.TextColor3 = self.Enabled and uipallet.TextLight or uipallet.TextDark
			modulebutton.BackgroundColor3 = self.Enabled and uipallet.MainColor or uipallet.Main
			modulename.Position = self.Enabled and UDim2.new(0.091, 10, 0.15, 0) or UDim2.new(0.091, 2, 0.15, 0)
			hovershadow.TextLabel.TextColor3 = modulename.TextColor3
			hovershadow.TextLabel.Position = modulename.Position
			if not self.Enabled then
				for _, v in self.Connections do
					v:Disconnect()
				end
				table.clear(self.Connections)
			end
			if not multiple then
				--mainapi:UpdateTextGUI()
			end
			task.spawn(modulesettings.Function, self.Enabled)
		end
		modulebutton.MouseEnter:Connect(function()
			hovered = true
			tween:Tween(hovershadow, uipallet.Tween1, {
				BackgroundTransparency = 0.9
			})
		end)
		modulebutton.MouseLeave:Connect(function()
			hovered = false
			tween:Tween(hovershadow, uipallet.Tween1, {
				BackgroundTransparency = 1
			})
		end)
		modulebutton.MouseButton1Click:Connect(function()
			moduleapi:Toggle()
		end)
		
		if inputService.TouchEnabled then
            local optionbutton = Instance.new("TextButton", modulebutton)
            optionbutton.Size = UDim2.fromScale(0.09, 0.09)
            optionbutton.Position = UDim2.fromScale(0.85, 0.3)
            optionbutton.BackgroundColor3 = Color3.new(1,1,1)
            optionbutton.BackgroundTransparency = 0.9
            optionbutton.Text = ""
            optionbutton.SizeConstraint = "RelativeXX"
            addCorner(optionbutton, UDim.new(0, 500))
            
            --[[optionbutton.MouseButton1Click:Connect(function()
                modulechildren.Visible = not modulechildren.Visible
    			local height = modulechildren.Visible and (modulechildren.Size.Y.Offset / scale.Scale) + 66 or 76
    			tween:Tween(modulebutton, TweenInfo.new(math.min(height * 3, 450) / 1000, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
    				Size = UDim2.fromOffset(566, height)
    			})
            end)]]
            
			local heldbutton = false
			modulebutton.MouseButton1Down:Connect(function()
				heldbutton = true
				local holdtime, holdpos = tick(), inputService:GetMouseLocation()
				repeat
					heldbutton = (inputService:GetMouseLocation() - holdpos).Magnitude < 3
					task.wait()
				until (tick() - holdtime) > 1 or not heldbutton or not clickgui.Visible
				if heldbutton and clickgui.Visible then
					if mainapi.ThreadFix then
						setthreadidentity(8)
					end
					mainapi.Visible = not mainapi.Visible
					--if mainapi.Visible then
						clickgui.Visible = mainapi.Visible
					--end
					--tooltip.Visible = false
					--mainapi:BlurCheck()
					for _, mobileButton in mainapi.Modules do
						if mobileButton.Bind.Button then
							mobileButton.Bind.Button.Visible = true
						end
					end

					local touchconnection
					touchconnection = inputService.InputBegan:Connect(function(inputType)
						if inputType.UserInputType == Enum.UserInputType.Touch then
							if self.ThreadFix then setthreadidentity(8) end
							createMobileButton(moduleapi, inputType.Position + Vector3.new(0, guiService:GetGuiInset().Y, 0))
							mainapi.Visible = not mainapi.Visible
							--if mainapi.Visible then
							clickgui.Visible = mainapi.Visible
							--end
							--tooltip.Visible = false
							--mainapi:BlurCheck()
							--mainapi:BlurCheck()
							for _, mobileButton in mainapi.Modules do
								if mobileButton.Bind.Button then
									mobileButton.Bind.Button.Visible = false
								end
							end
							touchconnection:Disconnect()
						end
					end)
				end
			end)
			modulebutton.MouseButton1Up:Connect(function()
				heldbutton = false
			end)
		end
		return moduleapi
	end
	
	categories += 1
	return categoryapi
end
function mainapi:CreateLegit()
	local legitapi = {Modules = {}}

	function legitapi:CreateModule(modulesettings)
		modulesettings.Function = modulesettings.Function or function() end
		local module
		module = mainapi.Categories.Legit:CreateModule({
			Name = modulesettings.Name,
			Function = function(callback)
				if module.Children then
					module.Children.Visible = callback
				end
				task.spawn(modulesettings.Function, callback)
			end,
			Tooltip = modulesettings.Tooltip
		})
		if modulesettings.Size then
			local modulechildren = Instance.new('Frame')
			modulechildren.Size = modulesettings.Size
			modulechildren.BackgroundTransparency = 1
			modulechildren.Visible = false
			modulechildren.Parent = scaledgui
			makeDraggable(modulechildren, clickgui)
			module.Children = modulechildren
		end

		return module
	end

	return legitapi
end
gui = Instance.new('ScreenGui')
gui.Name = randomString()
gui.DisplayOrder = 9999999
gui.ZIndexBehavior = Enum.ZIndexBehavior.Global
gui.IgnoreGuiInset = true
gui.OnTopOfCoreBlur = true
gui.Parent = gethui()
gui.ResetOnSpawn = false
mainapi.gui = gui
scaledgui = Instance.new('Frame')
scaledgui.Name = 'ScaledGui'
scaledgui.Size = UDim2.fromScale(1, 1)
scaledgui.BackgroundTransparency = 1
scaledgui.Parent = gui
clickgui = Instance.new('Frame')
clickgui.Name = 'ClickGui'
clickgui.Size = UDim2.fromScale(1, 1)
clickgui.BackgroundTransparency = 1
clickgui.Visible = true
clickgui.Parent = scaledgui
local modal = Instance.new('TextButton')
modal.BackgroundTransparency = 1
modal.Modal = true
modal.Text = ''
modal.Parent = clickgui
local cursor = Instance.new('ImageLabel')
cursor.Size = UDim2.fromOffset(64, 64)
cursor.BackgroundTransparency = 1
cursor.Visible = false
cursor.Image = 'rbxasset://textures/Cursors/KeyboardMouse/ArrowFarCursor.png'
cursor.Parent = gui
notifications = Instance.new('Folder')
notifications.Name = 'Notifications'
notifications.Parent = scaledgui
scale = Instance.new('UIScale')
scale.Scale = math.max(gui.AbsoluteSize.X / 1920, 0.68)
scale.Parent = scaledgui
mainapi.guiscale = scale
scaledgui.Size = UDim2.fromScale(1 / scale.Scale, 1 / scale.Scale)

mainapi:Clean(gui:GetPropertyChangedSignal('AbsoluteSize'):Connect(function()
	if mainapi.Scale.Enabled then
		scale.Scale = math.max(gui.AbsoluteSize.X / 1920, 0.485)
	end
end))

mainapi:Clean(scale:GetPropertyChangedSignal('Scale'):Connect(function()
	scaledgui.Size = UDim2.fromScale(1 / scale.Scale, 1 / scale.Scale)
	for _, v in scaledgui:GetDescendants() do
		if v:IsA('GuiObject') and v.Visible then
			v.Visible = false
			v.Visible = true
		end
	end
end))

mainapi:Clean(clickgui:GetPropertyChangedSignal('Visible'):Connect(function()
		mainapi:UpdateGUI(mainapi.GUIColor.Hue, mainapi.GUIColor.Sat, mainapi.GUIColor.Value, true)
		if clickgui.Visible and inputService.MouseEnabled then
			repeat
				local visibleCheck = clickgui.Visible
				for _, v in mainapi.Windows do
					visibleCheck = visibleCheck or v.Visible
				end
				if not visibleCheck then break end
	
				cursor.Visible = not inputService.MouseIconEnabled
				if cursor.Visible then
					local mouseLocation = inputService:GetMouseLocation()
					cursor.Position = UDim2.fromOffset(mouseLocation.X - 31, mouseLocation.Y - 32)
				end
	
				task.wait()
			until mainapi.Loaded == nil
			cursor.Visible = false
		end
	end))

mainapi:CreateGUI()
mainapi:CreateLegit()
mainapi:CreateCategory({
	Name = "Gui",
	Layout = 1
})
--[[mainapi:CreateCategory({
    Name = "Combat",
    Layout = 2
})
mainapi:CreateCategory({
    Name = "Render",
    Layout = 3
})
mainapi:CreateCategory({
    Name = "World",
    Layout = 4
})
mainapi:CreateCategory({
    Name = "Misc",
    RealName = "Minigames",
    Layout = 5
})
mainapi:CreateCategory({
    Name = "Player",
    RealName = "Utility",
    Layout = 6
})
mainapi:CreateCategory({
    Name = "Item",
    RealName = "Inventory",
    Layout = 7
})
mainapi:CreateCategory({
    Name = "Movement",
    RealName = "Blatant",
    Layou5 = 8
})
mainapi.Categories["Legit"] = mainapi.Categories.Minigames
]]--
for i, v in {"ActiveMods", "BrainFreeze", "Compass", "Cords", "Info HUD", "Keystrokes", "MiniMap", "MusicParticles", "RearView"} do
	mainapi.Categories.Gui:CreateModule({
		Name = v,
		Function = function(callback)
			setclipboard(tostring(callback))
		end
	})
end


return mainapi