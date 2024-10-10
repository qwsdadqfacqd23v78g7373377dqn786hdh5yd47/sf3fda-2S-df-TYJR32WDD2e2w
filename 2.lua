shared.LoaderTitle = 'Botuna.inc X Medusa Script'
shared.LoaderKeyFrames = {
    [1] = {1, 10},
    [2] = {2, 30},
    [3] = {3, 60},
    [4] = {2, 100}
}

local Metadata = {
    LoaderData = {
        Name = (shared.LoaderTitle or 'A Loader'),
        Colors = shared.LoaderColors or {
            Main = Color3.fromRGB(0, 0, 0),
            Topic = Color3.fromRGB(200, 200, 200),
            Title = Color3.fromRGB(255, 255, 255),
            LoaderBackground = Color3.fromRGB(40, 40, 40),
            LoaderSplash = Color3.fromRGB(147, 112, 219)
        }
    },
    Keyframes = shared.LoaderKeyFrames or {
        [1] = {1, 10},
        [2] = {2, 30},
        [3] = {3, 60},
        [4] = {2, 100}
    }
}

local StepTexts = {
    [1] = "Initiating Script",
    [2] = "Bypassing Security",
    [3] = "Injecting Function",
    [4] = "Success Executing"
}

function TweenObject(object, speed, info)
    game.TweenService:Create(object, TweenInfo.new(speed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), info):Play()
end

function CreateObject(className, properties)
    local instance = Instance.new(className)
    local parent
    for propertyName, propertyValue in pairs(properties) do
        if propertyName ~= "Parent" then
            instance[propertyName] = propertyValue
        else
            parent = propertyValue
        end
    end
    instance.Parent = parent
    return instance
end

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local userId = player.UserId
local userName = player.Name
local thumbType = Enum.ThumbnailType.HeadShot
local thumbSize = Enum.ThumbnailSize.Size420x420
local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)

local function CreateUICorner(radius, parent)
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, radius)
    UICorner.Parent = parent
end

local Core = CreateObject("ScreenGui", {
    Name = "Core",
    Parent = game.CoreGui
})

local Main = CreateObject("Frame", {
    Name = "Main",
    Parent = Core,
    BackgroundColor3 = Metadata.LoaderData.Colors.Main,
    BorderSizePixel = 0,
    ClipsDescendants = true,
    Position = UDim2.new(0.5, 0, 0.5, 0),
    AnchorPoint = Vector2.new(0.5, 0.5),
    Size = UDim2.new(0, 0, 0, 0),
})
CreateUICorner(12, Main)

local UserImage = CreateObject("ImageLabel", {
    Name = "UserImage",
    Parent = Main,
    BackgroundTransparency = 1,
    Image = content,
    Position = UDim2.new(0, 15, 0, 10),
    Size = UDim2.new(0, 50, 0, 50),
})
CreateUICorner(25, UserImage)

local UserName = CreateObject("TextLabel", {
    Name = "UserName",
    Parent = Main,
    BackgroundTransparency = 1,
    Text = "Hello, " .. userName .. "",
    Position = UDim2.new(0, 75, 0, 10),
    Size = UDim2.new(0, 200, 0, 50),
    Font = Enum.Font.GothamBold,
    TextColor3 = Metadata.LoaderData.Colors.Title,
    TextSize = 14,
    TextXAlignment = Enum.TextXAlignment.Left,
})

local Top = CreateObject("TextLabel", {
    Name = "Top",
    TextTransparency = 1,
    Parent = Main,
    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    BackgroundTransparency = 1,
    Position = UDim2.new(0, 30, 0, 70),
    Size = UDim2.new(0, 301, 0, 20),
    Font = Enum.Font.Gotham,
    Text = "Loader",
    TextColor3 = Metadata.LoaderData.Colors.Topic,
    TextSize = 10,
    TextXAlignment = Enum.TextXAlignment.Left,
})

local Title = CreateObject("TextLabel", {
    Name = "Title",
    Parent = Main,
    TextTransparency = 1,
    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    BackgroundTransparency = 1,
    Position = UDim2.new(0, 30, 0, 90),
    Size = UDim2.new(0, 301, 0, 46),
    Font = Enum.Font.Gotham,
    RichText = true,
    Text = "<b>" .. Metadata.LoaderData.Name .. "</b>",
    TextColor3 = Metadata.LoaderData.Colors.Title,
    TextSize = 14,
    TextXAlignment = Enum.TextXAlignment.Left,
})

local BG = CreateObject("Frame", {
    Name = "BG",
    Parent = Main,
    AnchorPoint = Vector2.new(0.5, 0),
    BackgroundTransparency = 1,
    BackgroundColor3 = Metadata.LoaderData.Colors.LoaderBackground,
    BorderSizePixel = 0,
    Position = UDim2.new(0.5, 0, 0, 70),
    Size = UDim2.new(0.8500000238418579, 0, 0, 24),
})
CreateUICorner(8, BG)

local Progress = CreateObject("Frame", {
    Name = "Progress",
    Parent = BG,
    BackgroundColor3 = Metadata.LoaderData.Colors.LoaderSplash,
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    Size = UDim2.new(0, 0, 0, 24),
})
CreateUICorner(8, Progress)

local StepLabel = CreateObject("TextLabel", {
    Name = "StepLabel",
    Parent = Main,
    BackgroundTransparency = 1,
    Position = UDim2.new(0.5, 0, 1, -25),
    Size = UDim2.new(1, -20, 0, 20),
    Font = Enum.Font.Gotham,
    Text = "",
    TextColor3 = Metadata.LoaderData.Colors.Topic,
    TextSize = 14,
    TextXAlignment = Enum.TextXAlignment.Center,
    AnchorPoint = Vector2.new(0.5, 0.5)
})function UpdateStepText(step)
    StepLabel.Text = StepTexts[step] or ""
end
function UpdatePercentage(percentage, step)
    TweenObject(Progress, 0.5, {
        Size = UDim2.new((percentage / 100), 0, 0, 24)
    })
    UpdateStepText(step)
end
TweenObject(Main, 0.25, {
    Size = UDim2.new(0, 346, 0, 121)
})
wait(0.25)
TweenObject(Top, 0.5, {
    TextTransparency = 0
})
TweenObject(Title, 0.5, {
    TextTransparency = 0
})
TweenObject(BG, 0.5, {
    BackgroundTransparency = 0
})
TweenObject(Progress, 0.5, {
    BackgroundTransparency = 0
})

for i, v in pairs(Metadata.Keyframes) do
    wait(v[1])
    UpdatePercentage(v[2], i)
end

UpdatePercentage(100, 4)

TweenObject(Top, 0.5, {
    TextTransparency = 1
})
TweenObject(Title, 0.5, {
    TextTransparency = 1
})
TweenObject(BG, 0.5, {
    BackgroundTransparency = 1
})
TweenObject(Progress, 0.5, {
    BackgroundTransparency = 1
})
wait(0.5)
--TweenObject(Main, 0.25, {
--   Size = UDim2.new(0, 0, 0, 0)
--})
--wait(0.25)
--Core:Destroy()   
