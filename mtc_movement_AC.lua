local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local u3 = game:GetService("RunService")
local u4 = require(v2:WaitForChild("TankCheck"))
local v5 = v2:WaitForChild("Events")
local v6 = v1.LocalPlayer
local u7 = v5:WaitForChild("Loki"):WaitForChild("Proxy")
v5:WaitForChild("IWantToBeBanned")
function watchScriptDestroy(u8, p9, u10)
    local v11 = p9 or {}
    local u12 = u8.Parent
    local function v13() --[[Anonymous function at line 15]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u12
            [3] = u10
        --]]
        task.wait()
        if not (u8 and u8.Parent) and u12 then
            u10()
        end
    end
    local v14 = u8.AncestryChanged
    table.insert(v11, v14:Connect(v13))
    local v15 = u8.Destroying
    table.insert(v11, v15:Once(v13))
    return v11
end
function onCharacterAdded(u16)
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
    --]]
    local u17 = true
    local u18 = {}
    local u19 = RaycastParams.new()
    u19.FilterDescendantsInstances = { u16 }
    u19.FilterType = Enum.RaycastFilterType.Exclude
    local u20 = u16:WaitForChild("Humanoid")
    local u21 = u16:WaitForChild("HumanoidRootPart")
    local v22 = u16:WaitForChild("StandingSlip", 5)
    local function v29(p23) --[[Anonymous function at line 41]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u20
        --]]
        if (p23:IsA("BodyGyro") or (p23:IsA("BodyVelocity") or (p23:IsA("AlignOrientation") or p23:IsA("AlignPosition")))) and (not string.find(p23.Name, "ADONIS") and p23.Parent.Name ~= "Main") then
            local v24 = u4.send
            local v25 = "Flying"
            local v26 = ("Instance: %*"):format((p23:GetFullName()))
            local v27 = "\nSeatPart: %*"
            local v28 = u20 and u20.SeatPart
            if v28 then
                v28 = u20.SeatPart:GetFullName()
            end
            v24(v25, v26 .. v27:format(v28))
        end
    end
    local v30 = u16.DescendantAdded
    table.insert(u18, v30:Connect(v29))
    local v31 = u20:GetPropertyChangedSignal("WalkSpeed")
    local function v32() --[[Anonymous function at line 64]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u20
        --]]
        u7:Fire(("Walk speed changed to %*"):format(u20.WalkSpeed), Enum.MessageType.MessageWarning)
    end
    table.insert(u18, v31:Connect(v32))
    if v22 then
        watchScriptDestroy(v22, u18, function() --[[Anonymous function at line 70]]
            --[[
            Upvalues:
                [1] = u4
            --]]
            u4.send("Client tampering", "Deleted StarterCharacterScripts.StandingSlip", debug.traceback())
        end)
    end
    task.spawn(function() --[[Anonymous function at line 79]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u16
            [3] = u21
            [4] = u19
        --]]
        while u17 and u16 do
            task.wait()
            local v33 = workspace:Raycast(u21.Position, Vector3.new(0, -3, 0), u19)
            if v33 ~= nil then
                local v34 = v33.Instance
                if v34 ~= nil and v34:GetAttribute("Slip") then
                    u21:ChangeState(Enum.HumanoidStateType.FallingDown)
                end
            end
        end
    end)
    local v35 = u16.Destroying
    table.insert(u18, v35:Once(function() --[[Function name: kill, line 93]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u18
        --]]
        u17 = false
        for _, v36 in u18 do
            v36:Disconnect()
        end
    end))
    local v37 = u16.AncestryChanged
    table.insert(u18, v37:Connect(function(_, p38) --[[Anonymous function at line 106]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u18
        --]]
        if not p38 then
            u17 = false
            for _, v39 in u18 do
                v39:Disconnect()
            end
        end
    end))
end
if v6.Character then
    task.spawn(onCharacterAdded, v6.Character)
end
v6.CharacterAdded:Connect(onCharacterAdded)
watchScriptDestroy(script.Parent, nil, function() --[[Anonymous function at line 119]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.send("Client tampering", "Deleted ReplicatedFirst.AC", debug.traceback())
end)
task.spawn(function() --[[Anonymous function at line 127]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    task.wait()
    local v40 = {
        game:GetService("AnimationFromVideoCreatorService"),
        game:GetService("AvatarCreationService"),
        game:GetService("GoogleAnalyticsConfiguration"),
        game:GetService("InsertService"),
        game:GetService("CoreScriptDebuggingManagerHelper"),
        game:GetService("Geometry"),
        game:GetService("KeyboardService"),
        game:GetService("CookiesService")
    }
    while u3.PreSimulation:Wait() do
        script.Parent = v40[math.random(1, #v40)]
    end
end)
return nil
