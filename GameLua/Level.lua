require "Button"


Level = Object:extend()


--[[
    Level constructor
    - initialize level buttons and it's coordinates
--]]
function Level:new()
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
        }
    }

    self:initLevels()
end 


--[[
    Draw every level button on the screen
--]]
function Level:draw()
    for i = 1, self:numLevels()
    do 
        self.levels[i]["button"]:drawButton()
    end 
end 


--[[
    Initialize level button coordinates
--]]
function Level:initLevels()
    local buttonX = 75
    local buttonY = 0
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
--]]
function Level:numLevels()
    local count = 0
    for _ in pairs(self.levels) 
    do 
        count = count + 1
    end 

    return count
end