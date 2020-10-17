ChoiceBox = Object:extend()

--[[ 
    ChoiceBox constructor
]]
function ChoiceBox:new(type)
    local borderWidth = 500
    local borderHeight = 300
    self.border = {
        x = love.graphics.getWidth() / 2 - borderWidth / 2,
        y = love.graphics.getHeight() / 2 - 100,
        width = borderWidth,
        height = borderHeight
    }
    self.text = Text(self.border.x + self.border.width / 2, self.border.y + 50, nil, 24)
    self.textColor = nil
    self.buttonList = {}
    self.type = type 

    self:initButtons()
end 


function ChoiceBox:initButtons()
    if self.type == 'lose'
    then  
        local backToMenuButton = Button(self.border.x + 50, self.border.y + 150, 140, 70, "< back to Menu!", {1, 1, 1}, 16, 0,
            function() stateMachine:change('menu') end)
        local restartButton = Button(self.border.x + self.border.width - 50 - backToMenuButton.width, self.border.y + 150, 140, 70, "Restart!", {1, 1, 1}, 16, 0,
            function()
                Utils:resetGame()
                bricks = Bricks(LevelsState():getLevelData(gCurrentLevel))
                stateMachine:change('serve', bricks)
            end)
        table.insert(self.buttonList, backToMenuButton)
        table.insert(self.buttonList, restartButton)
        self.text.text = 'You Lost!'
        self.textColor = Colors["gameOverTextColor"]
    elseif self.type == 'win'
    then
        local backToMenuButton = Button(self.border.x + 25, self.border.y + 150, 140, 70, "< back to Menu!", {1, 1, 1}, 16, 0,
            function() stateMachine:change('menu') end)
        local restartButton = Button(backToMenuButton.x + backToMenuButton.width + 15, self.border.y + 150, 140, 70, "Restart!", {1, 1, 1}, 16, 0,
            function()
                Utils:resetGame()
                bricks = Bricks(LevelsState():getLevelData(gCurrentLevel))
                stateMachine:change('serve', bricks)
            end)
        table.insert(self.buttonList, backToMenuButton)
        table.insert(self.buttonList, restartButton)

        local totalLevels = LevelsState():numLevels()
        if gCurrentLevel ~= totalLevels
        then
            local nextLevel = Button(self.border.x + self.border.width - 25 - backToMenuButton.width, self.border.y + 150, 140, 70, "Next Level >", {1, 1, 1}, 16, 0,
                function()
                    Utils:resetGame()
                    gCurrentLevel = gCurrentLevel + 1
                    bricks = Bricks(LevelsState():getLevelData(gCurrentLevel))
                    stateMachine:change('serve', bricks)
                end)
            table.insert(self.buttonList, nextLevel)
        end  
        self.text.text = 'You Win!'
        self.textColor = Colors["winTextColor"]
    end 
end 


--[[ 

]]
function ChoiceBox:draw()
    for i=1, #(self.buttonList)
    do
        self.buttonList[i]:draw()
    end 
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("line", self.border.x, self.border.y, self.border.width, self.border.height)
    love.graphics.setColor(self.textColor)
    self.text:draw()
end 


function ChoiceBox:update(dt)
    for key, value in ipairs(self.buttonList)
    do
        if value:update()
        then
            break
        end 
    end 
end 
