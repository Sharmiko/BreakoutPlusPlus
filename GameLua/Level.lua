Level = Object:extend()


function Level:new()
    self.levels = {
        x = 75,
        y = 0,
        width = 80,
        height = 60,
        padding = 80,
        startPaddingX = 20,
        startPaddingY = 15,
        array = {
            level_1 = {
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
            x = 0,
            y = 0,
            text = "Level 1",
            stars = 3,
            taken = 0
        },
        buttonPositions = {},
        hoverPadding = 10
    }
    
    for i = 1, self:numLevels()
    do 
        if (i % 4 == 0)
        then
            self.levels["y"] = self.levels["y"] + self.levels["height"] + self.levels["padding"]
        end 
        table.insert(self.levels["buttonPositions"], {self.levels["x"], self.levels["y"] + self.levels["padding"]})
        self.levels["x"] = self.levels["x"] + self.levels["width"] + self.levels["padding"]
    end 
end 


function Level:drawLevelButtons()
    for key in pairs(self.levels["array"])
    do
        local level = self.levels["array"][key]
        self:drawLevelButton(level["x"])
    end
end 


function Level:drawLevelButton(x, y, width, height, text, fontSize, padding)
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle(x - padding, y - padding, width + 2 * padding, height + 2 * padding)
    font = love.graphics.newFont(fontSize)
    textWidth = font:getWidth()
    love.graphics.print(text, x + width / 2 - textWidth / 2, y + height / 4)
end 

function Level:numLevels()
    local count = 0
    for _ in pairs(self.levels["array"]) 
    do 
        count = count + 1
    end 

    return count
end