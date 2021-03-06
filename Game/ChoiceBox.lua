ChoiceBox = Object:extend()

--[[ 
    ChoiceBox constructor
    Parameters:
        type (str) - type of choicebox "win" or "lose"
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


--[[
    Function that creates buttons for choice box depending
    on the type of it
]]
function ChoiceBox:initButtons()
    local backToMenuButton = Button(self.border.x, self.border.y + 150, 140, 70, "< back to Menu!", {1, 1, 1}, 16, 0)
    backToMenuButton.onClickFunction = function() 
        stateMachine:change('menu') 
    end

    local restartButton = Button(nil, self.border.y + 150, 140, 70, "Restart!", {1, 1, 1}, 16, 0)
    restartButton.onClickFunction = function()
        Utils:resetGame()
        bricks = Bricks(LevelsState():getLevelData(gCurrentLevel))
        stateMachine:change('serve', bricks)
    end

    -- "lose" buttons - back to menu and restart button
    if self.type == 'lose'
    then  
        backToMenuButton.x = backToMenuButton.x + 50
        restartButton.x = self.border.x + self.border.width - 50 - backToMenuButton.width

        table.insert(self.buttonList, backToMenuButton)
        table.insert(self.buttonList, restartButton)

        self.text.text = 'You Lost!'
        self.textColor = Colors["gameOverTextColor"]

    -- "win" buttons - back to menu, restart and next level button
    elseif self.type == 'win'
    then
        backToMenuButton.x = backToMenuButton.x + 25
        restartButton.x = backToMenuButton.x + backToMenuButton.width + 15


        local totalLevels = LevelsState():numLevels()
        -- display next level button if next level exists
        if gCurrentLevel ~= totalLevels
        then
            local nextLevel = Button(self.border.x + self.border.width - 25 - backToMenuButton.width, 
                self.border.y + 150, 140, 70, "Next Level >", {1, 1, 1}, 16, 0)
            nextLevel.onClickFunction = function()
                    Utils:resetGame()
                    gCurrentLevel = gCurrentLevel + 1
                    bricks = Bricks(LevelsState():getLevelData(gCurrentLevel))
                    stateMachine:change('serve', bricks)
            end
            table.insert(self.buttonList, nextLevel)
        end  

        self.text.text = 'You Win!'
        self.textColor = Colors["winTextColor"]
    
    -- pause menu - back to menu, restart and resume button
    elseif self.type == 'pause'
    then
        backToMenuButton.x = backToMenuButton.x + 25
        restartButton.x = backToMenuButton.x + backToMenuButton.width + 15

        local resume = Button(self.border.x + self.border.width - 25 - backToMenuButton.width, 
            self.border.y + 150, 140, 70, "Resume", {1, 1, 1}, 16, 0)
        resume.onClickFunction = function()
            stateMachine:change(gCurrentState, bricks)
        end
        table.insert(self.buttonList, backToMenuButton)
        table.insert(self.buttonList, restartButton)
        table.insert(self.buttonList, resume)
        
        self.textColor = {0, 0, 0}
        self.text.text = 'Game Paused'
    end 
end 


--[[ 
    Function that draws buttons
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


--[[
    Function that updates state of buttons
]]
function ChoiceBox:update(dt)
    for key, value in ipairs(self.buttonList)
    do
        if value:update()
        then
            break
        end 
    end 
end 
