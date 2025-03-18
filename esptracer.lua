getgenv().ESPTracers = true

local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer



local function AssignTracers()

    for _, player in pairs(Players:GetPlayers()) do

        if player ~= LocalPlayer then

            local PlayerChar = game.Workspace:FindFirstChild(player.Name)

            local LocalChar = LocalPlayer.Character

            if not PlayerChar or not LocalChar or not LocalChar:FindFirstChild("HumanoidRootPart") then

                return

            end





            local beam

            if PlayerChar and LocalChar then

                if PlayerChar:FindFirstChild("ESPBeam") then

                    beam = PlayerChar:FindFirstChild("ESPBeam")

                    if beam then

                        beam.Enabled = getgenv().ESPTracers

                        local attachment0 = Instance.new("Attachment", LocalChar:WaitForChild("HumanoidRootPart"))

                        beam.Attachment0 = attachment0

                    end

                end



                if not beam and getgenv().ESPTracers then

                    local attachment0 = Instance.new("Attachment", LocalChar:WaitForChild("HumanoidRootPart"))

                    local attachment1 = Instance.new("Attachment", PlayerChar:WaitForChild("HumanoidRootPart"))



                    beam = Instance.new("Beam")

                    beam.Name = "ESPBeam"

                    beam.Attachment0 = attachment0

                    beam.Attachment1 = attachment1

                    beam.Color = ColorSequence.new(Color3.fromRGB(255,0,0))

                    beam.FaceCamera = true

                    beam.Width0 = 0.15

                    beam.Width1 = 0.15

                    beam.Parent = PlayerChar

                end

            end

        end

    end

end



AssignTracers()



Players.PlayerAdded:Connect(function(player)

    repeat wait() until player.Character or wait(2)

    AssignTracers()

end)



LocalPlayer.CharacterAdded:Connect(function()

    repeat wait() until LocalPlayer.Character or wait(2)

    AssignTracers()

end)
