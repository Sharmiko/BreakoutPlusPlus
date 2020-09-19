Paddle = Object:extend()


--[[ Paddle constructor

--]]
function Paddle:new()
    Paddle.super.new(self)
    self.width = 120 
    self.height = 10 
    self.x = love.graphics.getWidth() / 2 - self.width / 2
    self.y = love.graphics.getHeight() - self.height * 4
    self.radius = 4
    self.speed = 600
end 


--[[ Function that draws a paddle

--]]
function Paddle:draw()
    love.graphics.setColor(226/255, 125/255, 96/255)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height, self.radius)
    love.graphics.setColor(1, 1, 1)
end


--[[ Function that moves paddle using left and right
     arrow keys
--]]
function Paddle:update(dt)
    if love.keyboard.isDown("right") then 
        -- check for right wall collision
        if self.x + self.width <= love.graphics.getWidth() 
        then 
            self.x = self.x + self.speed * dt 
        end 
    elseif love.keyboard.isDown("left") 
    then
        -- check for left wall collision 
        if self.x >= 0 
        then 
            self.x = self.x - self.speed * dt 
        end 
    end 
end 
