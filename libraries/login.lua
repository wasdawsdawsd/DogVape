if not shared.vape then
    repeat task.wait() until shared.vape;
end;
local vape = shared.vape;
local httpService = game:GetService('HttpService');
local catauth: string? = getgenv().CAK;
local readfile = function(a)
	if a == 'newcatvape/updateTime.json' and (not isfile(a) or readfile(a) == '') then
		writefile('newcatvape/updateTime.json', httpService:JSONEncode({
			Minute = 0,
			CAK = nil,
			User = ''
		}))
	end
	return getgenv().readfile(a)
end
if catauth or isfile('cak') then
	if not catauth then 
		getgenv().CAK = readfile('cak');
	end;
	catauth = getgenv().CAK;
	if catauth:find('\n') then
		catauth = catauth:split('\n')[1]
		print(catauth)
	end
	writefile('cak', catauth);
else
	vape:CreateNotification('Cat', 'Failed to login: CAK is not valid, please generate a new one.', 10, 'alert');
	task.delay(11, function()
		vape:Uninject()
	end);
	error('Cat | Failed to login: CAK is not valid, please generate a new one');
end;

local updateData = httpService:JSONDecode(readfile('newcatvape/updateTime.json'))
if updateData and (updateData.Minute <= 0 or updateData.CAK ~= catauth or updateData.User ~= game.Players.LocalPlayer.Name) then
	request({
		Url = 'https://catvape.vercel.app/auth/whitelist/updateWhitelist?key='..catauth..'&name='..game.Players.LocalPlayer.Name,
		Method = 'GET'
	});
	updateData.Minute = 30
	updateData.CAK = catauth
	updateData.User = game.Players.LocalPlayer.Name
	writefile('newcatvape/updateTime.json', httpService:JSONEncode(updateData))
	vape:CreateNotification('Cat', `Updated whitelist data.`, 15, 'alert');
	task.wait(2)
end
task.spawn(function()
	local updateTick = tick()
	repeat
		if (tick() - updateTick) >= 59 then
			updateTick = tick()
			updateData.Minute -= 1
			writefile('newcatvape/updateTime.json', httpService:JSONEncode(updateData))
		end
		task.wait(15)
	until not shared.vape
end)

local success, _ = pcall(function()
	local req: table = request({
		Url = 'https://catvape.vercel.app/auth/authorization/key/discord?key='..catauth,
		Method = 'GET'
	})
	print(req.Body)
	local API: table = httpService:JSONDecode(req.Body)
	print(API.userid)
	assert(API.userid);
	vape:CreateNotification('Cat', `Logged in as {API.name} ({API.userid}).`, 7);
	request({
		Url = 'https://catvape.vercel.app/auth/authorization/key/successLogin?key='..catauth,
		Method = 'GET'
	});
end);

if not success then
	task.delay(7, function()
		vape:Uninject();
	end);
    vape:CreateNotification('Cat', `API is down/Invalid api result, Please report this problem to qwertyui or fuzzy.`, 7, 'alert');
	return false, 'Invalid API' 
end;
local suc, res = pcall(function()
	loadfile('newcatvape/libraries/whitelist.lua')();
end)
if not suc then
	task.delay(7, function()
		vape:Uninject();
	end);
    vape:CreateNotification('Cat', `API is down/Invalid api result, Please report this problem to qwertyui or fuzzy.`, 7, 'alert');
	return false, 'Invalid API' 
end
return true, ''