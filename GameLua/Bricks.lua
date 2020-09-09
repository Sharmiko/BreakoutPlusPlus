require "Brick"

Bricks = Object:extend()


function Bricks:new(array)
    self.width = 95
    self.height = 18
    self.startX = 2.5
    self.startY = 2.5
    self.startPaddingX = 15
    self.startPaddingY = 10
    self.paddingX = 5
    self.paddingY = 5
    self.rows = 10
    self.columns = 8
    self.total = nil
    self.array = self:initBricks(array) 
end


function Bricks:draw()
    for i in pairs(self.array)
    do 
        self.array[i]:draw()
    end 
end 


function Bricks:update()


end 


function Bricks:initBricks(array)
    local bricks = {}
    local x = self.startX
    local y = self.startY

    for i = 1, self.rows
    do 
        for k = 1, self.columns
        do 
            brick = Brick(x, y, self.width, self.height, array[i][k])
            table.insert(bricks, brick)
            x = x + self.width + self.paddingX
        end 
        x = self.startX 
        y = y + self.height + self.paddingY 
    end 
    return bricks
end 

function Bricks:drawBricks()

end 