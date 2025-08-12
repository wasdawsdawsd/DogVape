local license = ({...})[1] or {}
local developer = getgenv().DogVapedev or license.Developer or false

local cloneref = cloneref or function(ref) return ref end
local gethui = gethui or function() return game:GetService('Players').LocalPlayer.PlayerGui end

local httpService = cloneref(game:GetService('HttpService'))

local success, commitdata = pcall(function()
    local commitinfo = httpService:JSONDecode(game:HttpGet('https://api.github.com/repos/new-qwertyui/CatV5/commits'))[1]
    if commitinfo and type(commitinfo) == 'table' then
        local fullinfo = httpService:JSONDecode(game:HttpGet('https://api.github.com/repos/new-qwertyui/CatV5/commits/'.. commitinfo.sha))
        fullinfo.hash = commitinfo.sha:sub(1, 7)
        return fullinfo
    end
end)

if not success or commitdata == nil then
	commitdata = {sha = 'main', files = {}}
end

local downloader = Instance.new('TextLabel', Instance.new('ScreenGui', gethui()))
downloader.Size = UDim2.new(1, 0, -0.08, 0)
downloader.BackgroundTransparency = 1
downloader.TextStrokeTransparency = 0
downloader.TextSize = 20
downloader.Text = 'Downloading DogVape'
downloader.TextColor3 = Color3.new(1, 1, 1)
downloader.Font = Enum.Font.Arial

local function downloadFile2(path: string) : string
	if not isfile(path) or not developer then
		local suc, res = pcall(function()
			return game:HttpGet('https://raw.githubusercontent.com/qwertyui-is-back/CatV5/'.. commitdata.sha.. '/'.. path:gsub('DogVape/', ''))
		end)
		if not suc or res == '404: Not Found' then
			error(res)
		end
		writefile(path, res)
	end
	return readfile(path)
end

local function downloadFile(path: string) : string
	if not developer or not isfile(`DogVape/{path}`) then
        local suc, res = pcall(function()
            return game:HttpGet('https://raw.githubusercontent.com/new-qwertyui/CatV5/'..commitdata.sha..'/'..path:gsub('DogVape/', ''):gsub(' ', '%%20'), true)
        end)
        if (not suc or res == '404: Not Found') then
            return 
        end
        writefile(path, res)
    end
	return readfile(path)
end

local function gitisfolder(path: string) : boolean
    local suc, body = pcall(function()
        return request({
            Url = 'https://raw.githubusercontent.com/qwertyui-is-back/CatV5/'.. commitdata.sha.. '/'.. path:gsub('DogVape/', ''),
            Method = 'GET'
        })
    end)
    return not suc or body.StatusCode == 404
end

local function yield(path: string) : ()
    if path == nil then
        downloader.Text = 'You have exceeded the limit, Please try again in 30 mins!'
        repeat task.wait() until false
    end
    downloader.Text = `{isfile('DogVape/path') and 'Updating' or 'Downloading'} DogVape/{path}`
    if gitisfolder(path) then
        makefolder(`DogVape/{path}`)
        local contents = request({
            Url = `https://api.github.com/repos/new-qwertyui/CatV5/contents/{path}`,
            Method = 'GET'
        }) :: {Body: string, StatusCode: number}
        for _, v: table in httpService:JSONDecode(contents.Body) do
            yield(v.path)
        end
    else
        downloadFile(`DogVape/{path}`)
    end
end

if not developer and not isfile('eiqrhjqpr') then
    pcall(delfolder, 'DogVape')
end

writefile('eiqrhjqpr', 'true')

if not developer then
    local newuser = not isfolder('DogVape') or #listfiles('DogVape') <= 6 or not isfolder('DogVape/profiles') or not isfile('DogVape/profiles/commit.txt')
    if newuser or readfile('DogVape/profiles/commit.txt') ~= commitdata.sha then
        makefolder('DogVape')   

        local blacklist = {'assets', '.vscode', 'README.md'}
        local contents = request({
            Url = `https://api.github.com/repos/new-qwertyui/CatV5/contents`,
            Method = 'GET'
        }) :: {Body: string, StatusCode: number}

        if not newuser then
            table.insert(blacklist, 'profiles')
        end

        for _, v: table in httpService:JSONDecode(contents.Body) do
            if not table.find(blacklist, v.path) then
                yield(v.path)
            end
        end
        writefile(`DogVape/profiles/commit.txt`, commitdata.sha)
    end

    if commitdata.sha == 'main' then
		writefile('DogVape/profiles/commit.txt', 'main')
    end
end

writefile('DogVapereset', 'True')

downloader:Destroy()

shared.VapeDeveloper = true
getgenv().used_init = true
getgenv().DogVapedev = developer

if not isfolder('DogVape/communication') then
	makefolder('DogVape/communication')
end

return loadstring(downloadFile2('DogVape/main.lua'), 'main')(license)
