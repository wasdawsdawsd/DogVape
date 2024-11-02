--> Varibles <--
if not game:IsLoaded() then
    game.Loaded:Wait();
end;
local cloneref: () -> () = (identifyexecutor():find('Synapse') or not cloneref) and function(...): (any)
    return (...)
end or cloneref;
local installing: boolean = true;
local tweenservice = cloneref(game:GetService('TweenService'));
local httpservice = cloneref(game:GetService('HttpService'));
local lplr = cloneref(game:GetService('Players')).LocalPlayer;

--> Main Gui <--

local main: Frame = Instance.new('Frame', Instance.new('ScreenGui', lplr.PlayerGui));
main.BackgroundColor3 = Color3.fromRGB(26, 26, 26);
main.Size = UDim2.new(0, 211, 0, 254);
main.Position = UDim2.new(0.475, 0, 0.328, 0);
main.Active = true;
main.Draggable = true;

local installbutton: TextButton = Instance.new('TextButton', main);
installbutton.BackgroundColor3 = Color3.fromRGB(33, 33, 33);
installbutton.Size = UDim2.new(0, 134, 0, 29);
installbutton.Position = UDim2.new(0.175, 0, 0.614, 0);
installbutton.TextColor3 = Color3.fromRGB(255, 255, 255);
installbutton.TextSize = 17;
installbutton.Text = 'Install';
installbutton.Font = Enum.Font.GothamMedium;

local installstroke: UIStroke = Instance.new('UIStroke', installbutton);
installstroke.Color = Color3.fromRGB(52, 52, 52);
installstroke.Thickness = 2;
installstroke.ApplyStrokeMode = 'Border';

local exitbutton: TextButton = Instance.new('TextButton', main);
exitbutton.BackgroundColor3 = Color3.fromRGB(33, 33, 33);
exitbutton.Size = UDim2.new(0, 134, 0, 29);
exitbutton.Position = UDim2.new(0.175, 0, 0.78, 0);
exitbutton.TextColor3 = Color3.fromRGB(255, 255, 255);
exitbutton.TextSize = 17;
exitbutton.Text = 'Exit';
exitbutton.Font = Enum.Font.GothamMedium;

local exitstroke: UIStroke = Instance.new('UIStroke', exitbutton);
exitstroke.Color = Color3.fromRGB(52, 52, 52);
exitstroke.Thickness = 2;
exitstroke.ApplyStrokeMode = 'Border';

local imagelabel: ImageLabel = Instance.new('ImageLabel', main);
imagelabel.BackgroundTransparency = 1;
imagelabel.Size = UDim2.new(0, 133, 0, 133);
imagelabel.Position = UDim2.new(0.182, 0, 0.055, 0);
imagelabel.Image = 'rbxassetid://89643253918036';

local mainstroke: UIStroke = Instance.new('UIStroke', main);
mainstroke.Color = Color3.fromRGB(66, 66, 66);
mainstroke.Thickness = 2.5;

Instance.new('UICorner', main).CornerRadius = UDim.new(0, 8);
Instance.new('UICorner', exitbutton).CornerRadius = UDim.new(0, 5);
Instance.new('UICorner', installbutton).CornerRadius = UDim.new(0, 5);

--> Installing UI <--

local installui: Frame = Instance.new('Frame', Instance.new('ScreenGui', lplr.PlayerGui));
installui.BackgroundColor3 = Color3.fromRGB(26, 26, 26);
installui.Size = UDim2.new(0, 353, 0, 170);
installui.Position = UDim2.new(0.393, 0, 0.402, 0);
installui.Visible = false;
installui.Active = true;
installui.Draggable = true;

local catimage: ImageLabel = Instance.new('ImageLabel', installui);
catimage.BackgroundTransparency = 1;
catimage.Size = UDim2.new(0, 85, 0, 85);
catimage.Position = UDim2.new(0.377, 0, 0.059, 0);
catimage.Image = 'rbxassetid://89643253918036';

local installtext: TextLabel = Instance.new('TextLabel', installui);
installtext.BackgroundTransparency = 1;
installtext.Size = UDim2.new(0, 353, 0, 38);
installtext.Position = UDim2.new(0, 0, 0.753, 0);
installtext.TextColor3 = Color3.fromRGB(255, 255, 255);
installtext.TextSize = 14;
installtext.Text = 'Installing nothing';
installtext.Font = Enum.Font.Arimo;

local progressbar: Frame = Instance.new('Frame', installui);
progressbar.BackgroundTransparency = 0.7;
progressbar.BackgroundColor3 = Color3.fromRGB(50, 50, 50);
progressbar.Size = UDim2.new(0, 299, 0, 17);
progressbar.ClipsDescendants = true;
progressbar.Position = UDim2.new(0.076, 0, 0.659, 0);

local movingbar: Frame = Instance.new('Frame', progressbar);
movingbar.Size = UDim2.new(0, 106, 0, 17);
movingbar.Position = UDim2.new(-0.5, 0, -0.106, 0);
movingbar.BackgroundColor3 = Color3.fromRGB(60, 0, 129);

local progresstext: TextLabel = Instance.new('TextLabel', progressbar);
progresstext.BackgroundTransparency = 1;
progresstext.Size = UDim2.new(0, 24, 0, 16);
progresstext.Position = UDim2.new(0.458, 0, 0.059, 0);
progresstext.TextColor3 = Color3.fromRGB(255, 255, 255);
progresstext.TextSize = 14;
progresstext.Text = '0%'
progresstext.Font = Enum.Font.Arimo;

local uistroke: UIStroke = Instance.new('UIStroke', installui);
uistroke.Color = Color3.fromRGB(66, 66, 66);
uistroke.Thickness = 2.5;

Instance.new('UICorner', installui).CornerRadius = UDim.new(0, 8);
Instance.new('UICorner', progressbar).CornerRadius = UDim.new(0, 6);
Instance.new('UICorner', movingbar).CornerRadius = UDim.new(0, 6);

--> main installation <--

local selfdestruct: () -> () = function()
    installui.Parent:Remove();
    main.Parent:Remove();
end;

local files: table = {'GuiLibrary.lua', 'NewMainScript.lua', 'MainScript.lua', 'loader.lua', 'main.lua', 'Universal.lua', 'Libraries/Spotify/API.lua', 'Libraries/Spotify/GuiLibrary.lua', 'Libraries/Spotify/Launcher.lua', 'Libraries/Login.lua', 'Libraries/sha.lua', 'Libraries/Login.lua', 'Libraries/Rain.lua', 'Libraries/Blur.lua', 'Libraries/entityHandler.lua'};
pcall(function()
    delfolder("catvape/CustomModules")
    delfolder("catvape/assets")
    delfolder("catvape/Libraries")
end)
local progress: number = 0;
local initiate: () -> () = function(): () -> ()
    main.Visible = false;
    installui.Visible = true;
    local stage: number = 21;
    task.spawn(function()
        repeat
            if not installing then
                break;
            end;
            local tween: () -> () = tweenservice:Create(movingbar, TweenInfo.new(0.8), {Position = UDim2.new(1, 20, -0.047, 0)});
            tween:Play();
            tween.Completed:Wait();
            movingbar.Position = UDim2.new(-0.5, 0, -0.106, 0);
            task.wait(0.3);
        until false;
    end);
    task.spawn(function()
        repeat
            if progresstext.Text == '100%' then
                break;
            end;
            progress += 1;
            progresstext.Text = `{progress}%`;
            task.wait(10 / stage);
        until false;
    end);
    makefolder('catvape')
    for i: number, v: string in {'assets', 'CustomModules', 'Libraries', 'Profiles', 'Libraries/Spotify'} do
        installtext.Text = `Installing catvape/{v}`
        makefolder(`catvape/{v}`);
        installtext.Text = `Installed catvape/{v}`;
    end;
    stage = 31;
    for i: number, v: string in files do
        local file: string = game:HttpGet('https://raw.githubusercontent.com/qwertyui-is-back/CatV5/refs/heads/main/'.. v);
        installtext.Text = `Installing catvape/{v}`;
        if file ~= '404: Not Found' then
            writefile(`catvape/{v}`, file);
            installtext.Text = `Installed catvape/{v}`;
        else
            installtext.Text = `Failed to install catvape/{v}`;
            warn(`❌ [ Installer Error ]: Failed to install, file named catvape/{v} doesn't exist on the github.`);
        end;
    end;
    stage = 10;
    for i: number, v: table in httpservice:JSONDecode(game:HttpGet('https://api.github.com/repos/qwertyui-is-back/CatV5/contents/assets')) do
        if v.name then
            installtext.Text = `Installing catvape/assets/{v.name}`;
            if not isfile(`catvape/assets/{v.name}`) then
                writefile(`catvape/assets/{v.name}`, game:HttpGet('https://raw.githubusercontent.com/qwertyui-is-back/CatV5/refs/heads/main/assets/'..v.name));
            else
                task.wait(0.05);
            end;
            stage += 1;
            installtext.Text = `Installed catvape/assets/{v.name}`;
        end;
    end;
    if progress <= 75 then
         progresstext.Text = '100%';
    end;
    repeat task.wait() until progresstext.Text == '100%';
    installing = false;
    installtext.Text = 'Installation Finished, Closing in 5 seconds';
    task.wait(5);
    selfdestruct();
end;

installbutton.MouseButton1Click:Connect(initiate);
exitbutton.MouseButton1Click:Connect(selfdestruct);
