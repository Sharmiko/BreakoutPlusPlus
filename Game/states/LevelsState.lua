LevelsState = BaseState:extend()


--[[
    Level constructor
    - initialize level buttons and it's coordinates
]]
function LevelsState:new()
    self.levelButtons = {}
    self.backButton = Button(25, 25, 100, 40, "< back", {99, 96, 88}, 18, 0,
        function() stateMachine:change('menu') end)
    self:initLevels()
end 


--[[
    Draw every level button on the screen
]]
function LevelsState:draw()
    self.backButton:draw()
    for i = 1, self:numLevels()
    do 
        self.levelButtons[i]:draw()
    end 
end 


--[[
    Function that updates (scales) buttons depending on
    mouse interaction
]]
function LevelsState:update()
    local cursor = love.mouse.getSystemCursor("hand")

    for i=1, #self.levelButtons
    do
        if self.levelButtons[i]:update() or self.backButton:update()
        then
            break
        end
    end 
end 


--[[
    Initialize level button coordinates
]]
function LevelsState:initLevels()
    local originalX = 175
    local buttonX = 175
    local buttonY = 80
    local buttonWidth = 100
    local buttonHeight = 70
    local buttonPadding = 80
    local textColor = {99, 96, 88}

    for i = 1, self:numLevels() 
    do 
        if (i % 4 == 0)
        then
            buttonY = buttonY + buttonHeight + buttonPadding
            buttonX = originalX
        end 
        table.insert(self.levelButtons, Button(buttonX, buttonY, buttonWidth, buttonHeight, " Level "..i.."\nScore: 0", textColor, 17, 0, self:onLevelClick(i)))
        buttonX = buttonX + buttonWidth + buttonPadding
    end 
end 


function LevelsState:onLevelClick(idx)
    return function()
        love.mouse.setCursor()
        bricks = Bricks(self:getLevelData(idx))
        gCurrentLevel = idx
        Utils:resetGame()
        gInfoBar.currentScore = 0
        gCurrentState = 'serve'
        stateMachine:change('serve', bricks)
    end 
end 


--[[
    Helper function that returns number of levels
    Returns:
        int - number of levels
]]
function LevelsState:numLevels()
    local count = 0
    local files = love.filesystem.getDirectoryItems('data/levels/')
    for k, file in ipairs(files) 
    do
        count = count + 1
    end 

    return count 
end


--[[
    Function that reads n level from text file
    and return table representation of it
]]
function LevelsState:getLevelData(level)
    local levelData = {}

    for data in love.filesystem.lines('data/levels/level_'..level..'.txt')
    do 
        local temp = {}
        for i in string.gmatch(data, '%S+')
        do 
            table.insert(temp, tonumber(i))
        end 

        table.insert(levelData, temp)
    end 

    return levelData
end 


