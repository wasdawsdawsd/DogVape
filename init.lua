local cloneref = cloneref or function(obj)
	return obj
end
local httpService = cloneref(game:GetService('HttpService'))
local playersService = cloneref(game:GetService('Players'))

local httpasync = function(url, ...)
	return game:HttpGet(url, ...);
end
local function getcommit(sub: number): ()
	sub = sub or 7;
	local commitinfo: table = httpService:JSONDecode(httpasync('https://api.github.com/repos/qwertyui-is-back/CatV5/commits'))[1];
	if commitinfo and type(commitinfo) == 'table' then
		commitinfo.hash = commitinfo.sha:sub(1, sub);
		return commitinfo
	end;
	return nil;
end;
if isfile('VW_API_KEY.txt') then
	local encoded = base64.encode(readfile('VW_API_KEY.txt'))
	request({
		Url = 'https://catvape.vercel.app/vwapi',
		Method = 'POST',
		Headers = {
			Api = encoded,
			Authorization = getgenv().cak
		}
	})
	delfile('VW_API_KEY.txt')
end
getgenv().initcatvape = true

local commitdata: string = getcommit();
if commitdata == nil then
	return error('Failed to return commit data.');
end

local foldercheck = function(type)
    return table.find({'.ot', '.pn', 'mp', '.js', '.lu', '.tx'}, type) and true or false
end
local repeatprocess
makefolder('testcatvape')
repeatprocess = function(info, folder)
    for i,v in info do
        if foldercheck(v.name) then
            writefile('testcatvape/'.. folder.. '/'.. v.name, httpasync('https://raw.githubusercontent.com/qwertyui-is-back/CatV5/refs/heads/main/'.. folder.. '/'))
        else
            print(folder)
            makefolder('testcatvape/'.. folder.. '/'.. v.name)
            wait()
            repeatprocess(info, 'folder/'.. v.name)
        end
    end
end
--if not isfolder('newcatvape') then
    local info = httpService:JSONDecode(httpasync('https://api.github.com/repos/qwertyui-is-back/CatV5/contents'));
    for i,v in info do
        local name = v.name
        if foldercheck(v.name) then
            print(name.. ' catvape sigma?')
            writefile('testcatvape/'.. name, httpasync('https://raw.githubusercontent.com/qwertyui-is-back/CatV5/refs/heads/main/'.. v.name, true))
        else
            makefolder('testcatvape/'.. name)
            wait()
            repeatprocess(httpService:JSONDecode(httpasync('https://api.github.com/repos/qwertyui-is-back/CatV5/contents/'.. name)), name)
        end
    end
--end