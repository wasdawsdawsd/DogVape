getgenv().void = function() end
getgenv().request = request or http.request
getgenv().inf = math.huge
local loadfile: () -> () = loadfile or function(string: string): (string) -> ()
    return loadstring(readfile(string))()
end;
print('loader.lua')
--getgenv().failedautoupdate = false
local files: table = {'GuiLibrary.lua', 'NewMainScript.lua', 'MainScript.lua', 'loader.lua', 'main.lua', 'Universal.lua', 'Libraries/Spotify/API.lua', 'Libraries/Spotify/GuiLibrary.lua', 'Libraries/Spotify/Launcher.lua', 'Libraries/Login.lua', 'Libraries/sha.lua', 'Libraries/Login.lua', 'Libraries/Rain.lua', 'Libraries/Blur.lua', 'Libraries/entityHandler.lua', 'Libraries/Whitelist.lua'};
local commithash: table = game:GetService('HttpService'):JSONDecode(game:HttpGet('https://api.github.com/repos/qwertyui-is-back/CatV5/commits'));
if not shared.catvapedeveloper then --> please do not use this or ur catvape might broke, i warned you.
	if not isfile('catvape/commithash.txt') or readfile('catvape/commithash.txt') ~= commithash[1].sha or isfile('catvape/installedfile') then
		if isfile('catvape/installedfile') then
			local newfiles = game:GetService('HttpService'):JSONDecode(readfile('catvape/installedfile'));
			for i: number, v: string in newfiles do
				if identifyexecutor():find('Synapse') then task.wait(1) end;
				local file: string = game:HttpGet('https://raw.githubusercontent.com/qwertyui-is-back/CatV5/refs/heads/main/'.. v);
				if file ~= '404: Not Found' then
					writefile(`catvape/{v}`, file);
					table.remove(newfiles, i)
					writefile('catvape/installedfile', game:GetService('HttpService'):JSONEncode(newfiles))
				else
					warn(`❌ [ AutoUpdate Error ]: Failed to install, file named catvape/{v} doesn't exist on the github.`);
				end
			end 
		else
			for i: number, v: string in files do
				if identifyexecutor():find('Synapse') then task.wait(1) end;
				local file: string = game:HttpGet('https://raw.githubusercontent.com/qwertyui-is-back/CatV5/refs/heads/main/'.. v);
				if file ~= '404: Not Found' then
					writefile(`catvape/{v}`, file);
					table.remove(files, i);
					writefile('catvape/installedfile', game:GetService('HttpService'):JSONEncode(files))
				else
					warn(`❌ [ AutoUpdate Error ]: Failed to install, file named catvape/{v} doesn't exist on the github.`);
				end
			end 
		end
		delfile('catvape/installedfile')
		writefile('catvape/commithash.txt', commithash[1].sha);
	end
end
loadfile('catvape/NewMainScript.lua')()
