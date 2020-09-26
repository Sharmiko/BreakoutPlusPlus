require "Brick"

Bricks = Object:extend()


--[[
    Initialize Bricks object
    Parameters:
        array (table) - brick location array
--]]
function Bricks:new(array)
    self.width = 95
    self.height = 18
    self.startX = 2.5
    self.startY = 40 + 2.5
    self.paddingX = 5
    self.paddingY = 5
    self.rows = 10
    self.columns = 8
    self.hits = nil
    self.array = self:initBricks(array) 
end


--[[
    Draw every brick
--]]
function Bricks:draw()
    for i in pairs(self.array)
    do 
        self.array[i]:draw()
    end 
end 


--[[
    Function that initializes bricks, computing
    x and y coordinate of each birck and separation
    between them
--]]
function Bricks:initBricks(array)
    local bricks = {}
    local x = self.startX
    local y = self.startY

    for i = 1, self.rows
    do 
        for k = 1, self.columns
        do 
            local brick = Brick(x, y, self.width, self.height, array[i][k])
            table.insert(bricks, brick)
            x = x + self.width + self.paddingX
        end 
        x = self.startX 
        y = y + self.height + self.paddingY 
    end 
    return bricks
end 