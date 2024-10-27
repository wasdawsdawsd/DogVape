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
                                                                                                                                                                                                        
                                                                                                                                                                                                        
				catvape/CustomModules/8444591321.lua
				by maxlasertech and qwerty real realreal!!!
]]
local function vapeGithubRequest(scripturl)
	if not isfile("catvape/"..scripturl) then
		local suc, res = pcall(function() return game:HttpGet("https://raw.githubusercontent.com/qwertyui-is-back/CatV5/refs/heads/main/"..scripturl, true) end)
		if not suc or res == "404: Not Found" then return nil end
		if scripturl:find(".lua") then res = "--This watermark is used to delete the file if its cached, remove it to make the file persist after commits.\n"..res end
		writefile("catvape/"..scripturl, res)
	end
	return readfile("catvape/"..scripturl)
end

shared.CustomSaveVape = 6872274481
if isfile("catvape/CustomModules/6872274481.lua") then
	loadstring(readfile("catvape/CustomModules/6872274481.lua"))()
else
	local publicrepo = vapeGithubRequest("CustomModules/6872274481.lua")
	if publicrepo then
		loadstring(publicrepo)()
	end
end