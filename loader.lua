getgenv().void = function() end
local loadfile: () -> () = loadfile or function(string: string): (string) -> ()
    return loadstring(readfile(string))()
end;
loadfile('catvape/NewMainScript.lua')()