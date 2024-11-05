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
                                                                                                                                                                                                        
                                                                                                                                                                                                        
				catvape/CustomModules/6872265039.lua
				by maxlasertech and qwerty real realreal!!!
]]
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

table.insert(vapeconnections, workspace:GetPropertyChangedSignal('CurrentCamera'):Connect(function()
	camera = workspace.CurrentCamera or Instance.new('Camera', workspace)
end))

GuiLibrary.RemoveObject('SilentAimOptionsButton')
GuiLibrary.RemoveObject('MouseTPOptionsButton')
GuiLibrary.RemoveObject('ReachOptionsButton')
GuiLibrary.RemoveObject('HitBoxesOptionsButton')
GuiLibrary.RemoveObject('KillauraOptionsButton')
GuiLibrary.RemoveObject('LongJumpOptionsButton')
GuiLibrary.RemoveObject('HighJumpOptionsButton')
GuiLibrary.RemoveObject('SafeWalkOptionsButton')
GuiLibrary.RemoveObject('TriggerBotOptionsButton')
GuiLibrary.RemoveObject('AutoClickerOptionsButton')
GuiLibrary.RemoveObject('ClientKickDisablerOptionsButton')

local sprintcontroller
run(function()
	local knitgotten, knitclient
	repeat
		knitgotten, knitclient = pcall(function()
			return debug.getupvalue(require(lplr.PlayerScripts.TS.knit).setup, 6)
		end)
		if knitgotten then break end
		task.wait()
	until knitgotten
    sprintcontroller = knitclient.Controllers.SprintController
end)


run(function()
    local sprint = {}
    local old
    sprint = vape.windows.combat.CreateOptionsButton({
        Name = 'Sprint',
        Function = function(call)
            if call then
                old = getmetatable(sprintcontroller).stopSprinting
                getmetatable(sprintcontroller).stopSprinting = function() end
                table.insert(sprint.Connections, runservice.Stepped:Connect(function()
                    if not vape.istoggled('FOVChanger') then
                        getmetatable(sprintcontroller).startSprinting(sprintcontroller)
                    end
                end))
            else
                getmetatable(sprintcontroller).stopSprinting = old
            end
        end
    })
end)

run(function()
    local autogamble = {}
    local getattribute = function(id)
        local altar = workspace:FindFirstChild(`CrateAltar_{id}`)
        local model = altar:FindFirstChildWhichIsA('Model')
        if model then
            return tostring(model:GetAttribute('crateId'))
        else
            return nil and warningNotification('CatV5', 'Crate not found.', 5)
        end
    end
    local spawncrate = replicatedstorage.rbxts_include.node_modules['@rbxts'].net.out._NetManaged['RewardCrate/SpawnRewardCrate']
    local opencrate = replicatedstorage.rbxts_include.node_modules['@rbxts'].net.out._NetManaged['RewardCrate/OpenRewardCrate']
    autogamble = vape.windows.blatant.CreateOptionsButton({
        Name = 'AutoGamble',
        Function = function(call)
            if call then
                repeat
                    for i = 0,1 do
                        spawncrate:FireServer({
                            crateType = 'level_up_crate',
                            altarId = i
                        }) 
                        task.wait(2)
                        local attribute = getattribute(i)
                        opencrate:FireServer({
                            crateId = attribute
                        })
                    end
                    task.wait(1)
                until (not autogamble.Enabled)
            end
        end,
        HoverText = 'Automatically opens crate for you \n(inspired by piss-ton)'
    })
end)
