local TptoCar = false
getgenv().WalkSpeed = WalkSpeed or 13
getgenv().JumpPower = JumpPower or 50
getgenv().ClickTP = false
local library = loadstring(game:HttpGet"https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua")()
local w = library:CreateWindow"Work at a Pizza Place!"
local b = w:CreateFolder"Main"
local c = w:CreateFolder"Settings"
local e = w:CreateFolder"Teleport"
local d = w:CreateFolder"Misc"
-- Main--
b:Button("Teleport to Car", function()
	workspace.Cars.Car.LeftDoor.ClickDetector.Detector:FireServer()
end)
b:Button("Teleport to Truck", function()
	if workspace.Trucks:FindFirstChild"Truck1" then
		workspace.Trucks.Truck1.LeftDoor.ClickDetector.Detector:FireServer()
	else print"No Trucks Spawned" end
end)
b:Button("Upgrade House", function()
	game:GetService"ReplicatedStorage".PlayerChannel:FireServer(unpack(args))
end)
-- Settings--
b:Slider("WalkSpeed", { min = 16, max = 500, precise = true }, function(value) WalkSpeed = value end)
b:Slider("JumpPower", { min = 50, max = 1e3, precise = true }, function(value) JumpPower = value end)
-- Misc--
d.DestroyGui()

-- Teleport--
local function To(position)
	-- tp function
	local Chr = game.Players.LocalPlayer.Character
	if Chr ~= nil then Chr:MoveTo(position) end
end

game:GetService"UserInputService".InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 and game:GetService"UserInputService":IsKeyDown(Enum.KeyCode.LeftControl) and ClickTP then
		-- check if ctrl is down and if ClickTP is true
		To(game.Players.LocalPlayer:GetMouse().Hit.p)
		-- tp to mouse postion
	end
end)
e:Toggle("Click TP", function(bool) ClickTP = bool end)
-- toggle the ClickTP variable
e:Button("Cashier Desk", function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(41.3454857, 3.79813671, 83.1704483, -0.993856966, 4.79044111e-8, -0.11067196, 4.67233967e-8, 1, 1.32647404e-8, 0.11067196, 8.01228506e-9, -0.993856966)
end)
e:Button("Kitchen", function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(40.2290344, 3.79813671, 59.1174431, 0.999409735, 9.42594554e-8, -0.0343541317, -9.36925844e-8, 1, 1.8110633e-8, 0.0343541317, -1.48812154e-8, 0.999409735)
end)
e:Button("Pizza Boxing Station", function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(56.5254211, 3.7980032, 16.9100113, -0.0401201323, -8.19194454e-8, -0.99919486, -6.3042549e-8, 1, -7.94541393e-8, 0.99919486, 5.9804087e-8, -0.0401201323)
end)
e:Button("Delivery Station", function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(65.8352814, 3.7980032, -16.5408306, -0.999163389, 1.06944276e-8, 0.0408965237, 1.20189947e-8, 1, 3.21423883e-8, -0.0408965237, 3.260703e-8, -0.999163389)
end)
e:Button("Managers Chair", function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.ManagerChair.Seat.CFrame
end)
e:Button("Vote Kick Manager", function()
	local currentCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(12.2403126, 3.99800253, 20.9957676, 0.103953317, 6.77236878e-10, 0.994582176, 5.82614934e-9, 1, -1.28987276e-9, -0.994582176, 5.92867089e-9, 0.103953317)
	wait(0.5)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = currentCFrame
end)
-- FUNCTIONS --
spawn(function()
	while wait() do
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = WalkSpeed
	end
end)
spawn(function()
	while wait() do
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = JumpPower
	end
end)