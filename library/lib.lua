local Library = {}
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

function Library:Window()
    local AdminGui = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local UIGradient = Instance.new("UIGradient")
    local close = Instance.new("ImageButton")
    local TextLabel = Instance.new("TextLabel")
    local UIGradient_2 = Instance.new("UIGradient")
    local TabContainer = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local Glasifier = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local Deglazifier = Instance.new("Frame")
    local UICorner_3 = Instance.new("UICorner")

    AdminGui.Name = "ui"
    AdminGui.Parent = game.CoreGui
    AdminGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    Main.Name = "Main"
    Main.ClipsDescendants = true
    Main.Parent = AdminGui
    Main.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    Main.Position = UDim2.new(0.5, 0, 0.5, 0)
    Main.AnchorPoint = Vector2.new(0.5, 0.5)
    Main.Size = UDim2.new(0, 0, 0, 0)
    
    TweenService:Create(
        Main,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Size = UDim2.new(0, 600, 0, 320)}
    ):Play()

    UICorner.CornerRadius = UDim.new(0, 5)
    UICorner.Parent = Main
    
    UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(59, 255, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(25, 25, 25))}
    UIGradient.Rotation = 45
    UIGradient.Parent = Main
    
    close.Name = "close"
    close.Parent = Main
    close.BackgroundTransparency = 1.000
    close.Position = UDim2.new(0.948333323, 0, 0.0156249898, 0)
    close.Size = UDim2.new(0, 25, 0, 25)
    close.ZIndex = 2
    close.Image = "rbxassetid://3926305904"
    close.ImageRectOffset = Vector2.new(284, 4)
    close.ImageRectSize = Vector2.new(24, 24)
    
    close.MouseButton1Click:Connect(function()
        TweenService:Create(
            Main,
            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Size = UDim2.new(0, 0, 0, 0)}
        ):Play()
        wait(1)
        AdminGui:Destroy()
    end)

    TextLabel.Parent = Main
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.BorderSizePixel = 0
    TextLabel.Position = UDim2.new(0, 0, 0.00508022308, 0)
    TextLabel.Size = UDim2.new(0, 600, 0, 33)
    TextLabel.Font = Enum.Font.GothamSemibold
    TextLabel.Text = "Uranium Hub V3.0.0"
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 19.000
    
    UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(89, 255, 0)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(63, 181, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(89, 255, 0))}
    UIGradient_2.Rotation = 45
    UIGradient_2.Parent = TextLabel
    
    TabContainer.Name = "TabContainer"
    TabContainer.Parent = Main
    TabContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    TabContainer.BackgroundTransparency = 1.000
    TabContainer.BorderSizePixel = 0
    TabContainer.Position = UDim2.new(0.021, 0, 0.0170000009, 0)
    TabContainer.Size = UDim2.new(0, 38, 0, 309)
    TabContainer.ZIndex = 2
    
    UIListLayout.Parent = TabContainer
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 4)
    
    Glasifier.Name = "Glasifier"
    Glasifier.Parent = Main
    Glasifier.BackgroundColor3 = Color3.fromRGB(145, 145, 145)
    Glasifier.BackgroundTransparency = 0.900
    Glasifier.Position = UDim2.new(0, 5, 0, 4)
    Glasifier.Size = UDim2.new(0, 591, 0, 313)
    
    UICorner_2.CornerRadius = UDim.new(0, 4)
    UICorner_2.Parent = Glasifier
    
    Deglazifier.Name = "Deglazifier"
    Deglazifier.Parent = Main
    Deglazifier.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Deglazifier.BackgroundTransparency = 0.900
    Deglazifier.Position = UDim2.new(0.0949999988, 0, 0.106250003, 0)
    Deglazifier.Size = UDim2.new(0, 539, 0, 283)
    
    UICorner_3.CornerRadius = UDim.new(0, 4)
    UICorner_3.Parent = Deglazifier

    -- ─────────────────────────────────────────────────────────

    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    Main.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = Main.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    Main.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)

    -- ─────────────────────────────────────────────────────────

    local uitoggle = false

    game:GetService("UserInputService").InputBegan:connect(function(inputObject, gameProcessedEvent)
        if inputObject.KeyCode == Enum.KeyCode.RightControl then 
            if uitoggled == false then
                TweenService:Create(
                    Main,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 0, 0, 0)}
                ):Play()
                uitoggled = true
            else
                TweenService:Create(
                    Main,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 600, 0, 320)}
                ):Play()
                uitoggled = false
            end
        end 
    end)

    -- ─────────────────────────────────────────────────────────

    local Window = {}

    function Window:Notification(texttitle, textdesc, textbtn)
        local Notify = Instance.new("Frame")
        local UICorner = Instance.new("UICorner")
        local Frame = Instance.new("Frame")
        local UICorner_2 = Instance.new("UICorner")
        local TextButton = Instance.new("TextButton")
        local UICorner_3 = Instance.new("UICorner")
        local titl = Instance.new("TextLabel")
        local des = Instance.new("TextLabel")
    
        --Properties:
    
        Notify.Name = "Notify"
        Notify.Parent = Main
        Notify.BackgroundColor3 = Color3.fromRGB(0, 30, 1)
        Notify.BackgroundTransparency = 1 -- 0.600
        Notify.Position = Main.Position
        Notify.Size = UDim2.new(0, 600, 0, 320)
        Notify.Visible = true
        Notify.ZIndex = 99
        Notify.AnchorPoint = Vector2.new(0.5, 0.5)
        Notify.ClipsDescendants = true

        TweenService:Create(
            Notify,
            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 0.6}
        ):Play()
        wait(0.4)

        UICorner.CornerRadius = UDim.new(0, 5)
        UICorner.Parent = Notify
    
        Frame.Parent = Notify
        Frame.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame.BackgroundColor3 = Color3.fromRGB(0, 52, 0)
        Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
        Frame.Size = UDim2.new(0, 0, 0, 0)
        -- Frame.Size = UDim2.new(0, 220, 0, 234)
        Frame.ZIndex = 99
        Frame.ClipsDescendants = true

        Frame:TweenSize(
            UDim2.new(0, 220, 0, 234),
            Enum.EasingDirection.Out,
            Enum.EasingStyle.Quart,
            .6,
            true
        )

        UICorner_2.CornerRadius = UDim.new(0, 5)
        UICorner_2.Parent = Frame
    
        TextButton.AutoButtonColor = false
        TextButton.Parent = Frame
        TextButton.BackgroundColor3 = Color3.fromRGB(9, 72, 0)
        TextButton.Position = UDim2.new(0.0454545468, 0, 0.850427508, 0)
        TextButton.Size = UDim2.new(0, 200, 0, 27)
        TextButton.ZIndex = 99
        TextButton.Font = Enum.Font.Gotham
        TextButton.Text = textbtn
        TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextButton.TextSize = 14.000
    
        TextButton.MouseEnter:Connect(
            function()
                TweenService:Create(
                    TextButton,
                    TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 = Color3.fromRGB(15, 78, 6)}
                ):Play()
            end
        )

        TextButton.MouseLeave:Connect(
            function()
                TweenService:Create(
                    TextButton,
                    TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 = Color3.fromRGB(9, 72, 0)}
                ):Play()
            end
        )

        TextButton.MouseButton1Click:Connect(
            function()
                Frame:TweenSize(
                    UDim2.new(0, 0, 0, 0),
                    Enum.EasingDirection.Out,
                    Enum.EasingStyle.Quart,
                    .6,
                    true
                )

                wait(0.4)

                TweenService:Create(
                    Notify,
                    TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundTransparency = 1}
                ):Play()

                wait(.3)

                Notify:Destroy()
            end
        )

        UICorner_3.CornerRadius = UDim.new(0, 3)
        UICorner_3.Parent = TextButton
    
        titl.Name = "titl"
        titl.Parent = Frame
        titl.AnchorPoint = Vector2.new(0.5, 0.5)
        titl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        titl.BackgroundTransparency = 1.000
        titl.Position = UDim2.new(0.5, 0, 0.0769232064, 0)
        titl.Size = UDim2.new(0, 200, 0, 28)
        titl.ZIndex = 99
        titl.Font = Enum.Font.Gotham
        titl.Text = "<b>" .. texttitle .. "</b>"
        titl.TextColor3 = Color3.fromRGB(255, 255, 255)
        titl.TextSize = 19.000
        titl.RichText = true
        
        des.Name = "des"
        des.Parent = Frame
        des.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        des.BackgroundTransparency = 1.000
        des.BorderSizePixel = 0
        des.Position = UDim2.new(0.0454545468, 0, 0.166666672, 0)
        des.Size = UDim2.new(0, 200, 0, 154)
        des.ZIndex = 99
        des.Font = Enum.Font.Gotham
        des.Text = textdesc
        des.TextColor3 = Color3.fromRGB(255, 255, 255)
        des.TextSize = 15.000
        des.TextWrapped = true
        des.TextXAlignment = Enum.TextXAlignment.Left
        des.TextYAlignment = Enum.TextYAlignment.Top
    end

    function Window:Tab(img)
        local sel = false

        local ScrollingFrame = Instance.new("ScrollingFrame")
        local TabButton = Instance.new("ImageButton")
        local UIListLayout_2 = Instance.new("UIListLayout")
        local UIGradientL = Instance.new("UIGradient", TabButton)

        UIGradientL.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 158, 10))}
        UIGradientL.Rotation = 45

        ScrollingFrame.Name = "ScrollingFrame"
        ScrollingFrame.Parent = Deglazifier
        ScrollingFrame.Active = true
        ScrollingFrame.AutomaticCanvasSize = "Y"
        ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ScrollingFrame.BackgroundTransparency = 1.000
        ScrollingFrame.Position = UDim2.new(0.012987013, 0, 0.0282685515, 0)
        ScrollingFrame.Size = UDim2.new(0, 525, 0, 267)
        ScrollingFrame.TopImage = "rbxassetid://2282042316"
        ScrollingFrame.MidImage = "rbxassetid://2282042316"
        ScrollingFrame.BottomImage = "rbxassetid://2282042316"
        ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(6, 93, 0)
        ScrollingFrame.ScrollBarThickness = 9
        ScrollingFrame.BorderSizePixel = 0

        UIListLayout_2.Parent = ScrollingFrame
        UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout_2.Padding = UDim.new(0, 5)

        TabButton.Name = "TabButton"
        TabButton.Parent = TabContainer
        TabButton.BackgroundTransparency = 1.000
        TabButton.Size = UDim2.new(0, 35, 0, 35)
        TabButton.ZIndex = 2
        TabButton.Image = img
        TabButton.ImageColor3 = Color3.fromRGB(0, 134, 0)
        TabButton.ImageRectOffset = Vector2.new(0,0)
        TabButton.ImageRectSize = Vector2.new(0,0)

        TabButton.MouseButton1Click:Connect(function()
            sel = not sel
            for i, v in pairs(Deglazifier:GetChildren()) do
                if v.Name == "ScrollingFrame" then
                    v.Visible = false
                end
                ScrollingFrame.Visible = true
            end
            TabButton.ImageColor3 = Color3.fromRGB(0, 255, 0)
        end)

        TabButton.MouseEnter:Connect(
            function()
                TweenService:Create(
                    TabButton,
                    TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {ImageColor3 = Color3.fromRGB(0, 255, 0)}
                ):Play()
            end
        )

        TabButton.MouseLeave:Connect(
            function()
                TweenService:Create(
                    TabButton,
                    TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {ImageColor3 = Color3.fromRGB(0, 134, 0)}
                ):Play()
            end
        )

        local Tab = {}

        function Tab:Button(text, callback)
            local NewButton = Instance.new("TextButton")
            local TextLabel_2 = Instance.new("TextLabel")
            local UICorner_4 = Instance.new("UICorner")

            NewButton.Name = "NewButton"
            NewButton.Parent = ScrollingFrame
            NewButton.BackgroundColor3 = Color3.fromRGB(102, 102, 102)
            NewButton.BackgroundTransparency = 0.850
            NewButton.Position = UDim2.new(0, 0, 1.14298047e-07, 0)
            NewButton.Size = UDim2.new(0, 505, 0, 28)
            NewButton.ZIndex = 4
            NewButton.Active = true
            NewButton.AutoButtonColor = false
            NewButton.Font = Enum.Font.Gotham
            NewButton.Text = ""
            NewButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            NewButton.TextSize = 14.000
            NewButton.TextStrokeTransparency = 0.890
            NewButton.TextXAlignment = Enum.TextXAlignment.Left

            UICorner_4.CornerRadius = UDim.new(0, 3)
            UICorner_4.Parent = NewButton

            TextLabel_2.Parent = NewButton
            TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_2.BackgroundTransparency = 1.000
            TextLabel_2.Position = UDim2.new(0.0171429012, 0, 0.25, 0)
            TextLabel_2.Size = UDim2.new(0, 487, 0, 15)
            TextLabel_2.ZIndex = 3
            TextLabel_2.Font = Enum.Font.Gotham
            TextLabel_2.Text = text
            TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_2.TextSize = 15.000
            TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

            NewButton.MouseEnter:Connect(
                function()
                    TweenService:Create(
                        NewButton,
                        TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.810}
                    ):Play()
                end
            )
    
            NewButton.MouseLeave:Connect(
                function()
                    TweenService:Create(
                        NewButton,
                        TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.850}
                    ):Play()
                end
            )

            NewButton.MouseButton1Click:Connect(function()
                pcall(callback)
            end)
        end
        function Tab:Label(text)
            local NewLabel = Instance.new("TextButton")
            local UICorner_5 = Instance.new("UICorner")
            local TextLabel_3 = Instance.new("TextLabel")

            NewLabel.Name = "NewLabel"
            NewLabel.Parent = ScrollingFrame
            NewLabel.BackgroundColor3 = Color3.fromRGB(102, 102, 102)
            NewLabel.BackgroundTransparency = 0.850
            NewLabel.Position = UDim2.new(0, 0, 1.14298047e-07, 0)
            NewLabel.Size = UDim2.new(0, 505, 0, 28)
            NewLabel.ZIndex = 4
            NewLabel.AutoButtonColor = false
            NewLabel.Font = Enum.Font.Gotham
            NewLabel.Text = ""
            NewLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            NewLabel.TextSize = 14.000
            NewLabel.TextStrokeTransparency = 0.890
            NewLabel.TextXAlignment = Enum.TextXAlignment.Left
            
            UICorner_5.CornerRadius = UDim.new(0, 3)
            UICorner_5.Parent = NewLabel
            
            TextLabel_3.Parent = NewLabel
            TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_3.BackgroundTransparency = 1.000
            TextLabel_3.Position = UDim2.new(0.0171429012, 0, 0.25, 0)
            TextLabel_3.Size = UDim2.new(0, 487, 0, 15)
            TextLabel_3.ZIndex = 3
            TextLabel_3.RichText = true
            TextLabel_3.Font = Enum.Font.Gotham
            TextLabel_3.Text = "<i>".. text .. "</i>"
            TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_3.TextSize = 15.000
            TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left
        end
        function Tab:Category(text)
            local NewLabel = Instance.new("TextButton")
            local UICorner_5 = Instance.new("UICorner")
            local TextLabel_3 = Instance.new("TextLabel")

            NewLabel.Name = "NewLabel"
            NewLabel.Parent = ScrollingFrame
            NewLabel.BackgroundColor3 = Color3.fromRGB(102, 102, 102)
            NewLabel.BackgroundTransparency = 0.850
            NewLabel.Position = UDim2.new(0, 0, 1.14298047e-07, 0)
            NewLabel.Size = UDim2.new(0, 505, 0, 28)
            NewLabel.ZIndex = 4
            NewLabel.AutoButtonColor = false
            NewLabel.Font = Enum.Font.Gotham
            NewLabel.Text = ""
            NewLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            NewLabel.TextSize = 14.000
            NewLabel.TextStrokeTransparency = 0.890
            NewLabel.TextXAlignment = Enum.TextXAlignment.Left
            
            UICorner_5.CornerRadius = UDim.new(0, 3)
            UICorner_5.Parent = NewLabel
            
            TextLabel_3.Parent = NewLabel
            TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_3.BackgroundTransparency = 1.000
            TextLabel_3.Position = UDim2.new(0.0171429012, 0, 0.25, 0)
            TextLabel_3.Size = UDim2.new(0, 487, 0, 15)
            TextLabel_3.ZIndex = 3
            TextLabel_3.RichText = true
            TextLabel_3.Font = Enum.Font.Gotham
            TextLabel_3.Text = "<b>" .. text .. "</b>"
            TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_3.TextSize = 15.000
            TextLabel_3.TextXAlignment = Enum.TextXAlignment.Center
        end
        function Tab:Seperator() 
            local NewSeperator = Instance.new("TextButton")
            local UICorner = Instance.new("UICorner")
            
            NewSeperator.Name = "NewSeperator"
            NewSeperator.Parent = ScrollingFrame
            NewSeperator.BackgroundColor3 = Color3.fromRGB(144, 144, 144)
            NewSeperator.BackgroundTransparency = 0.850
            NewSeperator.Position = UDim2.new(0, 0, 0.423221081, 0)
            NewSeperator.Size = UDim2.new(0, 505, 0, 5)
            NewSeperator.ZIndex = 4
            NewSeperator.AutoButtonColor = false
            NewSeperator.Font = Enum.Font.Gotham
            NewSeperator.Text = ""
            NewSeperator.TextColor3 = Color3.fromRGB(255, 255, 255)
            NewSeperator.TextSize = 14.000
            NewSeperator.TextStrokeTransparency = 0.890
            NewSeperator.TextXAlignment = Enum.TextXAlignment.Left
            
            UICorner.CornerRadius = UDim.new(0, 3)
            UICorner.Parent = NewSeperator
        end
        function Tab:Toggle(text, default, callback)
            local toggled = false

            local NewToggle = Instance.new("TextButton")
            local UICorner_12 = Instance.new("UICorner")
            local TextLabel_6 = Instance.new("TextLabel")
            local Frame_2 = Instance.new("Frame")
            local UICorner_13 = Instance.new("UICorner")
            local TextButton = Instance.new("TextButton")
            local UICorner_14 = Instance.new("UICorner")

            NewToggle.Name = "NewToggle"
            NewToggle.Parent = ScrollingFrame
            NewToggle.BackgroundColor3 = Color3.fromRGB(102, 102, 102)
            NewToggle.BackgroundTransparency = 0.850
            NewToggle.Position = UDim2.new(0.0476190485, 0, -0.00883380789, 0)
            NewToggle.Size = UDim2.new(0, 505, 0, 28)
            NewToggle.ZIndex = 4
            NewToggle.AutoButtonColor = false
            NewToggle.Font = Enum.Font.Gotham
            NewToggle.Text = ""
            NewToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
            NewToggle.TextSize = 14.000
            NewToggle.TextStrokeTransparency = 0.890
            NewToggle.TextXAlignment = Enum.TextXAlignment.Left

            UICorner_12.CornerRadius = UDim.new(0, 3)
            UICorner_12.Parent = NewToggle

            TextLabel_6.Parent = NewToggle
            TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_6.BackgroundTransparency = 1.000
            TextLabel_6.Position = UDim2.new(0.0171429012, 0, 0.25, 0)
            TextLabel_6.Size = UDim2.new(0, 385, 0, 15)
            TextLabel_6.ZIndex = 3
            TextLabel_6.Font = Enum.Font.Gotham
            TextLabel_6.Text = text
            TextLabel_6.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_6.TextSize = 15.000
            TextLabel_6.TextXAlignment = Enum.TextXAlignment.Left

            Frame_2.Parent = NewToggle
            Frame_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Frame_2.BackgroundTransparency = 0.750
            Frame_2.Position = UDim2.new(0.839603901, 0, 0, 0)
            Frame_2.Size = UDim2.new(0, 69, 0, 28)
            Frame_2.ZIndex = 9

            UICorner_13.CornerRadius = UDim.new(0, 3)
            UICorner_13.Parent = Frame_2

            TextButton.Parent = Frame_2
            TextButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            TextButton.Position = UDim2.new(0.144202918, 0, 0, 0)
            TextButton.Size = UDim2.new(0, 19, 0, 28)
            TextButton.ZIndex = 10
            TextButton.Font = Enum.Font.SourceSans
            TextButton.Text = " "
            TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextButton.TextSize = 14.000

            UICorner_14.CornerRadius = UDim.new(0, 3)
            UICorner_14.Parent = TextButton

            TextButton.MouseButton1Click:Connect(function()
                if toggled == true then
                    TextButton:TweenPosition(
                        UDim2.new(0.144202918, 0, 0, 0),
                        Enum.EasingDirection.Out,
                        Enum.EasingStyle.Quad,
                        .3,
                        false
                    )
                    TweenService:Create(
                        TextButton,
                        TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 = Color3.fromRGB(255, 0, 0)}
                    ):Play()
                else
                    TextButton:TweenPosition(
                        UDim2.new(0.550000012, 0, 0, 0),
                        Enum.EasingDirection.Out,
                        Enum.EasingStyle.Quad,
                        .3,
                        false
                    )
                    TweenService:Create(
                        TextButton,
                        TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 = Color3.fromRGB(59, 255, 0)}
                    ):Play()
                end
                toggled = not toggled
                pcall(callback, toggled)
            end)
            if default == true then
                TextButton:TweenPosition(
                    UDim2.new(0.144202918, 0, 0, 0),
                    Enum.EasingDirection.Out,
                    Enum.EasingStyle.Quad,
                    .3,
                    false
                )
                TweenService:Create(
                    TextButton,
                    TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 = Color3.fromRGB(255, 0, 0)}
                ):Play()
                toggled = not toggled
            end
        end
        function Tab:Slider(text, min, max, start, callback)
            local SliderFunc = {}
            local dragging = false
            local Slider = Instance.new("TextButton")
            local SliderTitle = Instance.new("TextLabel")
            local SliderFrame = Instance.new("Frame")
            local SliderFrameCorner = Instance.new("UICorner")
            local CurrentValueFrame = Instance.new("Frame")
            local CurrentValueFrameCorner = Instance.new("UICorner")
            local Zip = Instance.new("Frame")
            local ZipCorner = Instance.new("UICorner")
            local ValueBubble = Instance.new("Frame")
            local ValueBubbleCorner = Instance.new("UICorner")
            local SquareBubble = Instance.new("Frame")
            local GlowBubble = Instance.new("ImageLabel")
            local ValueLabel = Instance.new("TextLabel")


            Slider.Name = "Slider"
            Slider.Parent = ScrollingFrame
            Slider.BackgroundColor3 = Color3.fromRGB(102, 102, 102)
            Slider.BackgroundTransparency = 0.850
            Slider.BorderSizePixel = 0
            Slider.Position = UDim2.new(0, 0, 0.216560602, 0)
            Slider.Size = UDim2.new(0, 505, 0, 40)
            Slider.AutoButtonColor = false
            Slider.Font = Enum.Font.Gotham
            Slider.Text = ""
            Slider.TextColor3 = Color3.fromRGB(255, 255, 255)
            Slider.TextSize = 14.000

            SliderTitle.Name = "SliderTitle"
            SliderTitle.Parent = Slider
            SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderTitle.BackgroundTransparency = 1.000
            SliderTitle.Position = UDim2.new(0, 80, 0, -6)
            SliderTitle.Size = UDim2.new(0, 252.5, 0, 40)
            SliderTitle.Font = Enum.Font.Gotham
            SliderTitle.Text = text
            SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderTitle.TextSize = 15.000
            SliderTitle.TextXAlignment = Enum.TextXAlignment.Center

            SliderFrame.Name = "SliderFrame"
            SliderFrame.Parent = Slider
            SliderFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            SliderFrame.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
            SliderFrame.Position = UDim2.new(0.497999996, 0, 0.757000029, 0)
            SliderFrame.Size = UDim2.new(0, 385, 0, 8)

            SliderFrameCorner.Name = "SliderFrameCorner"
            SliderFrameCorner.Parent = SliderFrame

            CurrentValueFrame.Name = "CurrentValueFrame"
            CurrentValueFrame.Parent = SliderFrame
            CurrentValueFrame.BackgroundColor3 = Color3.fromRGB(57, 255, 43)
            CurrentValueFrame.Size = UDim2.new((start or 0) / max, 0, 0, 8)

            CurrentValueFrameCorner.Name = "CurrentValueFrameCorner"
            CurrentValueFrameCorner.Parent = CurrentValueFrame

            Zip.Name = "Zip"
            Zip.Parent = SliderFrame
            Zip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Zip.Position = UDim2.new((start or 0)/max, -6,-0.644999981, 0)
            Zip.Size = UDim2.new(0, 10, 0, 18)
            ZipCorner.CornerRadius = UDim.new(0, 3)
            ZipCorner.Name = "ZipCorner"
            ZipCorner.Parent = Zip

            ValueBubble.Name = "ValueBubble"
            ValueBubble.Parent = Zip
            ValueBubble.AnchorPoint = Vector2.new(0.5, 0.5)
            ValueBubble.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
            ValueBubble.Position = UDim2.new(0.5, 0, -1.00800002, 0)
            ValueBubble.Size = UDim2.new(0, 36, 0, 21)
            ValueBubble.Visible = false
            

            Zip.MouseEnter:Connect(function()
                if dragging == false then
                    ValueBubble.Visible = true
                end
            end)
            
            Zip.MouseLeave:Connect(function()
                if dragging == false then
                    ValueBubble.Visible = false
                end
            end)


            ValueBubbleCorner.CornerRadius = UDim.new(0, 3)
            ValueBubbleCorner.Name = "ValueBubbleCorner"
            ValueBubbleCorner.Parent = ValueBubble

            SquareBubble.Name = "SquareBubble"
            SquareBubble.Parent = ValueBubble
            SquareBubble.AnchorPoint = Vector2.new(0.5, 0.5)
            SquareBubble.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
            SquareBubble.BorderSizePixel = 0
            SquareBubble.Position = UDim2.new(0.493000001, 0, 0.637999971, 0)
            SquareBubble.Rotation = 45.000
            SquareBubble.Size = UDim2.new(0, 19, 0, 19)

            GlowBubble.Name = "GlowBubble"
            GlowBubble.Parent = ValueBubble
            GlowBubble.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            GlowBubble.BackgroundTransparency = 1.000
            GlowBubble.BorderSizePixel = 0
            GlowBubble.Position = UDim2.new(0, -15, 0, -15)
            GlowBubble.Size = UDim2.new(1, 30, 1, 30)
            GlowBubble.ZIndex = 0
            GlowBubble.Image = "rbxassetid://4996891970"
            GlowBubble.ImageColor3 = Color3.fromRGB(15, 15, 15)
            GlowBubble.ScaleType = Enum.ScaleType.Slice
            GlowBubble.SliceCenter = Rect.new(20, 20, 280, 280)

            ValueLabel.Name = "ValueLabel"
            ValueLabel.Parent = ValueBubble
            ValueLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ValueLabel.BackgroundTransparency = 1.000
            ValueLabel.Size = UDim2.new(0, 36, 0, 21)
            ValueLabel.Font = Enum.Font.Gotham
            ValueLabel.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
            ValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            ValueLabel.TextSize = 10.000
            local function move(input)
                local pos =
                    UDim2.new(
                        math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1),
                        -6,
                        -0.644999981,
                        0
                    )
                local pos1 =
                    UDim2.new(
                        math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1),
                        0,
                        0,
                        8
                    )
                CurrentValueFrame.Size = pos1
                Zip.Position = pos
                local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
                ValueLabel.Text = tostring(value)
                pcall(callback, value)
            end
            Zip.InputBegan:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true
                        ValueBubble.Visible = true
                    end
                end
            )
            Zip.InputEnded:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false
                        ValueBubble.Visible = false
                    end
                end
            )
            game:GetService("UserInputService").InputChanged:Connect(
            function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    move(input)
                end
            end
            )
            
            function SliderFunc:Change(tochange)
                CurrentValueFrame.Size = UDim2.new((tochange or 0) / max, 0, 0, 8)
                Zip.Position = UDim2.new((tochange or 0)/max, -6,-0.644999981, 0)
                ValueLabel.Text = tostring(tochange and math.floor((tochange / max) * (max - min) + min) or 0)
                pcall(callback, tochange)
            end
            
            return SliderFunc
            --[[local dragging = false

            local NewSlider = Instance.new("TextButton")
            local UICorner_6 = Instance.new("UICorner")
            local TextLabel_4 = Instance.new("TextLabel")
            local Slider = Instance.new("TextButton")
            local UICorner_7 = Instance.new("UICorner")
            local Pattern = Instance.new("ImageLabel")
            local UICorner_8 = Instance.new("UICorner")
            local Frame = Instance.new("TextButton")
            local UICorner_9 = Instance.new("UICorner")
            local lean = Instance.new("TextLabel")
            local SlideCircle = Instance.new("ImageButton")

            NewSlider.Name = "NewSlider"
            NewSlider.Parent = ScrollingFrame
            NewSlider.BackgroundColor3 = Color3.fromRGB(102, 102, 102)
            NewSlider.BackgroundTransparency = 0.850
            NewSlider.Position = UDim2.new(0, 0, 0.254258275, 0)
            NewSlider.Size = UDim2.new(0, 505, 0, 50)
            NewSlider.ZIndex = 4
            NewSlider.AutoButtonColor = false
            NewSlider.Font = Enum.Font.Gotham
            NewSlider.Text = ""
            NewSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
            NewSlider.TextSize = 14.000
            NewSlider.TextStrokeTransparency = 0.890
            NewSlider.TextXAlignment = Enum.TextXAlignment.Left

            UICorner_6.CornerRadius = UDim.new(0, 3)
            UICorner_6.Parent = NewSlider

            TextLabel_4.Parent = NewSlider
            TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_4.BackgroundTransparency = 1.000
            TextLabel_4.Position = UDim2.new(0.0171429012, 0, 0.129999995, 0)
            TextLabel_4.Size = UDim2.new(0, 487, 0, 17)
            TextLabel_4.ZIndex = 3
            TextLabel_4.Font = Enum.Font.Gotham
            TextLabel_4.Text = text
            TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_4.TextSize = 15.000
            TextLabel_4.TextXAlignment = Enum.TextXAlignment.Left

            Slider.Name = "Slider"
            Slider.Parent = NewSlider
            Slider.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
            Slider.BorderSizePixel = 0
            Slider.Position = UDim2.new(0.0158415847, 0, 0.649999976, 0)
            Slider.Size = UDim2.new((start or 0) / max, 0, 0, 5)
            Slider.ZIndex = 5

            UICorner_7.CornerRadius = UDim.new(0, 12)
            UICorner_7.Parent = Slider

            Pattern.Name = "Pattern"
            Pattern.Parent = Slider
            Pattern.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Pattern.BackgroundTransparency = 1.000
            Pattern.Position = UDim2.new(0.00160284271, 0, 0, 0)
            Pattern.Size = UDim2.new(0, 409, 0, 5)
            Pattern.ZIndex = 5
            Pattern.Image = "rbxassetid://300134974"
            Pattern.ImageTransparency = 0.600
            Pattern.ScaleType = Enum.ScaleType.Tile
            Pattern.SliceCenter = Rect.new(0, 256, 0, 256)
            Pattern.TileSize = UDim2.new(0, 30, 0, 30)

            UICorner_8.CornerRadius = UDim.new(0, 12)
            UICorner_8.Parent = Pattern

            Frame.Parent = NewSlider
            Frame.BackgroundColor3 = Color3.fromRGB(68, 255, 0)
            Frame.BorderSizePixel = 0
            Frame.Position = UDim2.new(0.0158415847, 0, 0.649999976, 0)
            Frame.Size = UDim2.new(0, 5, 0, 13)
            Frame.Text = ""
            Frame.ZIndex = 6
            Frame.AutoButtonColor = false

            UICorner_9.CornerRadius = UDim.new(0, 12)
            UICorner_9.Parent = Frame

            lean.Name = "lean"
            lean.Parent = NewSlider
            lean.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            lean.BackgroundTransparency = 1.000
            lean.Position = UDim2.new(0.845544577, 0, 0.469999999, 0)
            lean.Size = UDim2.new(0, 67, 0, 20)
            lean.Font = Enum.Font.Gotham
            lean.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
            lean.TextColor3 = Color3.fromRGB(255, 255, 255)
            lean.TextSize = 16.000

            Frame.MouseButton1Down:Connect(function()
                dragging = true
            end)

            UIS.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)

            UIS.InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    if dragging == true then
                        local mouseLoc = UIS:GetMouseLocation()
                        local relativePos = mouseLoc - Slider.AbsolutePosition
                        local percentage = math.clamp(relativePos.X/Slider.AbsolutePosition.X,0,1)

                        Frame.Position = UDim2.new(percentage, 0, 1, 0)

                    end
                end
            end)]]
            -- stolen from random utoob vid
        end
        function Tab:Textbox(text, disapper, callback)
            local NewBox = Instance.new("TextButton")
            local UICorner_10 = Instance.new("UICorner")
            local TextLabel_5 = Instance.new("TextLabel")
            local TextBox = Instance.new("TextBox")
            local UICorner_11 = Instance.new("UICorner")

            NewBox.Name = "NewBox"
            NewBox.Parent = ScrollingFrame
            NewBox.BackgroundColor3 = Color3.fromRGB(102, 102, 102)
            NewBox.BackgroundTransparency = 0.850
            NewBox.Position = UDim2.new(0, 0, 1.14298047e-07, 0)
            NewBox.Size = UDim2.new(0, 505, 0, 28)
            NewBox.ZIndex = 4
            NewBox.AutoButtonColor = false
            NewBox.Font = Enum.Font.Gotham
            NewBox.Text = ""
            NewBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            NewBox.TextSize = 14.000
            NewBox.TextStrokeTransparency = 0.890
            NewBox.TextXAlignment = Enum.TextXAlignment.Left
            
            UICorner_10.CornerRadius = UDim.new(0, 3)
            UICorner_10.Parent = NewBox
            
            TextLabel_5.Parent = NewBox
            TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_5.BackgroundTransparency = 1.000
            TextLabel_5.Position = UDim2.new(0.0171429012, 0, 0.25, 0)
            TextLabel_5.Size = UDim2.new(0, 385, 0, 15)
            TextLabel_5.ZIndex = 3
            TextLabel_5.Font = Enum.Font.Gotham
            TextLabel_5.Text = text
            TextLabel_5.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_5.TextSize = 15.000
            TextLabel_5.TextXAlignment = Enum.TextXAlignment.Left
            
            TextBox.Parent = NewBox
            TextBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            TextBox.BackgroundTransparency = 0.750
            TextBox.Position = UDim2.new(0.779519141, 0, 0, 0)
            TextBox.Size = UDim2.new(0, 100, 0, 28)
            TextBox.ZIndex = 7
            TextBox.Font = Enum.Font.Garamond
            TextBox.Text = ""
            TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextBox.TextSize = 14.000
            
            UICorner_11.CornerRadius = UDim.new(0, 3)
            UICorner_11.Parent = TextBox

            TextBox.FocusLost:Connect(
                function(ep)
                    if ep then
                        if #TextBox.Text > 0 then
                            pcall(callback, TextBox.Text)
                            if disapper then
                                TextBox.Text = ""
                            end
                        end
                    end
                end
            )
        end
        for i, v in pairs(Deglazifier:GetChildren()) do
            if v.Name == "ScrollingFrame" then
                v.Visible = false
            end
            ScrollingFrame.Visible = true
        end
        function Tab:DestroyDropdowns()
            for i, v in pairs(ScrollingFrame:GetChildren()) do
                if v.Name == "NewDropdown" then
                    v:Destroy()
                end
            end
        end
        function Tab:Dropdown(text, list, callback)
            local dropped = false

            local NewDropdown = Instance.new("TextButton")
            local UICorner_18 = Instance.new("UICorner")
            local TextLabel_8 = Instance.new("TextLabel")
            local keyboard_arrow_down = Instance.new("ImageButton")
            local ItemHolder = Instance.new("ScrollingFrame")
            local UIListLayout_3 = Instance.new("UIListLayout")

            NewDropdown.Name = "NewDropdown"
            NewDropdown.Parent = ScrollingFrame
            NewDropdown.BackgroundColor3 = Color3.fromRGB(102, 102, 102)
            NewDropdown.BackgroundTransparency = 0.850
            NewDropdown.Position = UDim2.new(0.0133333337, 0, -0.00530023919, 0)
            NewDropdown.Size = UDim2.new(0, 505, 0, 28)
            NewDropdown.ZIndex = 4
            NewDropdown.AutoButtonColor = false
            NewDropdown.Font = Enum.Font.Gotham
            NewDropdown.Text = ""
            NewDropdown.ClipsDescendants = true
            NewDropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
            NewDropdown.TextSize = 14.000
            NewDropdown.TextStrokeTransparency = 0.890
            NewDropdown.TextXAlignment = Enum.TextXAlignment.Left
            
            UICorner_18.CornerRadius = UDim.new(0, 3)
            UICorner_18.Parent = NewDropdown
            
            TextLabel_8.Parent = NewDropdown
            TextLabel_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_8.BackgroundTransparency = 1.000
            TextLabel_8.Position = UDim2.new(0.0171429012, 0, 0.25, 0)
            TextLabel_8.Size = UDim2.new(0, 453, 0, 15)
            TextLabel_8.ZIndex = 3
            TextLabel_8.Font = Enum.Font.Gotham
            TextLabel_8.Text = text
            TextLabel_8.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_8.TextSize = 15.000
            TextLabel_8.TextXAlignment = Enum.TextXAlignment.Left
            
            keyboard_arrow_down.Name = "keyboard_arrow_down"
            keyboard_arrow_down.Parent = NewDropdown
            keyboard_arrow_down.BackgroundTransparency = 1.000
            keyboard_arrow_down.LayoutOrder = 14
            keyboard_arrow_down.Position = UDim2.new(0.939999998, 0, 0.0714285672, 0)
            keyboard_arrow_down.Size = UDim2.new(0, 25, 0, 25)
            keyboard_arrow_down.ZIndex = 2
            keyboard_arrow_down.Image = "rbxassetid://6034818375"
            keyboard_arrow_down.ImageRectOffset = Vector2.new(0, 0)
            keyboard_arrow_down.ImageRectSize = Vector2.new(0, 0)
            
            ItemHolder.Name = "ItemHolder"
            ItemHolder.Parent = ScrollingFrame
            ItemHolder.Active = true
            ItemHolder.BackgroundColor3 = Color3.fromRGB(102, 102, 102)
            ItemHolder.BackgroundTransparency = 0.930
            ItemHolder.Position = UDim2.new(0, 0, 1.00000107, 0)
            ItemHolder.Size = UDim2.new(0, 0, 0, 0)
            ItemHolder.BorderSizePixel = 0
            ItemHolder.AutomaticCanvasSize = "Y"
            ItemHolder.ScrollBarImageColor3 = Color3.fromRGB(6, 93, 0)
            ItemHolder.ScrollBarThickness = 8
            ItemHolder.MidImage = "rbxassetid://2282042316"
            ItemHolder.BottomImage = "rbxassetid://2282042316"
            ItemHolder.TopImage = "rbxassetid://2282042316"
            
            UIListLayout_3.Parent = ItemHolder
            UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
            UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_3.Padding = UDim.new(0, 3)
            
            keyboard_arrow_down.MouseButton1Click:Connect(
                function()
                    if dropped == false then
                        ItemHolder:TweenSize(
                            UDim2.new(0, 505, 0, 154),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quart,
                            .2,
                            true
                        )
                        TweenService:Create(
                            keyboard_arrow_down,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Rotation = 270}
                        ):Play()
                    else
                        ItemHolder:TweenSize(
                            UDim2.new(0, 0, 0, 0),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quart,
                            .2,
                            true
                        )
                        TweenService:Create(
                            keyboard_arrow_down,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Rotation = 0}
                        ):Play()
                    end
                    dropped = not dropped
                end
            )

            for i, v in next, list do
                local NewItem = Instance.new("TextButton")
                local UICorner_19 = Instance.new("UICorner")
                local TextLabel_9 = Instance.new("TextLabel")

                NewItem.Name = "NewItem"
                NewItem.Parent = ItemHolder
                NewItem.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                NewItem.BackgroundTransparency = 0.950
                NewItem.Position = UDim2.new(0.0138613861, 0, 0, 0)
                NewItem.Size = UDim2.new(0, 491, 0, 28)
                NewItem.Font = Enum.Font.SourceSans
                NewItem.Text = " "
                NewItem.Visible = true
                NewItem.TextColor3 = Color3.fromRGB(0, 0, 0)
                NewItem.TextSize = 14.000
                
                UICorner_19.CornerRadius = UDim.new(0, 3)
                UICorner_19.Parent = NewItem
                
                TextLabel_9.Parent = NewItem
                TextLabel_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_9.BackgroundTransparency = 1.000
                TextLabel_9.Size = UDim2.new(0, 485, 0, 28)
                TextLabel_9.Font = Enum.Font.Gotham
                TextLabel_9.Text = v
                TextLabel_9.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_9.TextSize = 14.000

                NewItem.MouseEnter:Connect(
                    function()
                        TweenService:Create(
                            NewItem,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundTransparency = 0.910}
                        ):Play()
                    end
                )

                NewItem.MouseLeave:Connect(
                    function()
                        TweenService:Create(
                            NewItem,
                            TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundTransparency = 0.950}
                        ):Play()
                    end
                )

                NewItem.MouseButton1Click:Connect(
                    function()
                        dropped = not dropped
                        TextLabel_8.Text = text .. " - " .. v
                        pcall(callback, v)
                        ItemHolder:TweenSize(
                            UDim2.new(0, 0, 0, 0),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quart,
                            .2,
                            true
                        )
                        TweenService:Create(
                            keyboard_arrow_down,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Rotation = 0}
                        ):Play()
                        wait(.2)
                    end
                )
            end
        end
        
        return Tab;
    end

    return Window;
end 

return Library;
