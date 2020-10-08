LevelsState = BaseState:extend()


--[[
    Level constructor
    - initialize level buttons and it's coordinates
]]
function LevelsState:new()
    self.levels = {
        {
            arr = {
                {1, 1, 1, 0, 0, 1, 1, 1},
                {1, 1, 1, 0, 0, 1, 1, 1},
                {1, 1, 1, 0, 0, 1, 1, 1},
                {1, 1, 1, 0, 0, 1, 1, 1},
                {1, 1, 1, 0, 0, 1, 1, 1},
                {1, 1, 1, 0, 0, 1, 1, 1},
                {0, 0, 0, 0, 0, 0, 0, 0},
                {0, 0, 0, 0, 0, 0, 0, 0},
                {1, 1, 1, 1, 1, 1, 1, 1},
                {1, 1, 1, 1, 1, 1, 1, 1}
            },
            button = nil
        },
        {
            arr = {
                {1, 0, 1, 0, 0, 1, 0, 1},
                {1, 0, 1, 0, 0, 1, 0, 1},
                {1, 1, 1, 0, 0, 1, 1, 1},
                {1, 1, 1, 0, 0, 1, 1, 1},
                {1, 0, 1, 0, 0, 1, 0, 1},
                {1, 0, 1, 0, 0, 1, 0, 1},
                {0, 0, 0, 0, 0, 0, 0, 0},
                {0, 1, 1, 1, 1, 1, 1, 0},
                {0, 0, 0, 1, 1, 0, 0, 0},
                {0, 1, 1, 1, 1, 1, 1, 0}
            },
            button = nil
        },
        {
            arr = {
                {1, 1, 0, 0, 0, 0, 1, 1},
                {2, 2, 0, 1, 1, 0, 2, 2},
                {0, 0, 0, 2, 2, 0, 0, 0},
                {1, 1, 0, 0, 0, 0, 1, 1},
                {2, 2, 0, 1, 1, 0, 2, 2},
                {0, 0, 0, 2, 2, 0, 0, 0},
                {1, 1, 0, 0, 0, 0, 1, 1},
                {2, 2, 0, 1, 1, 0, 2, 2},
                {0, 0, 0, 2, 2, 0, 0, 0},
                {0, 0, 0, 0, 0, 0, 0, 0}
            },
            button = nil
        }
    }

    self.soundPlayed = 0
    self.sounds = Sounds()
    self.backButton = Button(25, 25, 100, 40, "< back", {99, 96, 88}, 18, 0)
    self:initLevels()
end 


--[[
    Draw every level button on the screen
]]
function LevelsState:draw()
    self.backButton:draw()
    for i = 1, self:numLevels()
    do 
        self.levels[i]["button"]:draw()
    end 
end 


--[[
    Function that updates (scales) buttons depending on
    mouse interaction
]]
function LevelsState:update()
    local cursor = love.mouse.getSystemCursor("hand")
    local hovered = false 

    for i in pairs(self.levels)
    do
        if (self.levels[i]["button"]:isHover())
        then
            hovered = true 
            if self.soundPlayed == 0
            then
                self.soundPlayed = 1
            end 

            if self.soundPlayed == 1
            then 
                self.sounds.buttonHover:play()
                self.soundPlayed = 2
            end 

            love.mouse.setCursor(cursor)
            if (love.mouse.isDown(1))
            then 
                love.mouse.setCursor()
                bricks = Bricks(self.levels[i]["arr"])
                stateMachine:change('game', bricks)
            else
                self.levels[i]["button"].padding = 10
            end 
            break 
        else
            love.mouse.setCursor()
            self.levels[i]["button"].padding = 0
        end
    end 

    if not hovered
    then
        self.soundPlayed = 0
        love.mouse.setCursor()

    end 
end 


--[[
    Initialize level button coordinates
]]
function LevelsState:initLevels()
    local buttonX = 175
    local buttonY = -80
    local buttonWidth = 80
    local buttonHeight = 60
    local buttonPadding = 80
    local textColor = {99, 96, 88}
    for i = 1, self:numLevels() 
    do 
        if (i - 1 % 4 == 0)
        then
            buttonY = buttonY + buttonHeight + buttonPadding
        end 
        self.levels[i]["button"] = Button(buttonX, buttonY, buttonWidth, buttonHeight, "Level "..i, textColor, 17, 0)
        buttonX = buttonX + buttonWidth + buttonPadding
    end 
end 


--[[
    Helper function that returns number of levels
    Returns:
        int - number of levels
]]
function LevelsState:numLevels()
    local count = 0
    for _ in pairs(self.levels) 
    do 
        count = count + 1
    end 

    return count
end

