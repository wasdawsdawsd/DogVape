local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()
local cloneref = cloneref or function(instance) return instance end
local baseDirectory = (shared.VapePrivate and "vapeprivate" or "catvape")
local httpservice = cloneref(game.GetService(game, 'HttpService'))
local API = loadstring(game:HttpGet("https://raw.githubusercontent.com/qwertyui-is-back/CatV5/main/Libraries/API.lua", true))()

local hm = "Waiting"
local prog = 0
local function WriteFiles(link) -- main, libraries, games, assets
	local suc, res = pcall(function()
	    local files = "/"..link
	    local gitfiles = "/"
	    if link ~= "main" then gitfiles = "/"..link.."/" end
	    if link == "games" then gitfiles = "/CustomModules/" end
	    if link == "libraries" then gitfiles = "/Libraries/" end
	    API.New("files"..files,"GET",true)
	    for i,v in API.Get("files") do
	        pcall(function() 
	            writefile(baseDirectory..gitfiles..v, game:HttpGet("https://raw.githubusercontent.com/qwertyui-is-back/CatV5/main"..gitfiles..v, true))
	            task.wait(0.01)
	            prog = prog + 1
	        end)
	    end
	end)
	if not suc then
		hm = "Error Code 0"..math.random(0,999)..": "..res
		error(res)
	end
end
local Window = lib:MakeWindow({
  Title = "Cat Vape Installer",
  SubTitle = ""
})

local Tab1 = Window:MakeTab({"Installer", ""})

local Paragraph = Tab1:AddParagraph({"Progress Monitor", "This is a Paragraph"})

Paragraph:Set("Progress: 0%, Waiting")

local butt
butt = Tab1:AddButton({"Install", function()
	makefolder("catvape")
	makefolder("catvape/CustomModules")
	makefolder("catvape/assets")
	makefolder("catvape/Libraries")
	makefolder("catvape/Profiles")
    butt:Destroy()
    task.spawn(function()
        repeat
            task.wait(0.005)
            Paragraph:Set("Progress: "..prog.."%, "..hm)
        until false
    end)

    WriteFiles("main")
    hm = "Installing main files"
    for i = 0, 40 do prog = prog + 1 task.wait(0.005) end
    hm = "Installing libraries"
    WriteFiles("libraries")
    for i = 0, 20 do prog = prog + 1 task.wait(0.005) end
    hm = "Installing games"
    WriteFiles("games")
    for i = 0, 10 do prog = prog + 1 task.wait(0.005) end
    hm = "Installing assets"
    local assets = {}
    for i,v in game:GetService('HttpService'):JSONDecode(game:HttpGet('https://api.github.com/repos/qwertyui-is-back/CatV5/contents/assets')) do
        if v.name then
            table.insert(assets, v.name)
        end
    end
    for i,v in assets do
        if not isfile(`catvape/assets/{v}`) then
            writefile('catvape/assets/'.. v, game:HttpGet('https://raw.githubusercontent.com/qwertyui-is-back/CatV5/main/assets/'..v))
        end
    end
    WriteFiles("assets")
    if prog <= 100 then
        for i = 0, 99 - prog do
            prog += 1
            task.wait(0.009)
        end
    end
    local stat = "Finished!"
    task.wait(0.75)
    -- error handler
    if not isfile("catvape/loader.lua") then
    	stat = "Error Code 0001: Files not downloaded"
    else
    	local str1 = readfile("catvape/loader.lua")
    	local str2 = game:HttpGet("https://raw.githubusercontent.com/qwertyui-is-back/CatV5/refs/heads/main/loader.lua")
    	if str1 ~= str2 then
    		stat = "Error Code 0002: Files Outdated"
    	end
    end
    -- error handler
    hm = stat
    if stat == "Finished!" then
	    local butt2 = Tab1:AddButton({"Launch Cat",function()
			game.CoreGui["redz Library V5"]:Destroy()
			loadfile("catvape/loader.lua")()
	    end})
	end
end})
