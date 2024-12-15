--> Varibles <--
if not game:IsLoaded() then
    game.Loaded:Wait();
end;
local catvape: table = {
    maintab = {};
    configtab = {};
    configs = {};
    selectedconfig = '';
};
local cloneref: () -> () = (identifyexecutor():find('Synapse') or not cloneref) and function(...): (...any) -> (...any)
    return (...)
end or cloneref;
local installing: boolean = true;
local tweenservice = cloneref(game:GetService('TweenService'));
local httpservice = cloneref(game:GetService('HttpService'));
local lplr = cloneref(game:GetService('Players')).LocalPlayer;

--> Main Gui <--

local main: Frame = Instance.new('Frame', Instance.new('ScreenGui', lplr.PlayerGui));
main.BackgroundColor3 = Color3.fromRGB(26, 26, 26);
main.Size = UDim2.new(0, 225, 0, 286);
main.Position = UDim2.new(0.475, 0, 0.328, 0);
main.Active = true;
main.Draggable = true;

local installbutton: TextButton = Instance.new('TextButton', main);
installbutton.BackgroundColor3 = Color3.fromRGB(33, 33, 33);
installbutton.Size = UDim2.new(0, 134, 0, 29);
installbutton.Position = UDim2.new(0.202, 0, 0.628, 0);
installbutton.TextColor3 = Color3.fromRGB(255, 255, 255);
installbutton.TextSize = 17;
installbutton.Text = 'Install';
installbutton.Font = Enum.Font.GothamMedium;
table.insert(catvape.maintab, installbutton)

local installstroke: UIStroke = Instance.new('UIStroke', installbutton);
installstroke.Color = Color3.fromRGB(52, 52, 52);
installstroke.Thickness = 2;
installstroke.ApplyStrokeMode = 'Border';

local exitbutton: TextButton = Instance.new('TextButton', main);
exitbutton.BackgroundColor3 = Color3.fromRGB(33, 33, 33);
exitbutton.Size = UDim2.new(0, 134, 0, 29);
exitbutton.Position = UDim2.new(0.202, 0, 0.811, 0);
exitbutton.TextColor3 = Color3.fromRGB(255, 255, 255);
exitbutton.TextSize = 17;
exitbutton.Text = 'Exit';
exitbutton.Font = Enum.Font.GothamMedium;
table.insert(catvape.maintab, exitbutton)

local exitstroke: UIStroke = Instance.new('UIStroke', exitbutton);
exitstroke.Color = Color3.fromRGB(52, 52, 52);
exitstroke.Thickness = 2;
exitstroke.ApplyStrokeMode = 'Border';

local imagelabel: ImageLabel = Instance.new('ImageLabel', main);
imagelabel.BackgroundTransparency = 1;
imagelabel.Size = UDim2.new(0, 133, 0, 133);
imagelabel.Position = UDim2.new(0.187, 0, 0.16, 0);
imagelabel.Image = 'rbxassetid://89643253918036';
table.insert(catvape.maintab, imagelabel)

local mainstroke: UIStroke = Instance.new('UIStroke', main);
mainstroke.Color = Color3.fromRGB(66, 66, 66);
mainstroke.Thickness = 2.5;

Instance.new('UICorner', main).CornerRadius = UDim.new(0, 8);
Instance.new('UICorner', exitbutton).CornerRadius = UDim.new(0, 5);
Instance.new('UICorner', installbutton).CornerRadius = UDim.new(0, 5);

catvape.SetVisible = function(tool: any, bool): (any) -> ()
    pcall(function()
        tool.Visible = bool;
    end);
end;

local buttontween: any;

local framestroke: UIStroke = Instance.new('UIStroke');
framestroke.Color = Color3.fromRGB(52, 52, 52);
framestroke.Thickness = 2;
framestroke.Transparency = 0;
framestroke.ApplyStrokeMode = 'Border';

local maintabButton: TextButton = Instance.new('TextButton', main);
maintabButton.BackgroundColor3 = Color3.fromRGB(33, 33, 33);
maintabButton.Size = UDim2.new(0, 88, 0, 35);
maintabButton.Position = UDim2.new(0.08, 0, 0.035, 0);
maintabButton.TextColor3 = Color3.fromRGB(255, 255, 255);
maintabButton.TextSize = 17;
maintabButton.Text = 'Main';
maintabButton.BorderSizePixel = 0;
maintabButton.Font = Enum.Font.GothamMedium;
maintabButton.MouseButton1Click:Connect(function()
    for i: number, v: Instance in catvape.maintab do
        catvape.SetVisible(v, true);
    end;
    for i: number, v: Instance in catvape.configtab do
        catvape.SetVisible(v, false);
    end;
    if buttontween then
        buttontween:Cancel();
    end;
    local cloneframestroke = framestroke:Clone();
    cloneframestroke.Parent = framestroke.Parent;
    framestroke.Parent = maintabButton;
    buttontween = tweenservice:Create(cloneframestroke, TweenInfo.new(0.6, Enum.EasingStyle.Quad), {Transparency = 1});
    buttontween:Play();
    buttontween = tweenservice:Create(framestroke, TweenInfo.new(0.6, Enum.EasingStyle.Quad), {Transparency = 0});
    buttontween:Play();
    buttontween.Completed:Wait();
    cloneframestroke:Remove()
end)

framestroke.Parent = maintabButton

local configtabButton: TextButton = Instance.new('TextButton', main);
configtabButton.BackgroundColor3 = Color3.fromRGB(33, 33, 33);
configtabButton.Size = UDim2.new(0, 88, 0, 35);
configtabButton.Position = UDim2.new(0.524, 0, 0.035, 0);
configtabButton.TextColor3 = Color3.fromRGB(255, 255, 255);
configtabButton.TextSize = 17;
configtabButton.Text = 'Configs';
configtabButton.BorderSizePixel = 0;
configtabButton.Font = Enum.Font.GothamMedium;
configtabButton.MouseButton1Click:Connect(function()
    for i: number, v: Instance in catvape.maintab do
        catvape.SetVisible(v, false);
    end;
    for i: number, v: Instance in catvape.configtab do
        catvape.SetVisible(v, true);
    end;
    if buttontween then
        buttontween:Cancel();
    end;
    local cloneframestroke = framestroke:Clone();
    cloneframestroke.Parent = framestroke.Parent;
    framestroke.Parent = configtabButton;
    buttontween = tweenservice:Create(cloneframestroke, TweenInfo.new(0.6, Enum.EasingStyle.Quad), {Transparency = 1});
    buttontween:Play();
    buttontween = tweenservice:Create(framestroke, TweenInfo.new(0.6, Enum.EasingStyle.Quad), {Transparency = 0});
    buttontween:Play();
    buttontween.Completed:Wait();
    cloneframestroke:Remove()
end)

Instance.new('UICorner', maintabButton).CornerRadius = UDim.new(0, 8);
Instance.new('UICorner', configtabButton).CornerRadius = UDim.new(0, 8);

local configframe: ScrollingFrame = Instance.new('ScrollingFrame', main);
configframe.BackgroundTransparency = 1;
configframe.BorderSizePixel = 0;
configframe.Size = UDim2.new(0, 194, 0, 82);
configframe.Position = UDim2.new(0.08, 0, 0.682, 0);
configframe.CanvasSize = UDim2.new(0, 0, 15, 0);
configframe.ScrollBarThickness = 0;
configframe.Visible = false
table.insert(catvape.configtab, configframe);

local topconfigframe: ScrollingFrame = Instance.new('ScrollingFrame', main);
topconfigframe.BackgroundTransparency = 1;
topconfigframe.BorderSizePixel = 0;
topconfigframe.Size = UDim2.new(0, 194, 0, 82);
topconfigframe.Position = UDim2.new(0.08, 0, 0.29, 0);
topconfigframe.CanvasSize = UDim2.new(0, 0, 15, 0);
topconfigframe.ScrollBarThickness = 0;
topconfigframe.Visible = false
table.insert(catvape.configtab, topconfigframe);

local sectionlabel1 = Instance.new('TextLabel', main);
sectionlabel1.BackgroundTransparency = 1;
sectionlabel1.BorderSizePixel = 0;
sectionlabel1.Size = UDim2.new(0, 200, 0, 18);
sectionlabel1.Position = UDim2.new(0.053, 0, 0.598, 0);
sectionlabel1.Font = Enum.Font.GothamMedium;
sectionlabel1.Text = 'Normal Configs';
sectionlabel1.TextColor3 = Color3.fromRGB(255, 255, 255);
sectionlabel1.TextSize = 18;
sectionlabel1.Visible = false;
table.insert(catvape.configtab, sectionlabel1);

local sectionlabel2 = Instance.new('TextLabel', main);
sectionlabel2.BackgroundTransparency = 1;
sectionlabel2.BorderSizePixel = 0;
sectionlabel2.Size = UDim2.new(0, 200, 0, 18);
sectionlabel2.Position = UDim2.new(0.053, 0, 0.203, 0);
sectionlabel2.Font = Enum.Font.GothamMedium;
sectionlabel2.Text = 'Recommennded Configs';
sectionlabel2.TextColor3 = Color3.fromRGB(255, 255, 255);
sectionlabel2.TextSize = 18;
sectionlabel2.Visible = false;
table.insert(catvape.configtab, sectionlabel2);

local lislayot = Instance.new('UIListLayout', configframe);
lislayot.Padding = UDim.new(0, 7);
lislayot.SortOrder = Enum.SortOrder.LayoutOrder;

local listlayot = Instance.new('UIListLayout', topconfigframe);
listlayot.Padding = UDim.new(0, 7);
listlayot.SortOrder = Enum.SortOrder.LayoutOrder;

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

catvape.addconfig = function(pack: {name: string, path: string, top: boolean, callback: any}): (table) -> ()
    table.insert(catvape.configs, pack.name);
    local frame: Frame = Instance.new('Frame', pack.top and topconfigframe or configframe);
    frame.BackgroundColor3 = Color3.fromRGB(23, 23, 23);
    frame.Size = UDim2.new(0, 194, 0, 69);

    Instance.new('UICorner', frame).CornerRadius = UDim.new(0, 8);

    local downloadframe: Frame = Instance.new('Frame', frame);
    downloadframe.BackgroundColor3 = Color3.fromRGB(28, 28, 28);
    downloadframe.Size = UDim2.new(0, 25, 0, 25);
    downloadframe.Position = UDim2.new(0.778, 0, 0.319, 0);

    local image: Frame = Instance.new('ImageLabel', downloadframe);
    image.BackgroundTransparency = 1
    image.Size = UDim2.new(0, 20, 0, 20);
    image.Position = UDim2.new(0.08, 0, 0.08, 0);
    image.Image = 'rbxassetid://88582321220668';

    local button: TextButton = Instance.new('TextButton', downloadframe);
    button.TextTransparency = 1;
    button.BackgroundTransparency = 1;
    button.Size = UDim2.new(0, 25, 0, 25);

    local label = Instance.new('TextLabel', frame)
    label.BackgroundTransparency = 1;
    label.BorderSizePixel = 0;
    label.Size = UDim2.new(0, 200, 0, 50);
    label.Position = UDim2.new(0.05, 0, 0.17, 0);
    label.Font = Enum.Font.Arimo;
    label.Text = `{pack.name} Config`;
    label.TextColor3 = Color3.fromRGB(255, 255, 255);
    label.TextSize = 14;
    label.TextXAlignment = Enum.TextXAlignment.Left;
    label.TextYAlignment = Enum.TextYAlignment.Top;

    Instance.new('UICorner', downloadframe).CornerRadius = UDim.new(0, 8);

    button.MouseButton1Click:Connect(pack.callback)
end

local files: table = {'GuiLibrary.lua', 'NewMainScript.lua', 'MainScript.lua', 'loader.lua', 'main.lua', 'Universal.lua', 'Libraries/Spotify/API.lua', 'Libraries/Spotify/GuiLibrary.lua', 'Libraries/Spotify/Launcher.lua', 'Libraries/Login.lua', 'Libraries/sha.lua', 'Libraries/Login.lua', 'Libraries/Rain.lua', 'Libraries/Blur.lua', 'Libraries/entityHandler.lua', 'Libraries/Whitelist.lua'};
local fakefinished: boolean = false
local initiate: () -> () = function(profiles: boolean): () -> ()
    main.Visible = false;
    installui.Visible = true;
    if isfolder('catvape') then
        for i: number, v: string in listfiles('catvape/') do
            if v ~= 'catvape/Profiles' then
                task.spawn(pcall, delfolder, v);
                task.spawn(pcall, delfile, v);
            end
        end
    end
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
        local progress: number = 0;
        repeat
            if progresstext.Text == '100%' then
                break;
            end;
            progress += 1;
            progresstext.Text = `{progress}%`;
            task.wait(10 / stage);
        until false;
    end);
    makefolder('catvape');
    for i: number, v: string in {'assets', 'CustomModules', 'Libraries', 'Profiles', 'Libraries/Spotify'} do
        installtext.Text = `Installing catvape/{v}`
        makefolder(`catvape/{v}`);
        installtext.Text = `Installed catvape/{v}`;
    end;
    stage = 400;
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
    stage = 200;
    for i: number, v: table in httpservice:JSONDecode(game:HttpGet('https://api.github.com/repos/qwertyui-is-back/CatV5/contents/assets')) do
        if v.name then
            installtext.Text = `Installing catvape/assets/{v.name}`;
            if not isfile(`catvape/assets/{v.name}`) then
                writefile(`catvape/assets/{v.name}`, game:HttpGet('https://raw.githubusercontent.com/qwertyui-is-back/CatV5/refs/heads/main/assets/'..v.name));
            else
                task.wait(0.05);
            end;
            stage += 0.4;
            installtext.Text = `Installed catvape/assets/{v.name}`;
        end;
    end;
    fakefinished = true
    repeat task.wait() until progresstext.Text == '100%';
    installing = false;
    installtext.Text = 'Installation Finished, Closing in 5 seconds';
    task.wait(5);
    selfdestruct();
end;

installbutton.MouseButton1Click:Connect(initiate);
exitbutton.MouseButton1Click:Connect(selfdestruct);

local configs = httpservice:JSONDecode(game:HttpGet('https://api.github.com/repos/qwertyui-is-back/CatV5/contents/Libraries/Configs'))
local onrunning = false
local fakerfaker = function(nmae)
    if onrunning then
		repeat task.wait() until not onrunning
        task.wait(0.65);
    end
    repeat task.wait() until fakefinished
    installtext.Text = 'Installed catvape/Profiles/'..nmae
    onrunning = false
end
for i: number, v: table in configs do
    catvape.addconfig({
        name = v.name,
        top = table.find({'Maxlaser', 'Qwerty'}, v.name) and true or false,
        callback = function()
            task.spawn(initiate);
            repeat task.wait() until isfolder('catvape')
            makefolder('catvape/Profiles');
            for i2: number, v2: table in httpservice:JSONDecode(game:HttpGet('https://api.github.com/repos/qwertyui-is-back/CatV5/contents/Libraries/Configs/'..v.name)) do
                local file = game:HttpGet('https://raw.githubusercontent.com/qwertyui-is-back/CatV5/refs/heads/main/Libraries/Configs/'.. v.name.. '/'.. v2.name)
                if file ~= '404: Not Found' then
                    writefile('catvape/Profiles/'.. v2.name, file);
                    task.spawn(fakerfaker, v2.name)
                end
            end
        end;
    });
end;
