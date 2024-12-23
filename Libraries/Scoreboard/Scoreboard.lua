-- made by @new_qwertyui on discord, plesse dont remove credits <3
local scoreboard = {}

local order: number = 1
local sizeX: number = 224

local sgui: ScreenGui
local posframe: Frame
function scoreboard:CreateScoreboard(parent: Instance): (Instance) -> ()
    sgui = Instance.new("ScreenGui", parent or game:GetService("StarterGui"))
    sgui.Name = "Scoreboard"
    sgui.ResetOnSpawn = false
    
    if parent ~= nil then sgui:Destroy() sgui = nil end

    posframe = Instance.new("Frame", parent or sgui)
    posframe.Name = "PositioningFrame"
    posframe.BackgroundTransparency = 1
    posframe.Position = UDim2.new(0.76, 0, 0.5, 0)
    posframe.AnchorPoint = Vector2.new(0.5, 0)
    posframe.BorderColor3 = Color3.fromRGB(0, 0, 0)
    posframe.Size = UDim2.new(-0.5, 0, -0.2, 0)
    posframe.BorderSizePixel = 0
    posframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UIListLayout", posframe).SortOrder = Enum.SortOrder.LayoutOrder
end

local sbname: TextLabel
function scoreboard:AddName(name: string, color: Color3): (string, Color3) -> ()
    sbname = Instance.new("TextLabel", posframe)
    sbname.FontFace = Font.new(getcustomasset("catvape/Libraries/Fonts/mcfonts.json"), Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    --print(color)
    sbname.TextColor3 = color
    sbname.BorderColor3 = Color3.fromRGB(0, 0, 0)
    sbname.RichText = true
    sbname.Text = "<B>"..name.."</B>"
    sbname.Name = "ScoreboardName"
    sbname.BackgroundTransparency = 0.485
    sbname.Position = UDim2.new(1.238095284, 0, 0.9, 0)
    sbname.Size = UDim2.new(0, sizeX + 110, 0, 15 + 10)
    sbname.BorderSizePixel = 0
    sbname.TextSize = 18 + 10
    sbname.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    sbname.LayoutOrder = 0
end

function scoreboard:UpdateName(name: string, color: Color3): (string, Color3) -> ()
    local sbname = posframe:FindFirstChild("ScoreboardName")
    if sbname then
        sbname.TextColor3 = color
        sbname.Text = name
    end
end

function scoreboard:AddLine(id: string?, text: string, color: Color3): (string?, string, Color3) -> (string)
    if text == nil then text = "" color = Color3.fromRGB(0, 0, 0) end
    
    local bar: TextLabel = Instance.new("TextLabel", posframe)
    bar.LayoutOrder = 1
    bar.FontFace = Font.new(getcustomasset("catvape/Libraries/Fonts/mcfonts.json"), Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    --print(color)
    bar.TextColor3 = color or Color3.fromRGB(255, 255, 255)
    bar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    bar.RichText = true
    bar.Text = " "..text
    if text == "" then
        bar.TextTransparency = 1
    end
    bar.Name = id
    bar.Size = UDim2.new(0, sizeX + 110, 0, 15 + 10)
    bar.BackgroundTransparency = 0.6
    bar.TextXAlignment = Enum.TextXAlignment.Left
    bar.Position = UDim2.new(1.000000715, 0, 0.625, 0)
    bar.BorderSizePixel = 0
    bar.TextSize = 18 + 10
    bar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    bar.LayoutOrder = order
    posframe.Position = posframe.Position + UDim2.new(0, 0, -0.015, 0)
    order += 1
    return id
end

function scoreboard:UpdateLine(id: string, text: string, color: Color3): (string, string, Color3) -> ()
    local bar = posframe:FindFirstChild(id)
    if bar then
        text = text or bar.Name
        color = color or bar.TextColor3
        bar.TextColor3 = color
        bar.Text = " "..text
    end
end

function scoreboard:UpdateWidth(width: number): (number) -> ()
    for i, v in pairs(posframe:GetChildren()) do
        pcall(function()
            v.Size = UDim2.new(0, width + 110, 0, 15 + 10)
            sizeX = width
        end)
    end
end
scoreboard.ScreenGui = sgui
scoreboard.Frame = posframe

return scoreboard