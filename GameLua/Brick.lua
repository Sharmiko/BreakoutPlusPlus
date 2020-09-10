Brick = Object:extend()


function Brick:new(x, y, width, height, hits)
    self.x = x
    self.y = y 
    self.width = width 
    self.height = height 
    self.hits = hits 
end 


function Brick:draw()
    if (self.hits > 0)
    then 
        love.graphics.setColor(226 / 255, 125 / 255, 96 / 255)
        love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
        love.graphics.setColor(1, 1, 1)
    end 
end 


function Brick:update()
    if (self.hits == 0)
    then
        -- remove brick
    else
        -- brick stays
    end 
end 

