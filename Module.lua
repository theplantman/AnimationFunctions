local AnimationFunctions =  {
    ["Animations"] = game.HttpService:JSONDecode(game:HttpGet("https://raw.githubusercontent.com/theplantman/Scraped-Animations/main/2686500207_Scraped.json")),
    ["Playing"] = {}
}
function AnimationFunctions:Play(Name, Speed)
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and AnimationFunctions["Animations"][Name] then
        if AnimationFunctions["Playing"][Name] then
            AnimationFunctions["Playing"][Name]:Stop()
        end
        local Animation = Instance.new("Animation")
        Animation.AnimationId = AnimationFunctions["Animations"][Name]
        AnimationFunctions["Playing"][Name] = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Animation)
        AnimationFunctions["Playing"][Name]:Play(0.100000001, 1, Speed or 1)
        AnimationFunctions["Playing"][Name].Stopped:Connect(function()
            AnimationFunctions["Playing"][Name]:Destroy()
            AnimationFunctions["Playing"][Name] = nil
        end)
        Animation:Destroy()
    else
        warn("Failed To Play Animation.")
    end
end
function AnimationFunctions:Stop(Name, FadeTime)
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and AnimationFunctions["Animations"][Name] and AnimationFunctions["Playing"][Name] then
        AnimationFunctions["Playing"][Name]:Stop(FadeTime or 0)
    else
        warn("Failed To Stop Animation.")
    end
end
return AnimationFunctions
