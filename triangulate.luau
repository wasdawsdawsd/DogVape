export type bool = boolean

export type table = {}

export type AddToggle = {
    Content: string,
    Title: string,
    Callback: (() -> bool),
    Value: any
}

export type AddSlider = AddToggle & {
    Min: number,
    Max: number,
    Default: any,
    Suffix: {
        Text: string
    }
}

export type AddDropdown = AddToggle & {
    Values: table,
    Multi: boolean
}

--->> Variables <<---

local cloneref = cloneref or function(ref) return ref end;
local players = cloneref(game:GetService('Players'))
local replicatedStorage = cloneref(game:GetService('ReplicatedStorage')) 
local teleportService = cloneref(game:GetService('TeleportService'))
local httpService = cloneref(game:GetService('HttpService')) 
local soundService = cloneref(game:GetService('SoundService')) 
local inputService = cloneref(game:GetService('UserInputService')) 
local textService = cloneref(game:GetService('TextService')) 

--->> Gui Init <<---

local guilib = loadstring(game:HttpGet('https://raw.githubusercontent.com/Maxlasertech/Alchemy/refs/heads/main/ui/compkillerui/dummy.lua'))() 
getgenv().Compkiller = guilib

local ConfigManager = guilib:ConfigManager({
	Directory = 'mynewscript',
	Config = 'v2'
});

local window = guilib.new({
    Name = 'Compkiller',
    Keybind = 'RightControl',
	TextSize = 15,
})

local Watermark = window:Watermark()
Watermark:AddText({Icon = 'user', Text = lplr.Name})
Watermark:AddText({Icon = 'clock', Text = guilib:GetDate()})

local Time = Watermark:AddText({Icon = 'timer', Text = 'N/A'})

task.spawn(function()
	repeat
        Time:SetText(guilib:GetTimeNow())
        task.wait(0.7)
    until false
end)

window:Update({ExpireDate = (isPremium and 'PREMIUM') or 'FREEMIUM'})

getgenv().uiTabs = setmetatable({}, {
    __newindex = function(self, index, value)
        rawset(self, index, window:DrawTab({
            Name = index,
            Icon = value[1],
            Type = value[2],
            EnableScrolling = true
        }))
        return rawget(self, index)
    end
})
local uiTabs = getgenv().uiTabs

uiTabs.Combat = {'shield', 'Single'}
uiTabs.Movement = {'loader-pinwheel', 'Double'}
uiTabs.Visual = {'eye', 'Double'}
uiTabs.Utility = {'calendar-sync', 'Single'}

xpcall(function()
	local autotp = uiTabs.Utility:DrawSection({
		Title = 'Auto Teleport'
	})

	autotp:AddToggle({
		Title = 'Auto Teleport Shapes',
		Callback = function(call)
			
		end
	})
	
	autotp:AddDropdown({
		Title = 'Selected Shapes',
		Values = {},
		Callback = function()
			
		end
	})

end, print)