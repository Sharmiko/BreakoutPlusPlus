Ball = Object:extend()

--[[ 
    Ball constructor
]]
function Ball:new()
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() - 50
    self.radius = 9
    self.dx = 200
    self.dy = 200
    self.offset = 5
end 


--[[ 
    Function that draws a ball
]]
function Ball:draw()
    local color = Colors["ballColor"]
    love.graphics.setColor(color[1], color[2], color[3])
    love.graphics.circle("fill", self.x, self.y, self.radius)
    love.graphics.setColor(1, 1, 1)
end 


--[[ 
    Function that updates ball position
     and checks for collisions
]]
function Ball:update(dt)
    self.x = self.x + self.dx * dt 
    self.y = self.y + self.dy * dt
end 

