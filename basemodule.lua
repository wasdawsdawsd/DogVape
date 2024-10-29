export type vape = {
    ObjectsThatCanBeSaved: {
        ColorSliderColor: {Hue: number, Sat: number, Value: number}
    }
}
export type vapemodule = {
    Enabled: boolean,
    ToggleButton: () -> (),
    CreateToggle: () -> (),
    CreateSlider: () -> (),
    CreateTextBox: () -> (),
    CreateDropdown: () -> (),
    Object: Instance
}
export type vapetoggle = {
    Enabled: boolean,
    ToggleButton: () -> (),
    Object: Instance
}
export type vapedropdown = {
    Value: string?,
    List: table,
    Object: Instance
}
export type vapeslider = {
    Object: Instance,
    Value: number
}
export type vapetextbox = {
    Object: Instance,
    Value: number
}
local vape = vape
local GuiLibrary = vape.gui
local cloneref = cloneref or function(...) return (...) end
local players = cloneref(game.GetService(game, 'Players'))
local textservice = cloneref(game.GetService(game, 'TextService'))
local lighting = cloneref(game.GetService(game, 'Lighting'))
local textchat = cloneref(game.GetService(game, 'TextChatService'))
local inputservice = cloneref(game.GetService(game, 'UserInputService'))
local runservice = cloneref(game.GetService(game, 'RunService'))
local tweenservice = cloneref(game.GetService(game, 'TweenService'))
local collection = cloneref(game.GetService(game, 'CollectionService'))
local replicatedstorage = cloneref(game.GetService(game, 'ReplicatedStorage'))
local vapeconnections = {}
local camera = workspace.CurrentCamera or Instance.new('Camera', workspace)
local lplr = players.LocalPlayer
local vapeInjected = true

table.insert(vapeconnections, workspace:GetPropertyChangedSignal('CurrentCamera'):Connect(function()
	camera = workspace.CurrentCamera or Instance.new('Camera', workspace)
end))

run(function() 
    local vapemodule: vapemodule = {};
    local vapeslider: vapeslider = {};
    local vapetextbox: vapetextbox = {};
    local vapetoggle: vapetoggle = {};
    vapemodule = vape.windows.combat.CreateOptionsButton({
        Name = 'vapemodule',
        Function = function(call: boolean)
            if call then
                repeat
                    print('hi')
                    task.wait()
                until not vapemodule.Enabled
            end
        end,
        HoverText = 'a vape module.'
    })
    vapetoggle = vapemodule.CreateToggle({
        Name = 'vapetoggle',
        Function = function() end,
        Default = true
    })
    vapeslider = vapemodule.CreateSlider({
        Name = 'vapeslider',
        Min = 1,
        Max = 100,
        Function = function(val: number) end,
        Default = 50
    })
    vapetextbox = vapemodule.CreateTextBox({
        Name = 'vapetextbox',
        Function = function(enter: boolean)
            if not enter then return end
            print('Inserted')
        end
    })
end)