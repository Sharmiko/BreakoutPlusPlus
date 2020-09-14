Brick = Object:extend()


--[[
    Initialize brick object 
    Parameters:
        x (number) - x coordinate of brick
        y (number) - y coordinate of brick
        width (number) - width of brick
        height (number) - height of brick
        hits (number) - number of hits remaining before brick breaks
                        0 indicates broken brick
--]]
function Brick:new(x, y, width, height, hits)
    self.x = x
    self.y = y 
    self.width = width 
    self.height = height 
    self.hits = hits 
end 


--[[
    Draw brick if it is not broken
--]]
function Brick:draw()
    if (self.hits > 0)
    then 
        love.graphics.setColor(226 / 255, 125 / 255, 96 / 255)
        love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
        love.graphics.setColor(1, 1, 1)
    end 
end 