WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

function gradient(text, startColor, endColor)
    local result = ""
    local length = #text

    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r = math.floor((startColor.R + (endColor.R - startColor.R) * t) * 255)
        local g = math.floor((startColor.G + (endColor.G - startColor.G) * t) * 255)
        local b = math.floor((startColor.B + (endColor.B - startColor.B) * t) * 255)

        local char = text:sub(i, i)
        result = result .. "<font color=\"rgb(" .. r ..", " .. g .. ", " .. b .. ")\">" .. char .. "</font>"
    end

    return result
end

local Confirmed = false

WindUI:Popup({
    Title = "欢迎使用凡脚本",
    Icon = "rbxassetid://129260712070622",
    IconThemed = true,
    Content = "This is an Example UI for the " .. gradient("WindUI", Color3.fromHex("#00FF87"), Color3.fromHex("#60EFFF")) .. " Lib",
    Buttons = {
        {
            Title = "退出",
            Callback = function() end,
            Variant = "Secondary",
        },
        {
            Title = "使用",
            Icon = "arrow-right",
            Callback = function() Confirmed = true end,
            Variant = "Primary",
        }
    }
})

repeat wait() until Confirmed

local Window = WindUI:CreateWindow({
    Title = "凡尘",
    Icon = "rbxassetid://129260712070622",
    IconThemed = true,
    Author = "凡脚本",
    Folder = "CloudHub",
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = "Dark",
    User = {
        Enabled = true,
        Callback = function() print("clicked") end,
        Anonymous = true
    },
    SideBarWidth = 200,
    ScrollBarEnabled = true,
    KeySystem = {
        Key = { "1234", "5678" },
        Note = "Example Key System. \n\nThe Key is '1234' or '5678",
        URL = "link-to-linkvertise-or-discord-or-idk",
        SaveKey = true,
    },
})

Window:CreateTopbarButton("MyCustomButton1", "bird", function() print("clicked 1!") end, 990)
Window:CreateTopbarButton("MyCustomButton3", "battery-plus", function() Window:ToggleFullscreen() end, 989)

Window:EditOpenButton({
    Title = "凡脚本",
    Icon = "monitor",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new(Color3.fromHex("FF0F7B"), Color3.fromHex("F89B29")),
    Draggable = true,
})

local Tabs = {}

do
    Tabs.MainTab = Window:Section({Title = "极速传奇", Opened = true})
    Tabs.SpeedTab = Tabs.MainTab:Tab({ Title = "刷", Icon = "zap" })
end

Window:SelectTab(1)

Tabs.SpeedTab:Button({
    Title = "凡刷速度",
    Desc = "刷速度",
    Callback = function()
        local code = [[
            local args = {"collectOrb", "Red Orb", "City"}
            while true do
                game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
                task.wait(0.0001)
            end
        ]]
        loadstring(code)()
    end
})

Tabs.SpeedTab:Button({
    Title = "凡刷",
    Desc = "刷砖石",
    Callback = function()
        local code = [[
            local args = {"collectOrb","Gem","City"}
            while true do
                game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
                task.wait(0.0003)
            end
        ]]
        loadstring(code)()
    end
})

Tabs.DeliverTab = Tabs.MainTab:Tab({ Title = "传送", Icon = "zap" })

Tabs.DeliverTab:Button({
    Title = "传送到城市",
    Desc = "传送到主城区",
    Callback = function()
        pcall(function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
                CFrame.new(2002.0133056640625, 1.2624330520629883, 985.2265625)
        end)
    end
})

Tabs.DeliverTab:Button({
    Title = "传送到雪城",
    Desc = "传送到冰雪区域",
    Callback = function()
        pcall(function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
                CFrame.new(-9675.25, 59.63568115234375, 3783.50146484375)
        end)
    end
})

Tabs.DeliverTab:Button({
    Title = "传送到火山",
    Desc = "传送到火山区域",
    Callback = function()
        pcall(function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
                CFrame.new(-11052.4189453125, 217.59571838378906, 4898.76416015625)
        end)
    end
})

Tabs.DeliverTab:Button({
    Title = "传送到公路",
    Desc = "传送到高速公路",
    Callback = function()
        pcall(function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
                CFrame.new(-13095.255859375, 217.59567260742188, 5905.240234375)
        end)
    end
})

Tabs.AttributeTab = Tabs.MainTab:Tab({ Title = "属性修改", Icon = "zap" })

Tabs.AttributeTab:Input({
    Title = "修改经验值",
    Placeholder = "输入经验值",
    Callback = function(arg)
        pcall(function()
            game:GetService("Players").LocalPlayer.exp.Value = tonumber(arg) or 0
            WindUI:Notify({Title = "修改成功", Content = "经验值已设置为: "..arg})
        end)
    end
})

Tabs.AttributeTab:Input({
    Title = "修改等级",
    Placeholder = "输入等级",
    Callback = function(arg)
        pcall(function()
            game:GetService("Players").LocalPlayer.level.Value = tonumber(arg) or 1
            WindUI:Notify({Title = "修改成功", Content = "等级已设置为: "..arg})
        end)
    end
})

Tabs.AttributeTab:Input({
    Title = "修改比赛数",
    Placeholder = "输入比赛数",
    Callback = function(arg)
        pcall(function()
            game:GetService("Players").LocalPlayer.leaderstats.Races.Value = tonumber(arg) or 0
            WindUI:Notify({Title = "修改成功", Content = "比赛数已设置为: "..arg})
        end)
    end
})

Tabs.AttributeTab:Input({
    Title = "修改圈数",
    Placeholder = "输入圈数",
    Callback = function(arg)
        pcall(function()
            game:GetService("Players").LocalPlayer.leaderstats.Hoops.Value = tonumber(arg) or 0
            WindUI:Notify({Title = "修改成功", Content = "圈数已设置为: "..arg})
        end)
    end
})

Tabs.AttributeTab:Input({
    Title = "修改重生次数",
    Placeholder = "输入重生次数",
    Callback = function(arg)
        pcall(function()
            game:GetService("Players").LocalPlayer.leaderstats.Rebirths.Value = tonumber(arg) or 0
            WindUI:Notify({Title = "修改成功", Content = "重生次数已设置为: "..arg})
        end)
    end
})

Tabs.AttributeTab:Input({
    Title = "修改步数",
    Placeholder = "输入步数",
    Callback = function(arg)
        pcall(function()
            game:GetService("Players").LocalPlayer.leaderstats.Steps.Value = tonumber(arg) or 0
            WindUI:Notify({Title = "修改成功", Content = "步数已设置为: "..arg})
        end)
    end
})

Tabs.AttributeTab:Input({
    Title = "修改尾迹容量",
    Placeholder = "输入容量",
    Callback = function(arg)
        pcall(function()
            game:GetService("Players").LocalPlayer.maxPetCapacity.Value = tonumber(arg) or 0
            WindUI:Notify({Title = "修改成功", Content = "尾迹容量已设置为: "..arg})
        end)
    end
})

Tabs.AttributeTab:Input({
    Title = "修改宝石数量",
    Placeholder = "输入宝石数量",
    Callback = function(arg)
        pcall(function()
            game:GetService("Players").LocalPlayer.Gems.Value = tonumber(arg) or 0
            WindUI:Notify({Title = "修改成功", Content = "宝石数量已设置为: "..arg})
        end)
    end
})

Tabs.MainTab = Window:Section({Title = "压力(正在更新)", Opened = true})
Tabs.NinjaTab = Tabs.MainTab:Tab({ Title = "透视", Icon = "zap" })

Tabs.NinjaTab:Toggle({
    Title = "透视钥匙卡",
    Desc = "透视",
    Value = false,
    Callback = function(state)
        if state then

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

-- 配置
local ESP_SETTINGS = {
    Text = "🔑 钥匙卡",
    TextColor = Color3.fromRGB(0, 255, 255),
    TextSize = 20,
    Font = Enum.Font.SourceSansBold,
    Offset = Vector3.new(0, 2, 0),
    MaxDistance = 50,  -- 显示距离（米）
    RefreshRate = 1    -- 目标刷新频率（秒）
}

-- 存储所有ESP实例
local activeESP = {}

-- 创建/更新文字ESP
local function updateESP(target)
    -- 移除旧ESP（如果存在）
    if activeESP[target] then
        activeESP[target]:Destroy()
    end

    -- 创建新ESP
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "TextESP_"..target.Name
    billboard.AlwaysOnTop = true
    billboard.Active = false
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.ExtentsOffset = ESP_SETTINGS.Offset
    billboard.LightInfluence = 0
    billboard.MaxDistance = ESP_SETTINGS.MaxDistance
    billboard.Parent = target

    local textLabel = Instance.new("TextLabel")
    textLabel.Text = ESP_SETTINGS.Text
    textLabel.TextColor3 = ESP_SETTINGS.TextColor
    textLabel.TextSize = ESP_SETTINGS.TextSize
    textLabel.Font = ESP_SETTINGS.Font
    textLabel.BackgroundTransparency = 1
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.Parent = billboard

    -- 存储引用
    activeESP[target] = billboard

    -- 自动清理监听
    target.AncestryChanged:Connect(function(_, parent)
        if not parent and activeESP[target] then
            activeESP[target]:Destroy()
            activeESP[target] = nil
        end
    end)
end

-- 查找所有钥匙卡
local function findKeycards()
    local drawers = workspace.GameplayFolder.Rooms.Start.Interactables:GetChildren()
    local found = {}
    
    for _, drawer in ipairs(drawers) do
        if drawer.Name:find("Drawer") then
            local spawnLoc = drawer:FindFirstChild("SpawnLocations")
            if spawnLoc then
                local keycard = spawnLoc:FindFirstChild("SpawnKeycard")
                if keycard then
                    table.insert(found, keycard)
                end
            end
        end
    end
    return found
end

-- 主循环
local function ESPLoop()
    while true do
        -- 清理超出距离的ESP
        for target, esp in pairs(activeESP) do
            if not target.Parent or 
               (Players.LocalPlayer.Character and 
               (target.Position - Players.LocalPlayer.Character:GetPivot().Position).Magnitude > ESP_SETTINGS.MaxDistance) then
                esp:Destroy()
                activeESP[target] = nil
            end
        end

     