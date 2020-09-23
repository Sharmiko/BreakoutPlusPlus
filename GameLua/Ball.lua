Ball = Object:extend()

--[[ Ball constructor

--]]
function Ball:new()
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    self.radius = 9
    self.dx = 150
    self.dy = 150
    self.offset = 5
end 


--[[ Function that drwas a ball

--]]
function Ball:draw()
    love.graphics.setColor(65/255, 179/255, 163/255)
    love.graphics.circle("fill", self.x, self.y, self.radius)
    love.graphics.setColor(1, 1, 1)
end 


--[[ Function that updates ball position
     and checks for collisions
--]]
function Ball:update(dt, paddle)
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt 
end 
