local cloneref: () -> () = (identifyexecutor():find('Synapse') or not cloneref) and function(instance: any) return instance end or cloneref;
local httpservice = cloneref(game.GetService(game, 'HttpService'))

local function run(func)
    func()
end

local latest = false

local API = loadfile("catvape/Libraries/API.lua")

run(function()
    API.New("version", "GET", true)
    if not isfile("catvape/version.txt") then
        writefile("catvape/version.txt", API.Get("version"))
        latest = true
    else
        local version = readfile("catvape/version.txt")
        if API.Get("version") >= version then
            latest = false
            warn("Old version detected!")
        end
    end
end)

return latest