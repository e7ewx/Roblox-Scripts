--TeleFilter by e7ewx
print("TeleFilter -- Launched") runService = game:GetService("RunService") local player = game:GetService("Players").LocalPlayer local character local last local new local enabled = false local legalTeleport = false local gui = Instance.new("ScreenGui") gui.Parent = player.PlayerGui gui.DisplayOrder = 9999 gui.Name = "TeleFilter" local frame = Instance.new("TextButton") frame.Parent = gui frame.AnchorPoint = Vector2.new(0.5,0) frame.Position = UDim2.new(0.5,0,-0.1,0) frame.Size = UDim2.new(0.2,0,0.04,0) frame.BackgroundTransparency = 1 frame.TextScaled = true frame.Text = "TeleFilter Enabled" frame.Font = "FredokaOne" frame.Name = "TeleFilter" frame.TextTransparency = 0.5 local part = Instance.new("Highlight") part.OutlineTransparency = 1 part.FillTransparency = 1 local event = Instance.new("BindableEvent") event.Parent = player event.Name = "TeleFilter" runService.Heartbeat:Connect(function(DeltaTime) local fps = 1 / DeltaTime if character then part.Parent = character new = character.HumanoidRootPart.CFrame local posChange = (new.Position - last.Position).Magnitude local velocity = (character.HumanoidRootPart.Velocity / fps).Magnitude * 5 if posChange > velocity and enabled and posChange > 0.5 and not legalTeleport then character.HumanoidRootPart.CFrame = last print("TeleFilter -- Blocked teleport") part.FillColor = Color3.new(1, 0, 0) part.FillTransparency = 0 else part.FillTransparency += (1 - part.FillTransparency)/15 if legalTeleport and enabled then part.FillTransparency = 0 part.FillColor = Color3.new(0, 1, 0) print("TeleFilter -- Passed teleport") legalTeleport = false end end last = character.HumanoidRootPart.CFrame end if enabled then frame.Text = "TeleFilter Enabled" else frame.Text = "TeleFilter Disabled" end end) player.CharacterAdded:Connect(function() character = player.Character last = character.HumanoidRootPart.CFrame new = last end) if player.Character then character = player.Character last = character.HumanoidRootPart.CFrame new = last end game.UserInputService.InputBegan:Connect(function(input,gameProcessedEvent) if gameProcessedEvent then return end if input.KeyCode == Enum.KeyCode.T then enabled = not enabled end end) event.Event:Connect(function() legalTeleport = true end) frame.MouseButton1Click:Connect(function() enabled = not enabled end)
--[[

DESCRIPTION:
TeleFilter will block any detected teleports and will allow teleports that are coded to work with TeleFilter.

To make a teleport bypass TeleFilter, put this after the teleport:
local TeleFilter = game.Players.LocalPlayer:FindFirstChild("TeleFilter") if TeleFilter then TeleFilter:Fire() end

TeleFilter can be toggled on/off by clicking the UI at the top of the screen or by pressing T.

TeleFilter logs all blocked teleports and passed teleports.

Heres the loadstring version:
loadstring(game:HttpGet("https://raw.githubusercontent.com/e7ewx/Roblox-Scripts/refs/heads/main/TeleFilter.lua"))()

]]
