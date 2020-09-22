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
    self.colors = {}
    self.colors[0] = {232, 168, 124}
    self.colors[1] = {195, 141, 158}
    self.lineWidth = 1
end 


--[[
    Draw brick if it is not broken
--]]
function Brick:draw()
    if (self.hits > 0)
    then 
        local color = self.colors[self.hits - 1]
        love.graphics.setColor(0, 0, 0)
        love.graphics.setLineWidth(self.lineWidth)
        love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
        love.graphics.setColor(color[1] / 255, color[2] / 255, color[3] / 255)
        love.graphics.rectangle("fill", self.x + self.lineWidth, self.y, 
            self.width - self.lineWidth, self.height - self.lineWidth)
        love.graphics.setColor(1, 1, 1)
    end 
end 