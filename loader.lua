getgenv().void = function() end
local loadfile: () -> () = loadfile or function(string: string): (string) -> ()
    return loadstring(readfile(string))()
end;
print('loader.lua crash')
--getgenv().failedautoupdate = false
local files: table = {'GuiLibrary.lua', 'NewMainScript.lua', 'MainScript.lua', 'loader.lua', 'main.lua', 'Universal.lua', 'Libraries/Spotify/API.lua', 'Libraries/Spotify/GuiLibrary.lua', 'Libraries/Spotify/Launcher.lua', 'Libraries/Login.lua', 'Libraries/sha.lua', 'Libraries/Login.lua', 'Libraries/Rain.lua', 'Libraries/Blur.lua', 'Libraries/entityHandler.lua'};
local commithash: table = game:GetService('HttpService'):JSONDecode(game:HttpGet('https://api.github.com/repos/qwertyui-is-back/CatV5/commits'));
if not shared.catvapedeveloper then --> please do not use this or ur catvape might broke, i warned you.
	if not isfile('catvape/commithash.txt') or readfile('catvape/commithash.txt') ~= commithash[1].sha then
		writefile('result.txt', 'fail')
		for i: number, v: string in files do
			if identifyexecutor():find('Synapse') then task.wait(1) end;
			local file: string = game:HttpGet('https://raw.githubusercontent.com/qwertyui-is-back/CatV5/refs/heads/main/'.. v);
			if file ~= '404: Not Found' then
				writefile(`catvape/{v}`, file);
			else
				warn(`❌ [ AutoUpdate Error ]: Failed to install, file named catvape/{v} doesn't exist on the github.`);
			end
		end 
		writefile('catvape/commithash.txt', commithash[1].sha);
		writefile('result.txt', 'success');
	end
end
loadfile('catvape/NewMainScript.lua')()
