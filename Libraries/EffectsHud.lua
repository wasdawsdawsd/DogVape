local sgui: ScreenGui = Instance.new("ScreenGui", game.CoreGui)
sgui.Name = "EffectsHud"
sgui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling


local PosFrame: Frame = Instance.new("Frame", sgui)
PosFrame.Name = "PosFrame"
PosFrame.BackgroundTransparency = 1

PosFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
PosFrame.Size = UDim2.new(0, 44, 0, 44)
PosFrame.BorderSizePixel = 0
PosFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)


local UIListLayout: UIListLayout = Instance.new("UIListLayout", PosFrame)
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.Padding = UDim.new(0, 6)

local EffectsHud = {}
function EffectsHud:AddEffect(icon: string, name: string, timer: number): (string, string, number) -> ()
	local timer = tick() + timer
	
	local EffectHolder: Frame = Instance.new("Frame", PosFrame)
	EffectHolder.Name = name.."Effect"
	EffectHolder.BackgroundTransparency = 0.6
	EffectHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
	EffectHolder.Size = UDim2.new(0, 187, 0, 59)
	EffectHolder.BorderSizePixel = 0
	EffectHolder.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Instance.new("UICorner", EffectHolder).CornerRadius = UDim.new(0, 4)

	local EffectImage: ImageLabel = Instance.new("ImageLabel", EffectHolder)
	EffectImage.Image = icon:find("rbxassetid://") and icon or "rbxassetid://"..icon
	EffectImage.Name = "EffectImage"
	EffectImage.Position = UDim2.new(0.033519555, 0, 0.102, 0)
	EffectImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
	EffectImage.Size = UDim2.new(0, 48, 0, 48)
	EffectImage.BorderSizePixel = 0
	EffectImage.BackgroundTransparency = 1
	EffectImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)


	local EffectName: TextLabel = Instance.new("TextLabel", EffectHolder)
	EffectName.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	EffectName.TextColor3 = Color3.fromRGB(255, 255, 255)
	EffectName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	EffectName.Text = name
	EffectName.Name = "EffectName"
	EffectName.Size = UDim2.new(0, 102, 0, 28)
	EffectName.Position = UDim2.new(0.330564946, 0, 0.102, 0)
	EffectName.BackgroundTransparency = 1
	EffectName.TextXAlignment = Enum.TextXAlignment.Left
	EffectName.BorderSizePixel = 0
	EffectName.TextWrapped = true
	EffectName.TextSize = 20
	EffectName.BackgroundColor3 = Color3.fromRGB(0, 0, 0)


	local EffectTimer: TextLabel = Instance.new("TextLabel", EffectHolder)
	EffectTimer.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	EffectTimer.TextColor3 = Color3.fromRGB(255, 170, 0)
	EffectTimer.BorderColor3 = Color3.fromRGB(0, 0, 0)
	EffectTimer.Text = "0:00"
	EffectTimer.Name = "EffectTimer"
	EffectTimer.Size = UDim2.new(0, 102, 0, 28)
	EffectTimer.Position = UDim2.new(0.330564946, 0, 0.441, 0)
	EffectTimer.BackgroundTransparency = 1
	EffectTimer.TextXAlignment = Enum.TextXAlignment.Left
	EffectTimer.BorderSizePixel = 0
	EffectTimer.TextWrapped = true
	EffectTimer.TextSize = 20
	EffectTimer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	
	task.spawn(function()
		repeat
			task.wait()
			local minutes = math.floor((timer - tick()) / 60)
			local seconds = math.ceil((timer - tick()) % 60)
			EffectTimer.Text = minutes..":"..string.format("%0.2i", seconds)
			if (timer - tick()) <= 0 then
				EffectHolder:Destroy()
				break
			end
		until EffectHolder == nil
	end)
end
EffectsHud.sgui = sgui
EffectsHud.frame = PosFrame
function EffectsHud:RemoveEffect(name: string): (string) -> ()
	for i, v in PosFrame:GetChildren() do
		if v.Name == name.."Effect" then
			v:Destroy()
		end
	end
end
function EffectsHud:isEffect(name: string): (string) -> (boolean)
	for i, v in PosFrame:GetChildren() do
		if v.Name == name.."Effect" then
			return true
		end
	end
	return false
end
function EffectsHud:SelfDestruct()
	EffectsHud.frame:ClearAllChildren()
	pcall(function()
		EffectsHud.sgui:Destroy()
	end)
end

return EffectsHud