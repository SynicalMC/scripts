-- init
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local venyx = library.new("Anomic Menu", 5013109572)

-- themes
local themes = {
Background = Color3.fromRGB(24, 24, 24),
Glow = Color3.fromRGB(0, 0, 0),
Accent = Color3.fromRGB(10, 10, 10),
LightContrast = Color3.fromRGB(20, 20, 20),
DarkContrast = Color3.fromRGB(14, 14, 14),  
TextColor = Color3.fromRGB(255, 255, 255)
}

-- first page
local page = venyx:addPage("Scripts", 5012544693)
local section1 = page:addSection("Execute")
local section2 = page:addSection("Misc")
local section3 = page:addSection("Menu Settings")

section1:addButton("Execute OpenGui", function()
venyx:Notify("Anomic Menu", "OpenGui Executed")
loadstring(game:HttpGet("https://raw.githubusercontent.com/SynicalMC/scripts/master/OpenGui.lua"))()
end)

section1:addButton("Execute OwlHub", function()
venyx:Notify("Anomic Menu", "OwlHub Executed")
loadstring(game:HttpGet("https://raw.githubusercontent.com/ZinityDrops/OwlHubLink/master/OwlHubBack.lua"))();
end)

--Section 2
section2:addSlider("WalkSpeed", 16, 0, 100, function(value)
    game:GetService('Players').LocalPlayer.Character.Humanoid.WalkSpeed = value
end)
section2:addButton("Reset WalkSpeed", function()
    game:GetService('Players').LocalPlayer.Character.Humanoid.WalkSpeed = 16
    venyx:Notify("Anomic Menu", "Resetted WalkSpeed to 16")
end)
-- section 3

section3:addKeybind("Toggle Keybind", Enum.KeyCode.RightShift, function()
print("Activated Keybind")
venyx:toggle()
end, function()
print("Changed Keybind")
end)
-- second page
local theme = venyx:addPage("Theme", 5012544693)
local colors = theme:addSection("Colors")

for theme, color in pairs(themes) do -- all in one theme changer, i know, im cool
colors:addColorPicker(theme, color, function(color3)
venyx:setTheme(theme, color3)
end)
end

-- load
venyx:SelectPage(venyx.pages[1], true)