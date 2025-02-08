-- Anti-AFK lebih efektif (DIPERBAIKI)
local vuAF = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    vuAF:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait(1)
    vuAF:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

-- Menu Utama. 
getgenv().Name = "Rafaczx Admin ☠️"

task.wait(2)

local virtual = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    virtual:CaptureController()
    virtual:ClickButton2(Vector2.new())
end)

local LocalPlayer = game.Players.LocalPlayer
local Character = LocalPlayer.Character
local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
local Path1 = Instance.new("Part", game:GetService("Workspace"))
Character.Head.CustomPlayerTag.PlayerName.Text = getgenv().Name
Character.Head.CustomPlayerTag.MinerRank.Text = "V.V.I.P 👑"

local Depth;
local SellTreshold;

if not getgenv().SellTreshold then
    SellTreshold = 100000
else
    SellTreshold = getgenv().SellTreshold;
end
if not getgenv().Depth then
    Depth = 155
else
    Depth = getgenv().Depth;
end

local objectsToRemove = {
    workspace.VIPMine:GetChildren()[13],
    workspace.Activation.Buy,
    workspace.VIPMine.Anvil,
    workspace.PrivateMinePart2,
    workspace.PrivateMinePart
}
for _, object in ipairs(objectsToRemove) do
    if object then
        object:Destroy();
    end
end

do
    repeat
        wait();
    until game:IsLoaded() 
    game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("ScreenGui");
    while game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.LoadingFrame.BackgroundTransparency == 0 do
        for i, connection in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.LoadingFrame.Quality.LowQuality.MouseButton1Down)) do
            connection:Fire();
        end
        wait();
    end
    while true do
        if pcall(function()
            game.Players.LocalPlayer.leaderstats:WaitForChild("Blocks Mined");
        end) then
            if pcall(function()
                game.Players.LocalPlayer.PlayerGui.ScreenGui.StatsFrame.Coins:FindFirstChild("Amount");
            end) then
                if (game.Players.LocalPlayer.PlayerGui.ScreenGui.StatsFrame.Tokens.Amount.Text ~= "Loading...") then
                    break;
                end
            end
        end
        wait(1);
    end
    game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.TeleporterFrame:Destroy();
    game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.StatsFrame.Sell:Destroy();
end

local Remote;
Workspace.Collapsed.Changed:connect(function()
    if (Workspace.Collapsed.Value == true) then
        local ts = game:GetService("TeleportService");
        local p = game:GetService("Players").LocalPlayer;
        ts:Teleport(game.PlaceId, p);
    end
end);

do
    local Data = getsenv(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.ClientScript).displayCurrent;
    local Values = getupvalue(Data, 8);
    Remote = Values.RemoteEvent;
    Data, Values = nil;
end

do
    local HumanoidRootPart = game.Players.LocalPlayer.Character.HumanoidRootPart;
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0;
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 0;
    HumanoidRootPart.Anchored = true;
    Remote:FireServer("MoveTo", {{"LavaSpawn"}});
    local part = Instance.new("Part", game.Workspace);
    part.Anchored = true;
    part.Size = Vector3.new(10, 0.5, 100);
    part.Material = "ForceField";
    local pos = Vector3.new(21, 9.5, 26285);
    part.Position = pos;
    wait(1);
    HumanoidRootPart.Anchored = false;
    while HumanoidRootPart.Position.Z > 26220 do
        HumanoidRootPart.CFrame = CFrame.new(Vector3.new(HumanoidRootPart.Position.X, 13.05, HumanoidRootPart.Position.Z - 0.5));
        wait();
    end
    HumanoidRootPart.CFrame = CFrame.new(18, 10, 26220);
end

do
    local function Split(s, delimiter)
        result = {};
        for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
            table.insert(result, match);
        end
        return result;
    end
    local RunService = game:GetService("RunService").Stepped;
    local HumanoidRootPart = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
    local depth = Split(game.Players.LocalPlayer.PlayerGui.ScreenGui.TopInfoFrame.Depth.Text, " ");
    while tonumber(depth[1]) < Depth do
        local min = HumanoidRootPart.CFrame + Vector3.new(-1, -10, -1);
        local max = HumanoidRootPart.CFrame + Vector3.new(1, 0, 1);
        local region = Region3.new(min.Position, max.Position);
        local parts = workspace:FindPartsInRegion3WithWhiteList(region, {game.Workspace.Blocks}, 5);
        for _, block in pairs(parts) do
            Remote:FireServer("MineBlock", {{block.Parent}});
            RunService:Wait();
        end
        depth = Split(game.Players.LocalPlayer.PlayerGui.ScreenGui.TopInfoFrame.Depth.Text, " ");
        wait();
    end
end

if (game.PlaceId == 1417427737) then
    -- Menjalankan script utama jika berada di tempat yang sesuai
end
