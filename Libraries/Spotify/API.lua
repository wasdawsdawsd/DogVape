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
                                                                                                                                                                                                        
                                                                                                                                                                                                        
				catvape/Libraries/Spotify/API.lua
				by maxlasertech and qwerty real realreal!!!
]]
print("Spotify API begin")

local b64 = loadstring(game:HttpGet("https://gist.githubusercontent.com/metatablecat/1f6cd6f4495f95700eb1a686de4ebe5e/raw/698a1defabd7bfd7049258f65dc7d87e05247d4f/b64.lua"))()
-- ^^^ Credits to metatablecat for this code! ^^^ --


local spotifyapi = {}
local cloneref = (identifyexecutor():find('Synapse') or not cloneref) and function(...)
    return (...)
end or cloneref
local httpservice = cloneref(game.GetService(game, "HttpService"))

spotifyapi.newrequest = function(url, method)

    local data = http.request({
        Url = 'https://api.spotify.com/v1/' .. url,
        Method = 'GET',
        Headers = {
            Authorization = 'Bearer ' .. spotify_token
        },
    })

    local body = data.Body and cloneref(game:GetService('HttpService')):JSONDecode(data.Body) or ''
    if body and body.error then
        return warn('❌ [ Spotify Api ] --> Failed to send a new request, error: ' .. body.error.message .. '.')
    end
    return (data and body) or ''
end

spotifyapi.updatetoken = function(token)
	token = token or readfile("account_token")
	local req = http.request({
		Url = "https://catvape.vercel.app/auth/spotify/updateToken?token="..token,
		Method = "GET"
	})
	
	local response = httpservice:JSONDecode(req.Body)

	getgenv().spotify_token = response.access_token;
	writefile("spotify_token", response.access_token)
	if spotify_debug then
		warningNotification("Cat", "Updated spotify token!", 3)
	end
end

spotifyapi.getdata = function()
    local data = spotifyapi.newrequest('me/player/currently-playing')
    if not data or not data.item then return end

    local names = {}
    if data.item.artists then
        for i, v in ipairs(data.item.artists) do
            table.insert(names, v.name)
        end
    end

    local artist = table.concat(names, ', ')

    return {
        song = {
            name = data.item.name,
            cover = data.item.album.images[2].url,
            artist = artist
        },
        playback = {
            current = data.progress_ms,
            total = data.item.duration_ms,
            playing = data.is_playing
        }
    }
end

return spotifyapi
