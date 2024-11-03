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
                                                                                                                                                                                                        
                                                                                                                                                                                                        
				catvape/Libraries/Spotify/GuiLibrary.lua
				by maxlasertech and qwerty real realreal!!!
]]
local tweenservice = game:GetService("TweenService")

local main = Instance.new("Frame")
main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
main.BackgroundTransparency = 0.5
main.Size = UDim2.new(0, 267, 0, 89)

local uic1 = Instance.new("UICorner", main)
uic1.CornerRadius = UDim.new(0, 4)

local progressBackground = Instance.new("Frame", main)
progressBackground.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
progressBackground.BackgroundTransparency = 0.8
progressBackground.Size = UDim2.new(0, 92, 0, 3)
progressBackground.Position = UDim2.new(0.479,0,0.798,0)

local uic2 = Instance.new("UICorner", progressBackground)
uic2.CornerRadius = UDim.new(0, 8)

local updatedbar = Instance.new("Frame", main)
updatedbar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
updatedbar.BackgroundTransparency = 0.3
updatedbar.BackgroundColor3 = Color3.fromRGB(255,255,255)
updatedbar.Size = UDim2.new(0, 0.1, 0, 3)
updatedbar.Position = UDim2.new(0.479,0,0.798,0)

local uic3 = Instance.new("UICorner", updatedbar)
uic3.CornerRadius = UDim.new(0, 8)

local songtitle = Instance.new("TextLabel", main)
songtitle.BackgroundTransparency = 1
songtitle.Font = Enum.Font.SourceSansBold
songtitle.TextSize = 20
songtitle.TextColor3 = Color3.fromRGB(255, 255, 255)
songtitle.TextXAlignment = Enum.TextXAlignment.Left
songtitle.Text = "None"
songtitle.Size = UDim2.new(0, 140, 0, 16)
songtitle.Position = UDim2.new(0.342, 0, 0.247, 0)

local songartist = Instance.new("TextLabel", main)
songartist.BackgroundTransparency = 1
songartist.Font = Enum.Font.SourceSans
songartist.TextSize = 20
songartist.TextColor3 = Color3.fromRGB(225, 225, 225)
songartist.TextXAlignment = Enum.TextXAlignment.Left
songartist.Text = "by None"
songartist.Size = UDim2.new(0, 140, 0, 16)
songartist.Position = UDim2.new(0.342, 0, 0.427, 0)

local songcurrent = Instance.new("TextLabel", main)
songcurrent.BackgroundTransparency = 1
songcurrent.Font = Enum.Font.SourceSans
songcurrent.TextSize = 14
songcurrent.TextColor3 = Color3.fromRGB(193, 193, 193)
songcurrent.Text = "00:00"
songcurrent.Size = UDim2.new(0, 43, 0, 50)
songcurrent.Position = UDim2.new(0.314, 0, 0.5, 0)

local songmax = Instance.new("TextLabel", main)
songmax.BackgroundTransparency = 1
songmax.Font = Enum.Font.SourceSans
songmax.TextSize = 14
songmax.TextColor3 = Color3.fromRGB(193, 193, 193)
songmax.Text = "00:00"
songmax.Size = UDim2.new(0, 43, 0, 50)
songmax.Position = UDim2.new(0.824, 0, 0.5, 0)

local songcover = Instance.new("ImageLabel", main)
songcover.Position = UDim2.new(0.026, 0, 0.067, 0)
songcover.Size = UDim2.new(0, 77, 0, 77)

local uic4 = Instance.new("UICorner", songcover)
uic4.CornerRadius = UDim.new(0, 8)

local spotifygui = {}

spotifygui.selfdestruct = function()
	table.clear(spotify.api)
	main:Destroy()
end

spotifygui.round = function(number)
    return tonumber(string.format('%.2f', number))
end

spotifygui.convertms = function(ms)
    local z = spotifygui.round(ms / 1000)
    local m = math.floor(z / 60)
    z = math.floor(z - (m * 60))
    if #tostring(z) < 2 then
        z = string.format('0%d', z)
    end
    return string.format('%s:%s', m, z)
end

local currentsong = ''
spotifygui.update = function(tab)
    songtitle.Text = tab.song.name:split('(')[1]
    songcurrent.Text = spotifygui.convertms(tab.playback.current)
    songmax.Text = spotifygui.convertms(tab.playback.total)
    songartist.Text = "by "..tab.song.artist
    tweenservice:Create(updatedbar, TweenInfo.new(0.2), {Size = UDim2.new(0, progressBackground.Size.X.Offset / (tab.playback.total / tab.playback.current), 0, progressBackground.Size.Y.Offset)}):Play()
    if songtitle.Text ~= currentsong then
		local pathie = "catvape/TEMP_FILES"
		local pathToWrite = pathie.."/"..songtitle.Text, songartist.Text
        if not isfolder(pathie) then makefolder(pathie) end
        writefile(pathToWrite, game.HttpGet(game, tab.song.cover))

        songcover.Image = getcustomasset(pathToWrite)
        currentsong = songtitle.Text
    end
end

spotifygui.display = main
print("Spotify GuiLib end")
return spotifygui
