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
        local backToMenuButton = Button(self.border.x + 50, self.border.y + 150, 140, 70, "< back to Menu!", {1, 1, 1}, 16, 0)
        local restartButton = Button(self.border.x + self.border.width - 50 - backToMenuButton.width, self.border.y + 150, 140, 70, "Restart!", {1, 1, 1}, 16, 0)
        table.insert(self.buttonList, backToMenuButton)
        table.insert(self.buttonList, restartButton)
        self.text.text = 'You Lost!'
        self.textColor = Colors["gameOverTextColor"]
    elseif self.type == 'win'
    then
        local backToMenuButton = Button(self.border.x + 25, self.border.y + 150, 140, 70, "< back to Menu!", {1, 1, 1}, 16, 0)
        local restartButton = Button(backToMenuButton.x + backToMenuButton.width + 15, self.border.y + 150, 140, 70, "Restart!", {1, 1, 1}, 16, 0)
        local nextLevel = Button(self.border.x + self.border.width - 25 - backToMenuButton.width, self.border.y + 150, 140, 70, "Next Level >", {1, 1, 1}, 16, 0)
        table.insert(self.buttonList, backToMenuButton)
        table.insert(self.buttonList, restartButton)
        table.insert(self.buttonList, nextLevel)
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
    if self.type == 'lose'
    then
        self:updateLose()
    elseif self.type == 'win'
    then 
        self:updateWin()
    end
end 

--[[ 

]]
function ChoiceBox:updateLose(dt)
    local cursor = love.mouse.getSystemCursor("hand")
    for idx, button in pairs(self.buttonList)
    do
        if button:isHover()
        then
            if (love.mouse.isDown(1))
            then
                if idx == 1
                then
                    Utils:resetGame()
                    stateMachine:change('menu')
                elseif idx == 2
                then 
                    Utils:resetGame()
                    bricks = Bricks(LevelsState():getLevelData(gCurrentLevel))
                    stateMachine:change('serve', bricks)
                end
            end 
            button.padding = 10
            love.mouse.setCursor(cursor)
            break 
        else
            love.mouse.setCursor()
            button.padding = 0
        end 
    end 
end 


--[[

]]
function ChoiceBox:updateWin(dt)

end 