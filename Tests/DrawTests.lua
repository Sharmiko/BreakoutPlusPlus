DrawTests = Object:extend()


function DrawTests:new()
    self.width = 120 
    self.height = 40
    self.x = love.graphics.getWidth() / 2 - self.width / 2
    self.y = love.graphics.getHeight() - self.height * 4
    self.speed = 600
end 


function DrawTests:update(dt)

end 


function DrawTests:draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height, 4)
    love.graphics.setColor(226/255, 125/255, 96/255)
    love.graphics.rectangle("fill", self.x + 1, self.y + 1, self.width - 1, self.height - 1, 4)
end 

