Paddle = Object:extend()

function Paddle:new()
    Paddle.super.new(self)
    self.width = 120 
    self.height = 20 
    self.x = love.graphics.getWidth() / 2 - self.width / 2
    self.y = love.graphics.getHeight() - self.height * 2
    self.speed = 600
end 


function Paddle:draw()
    love.graphics.setColor(226/255, 125/255, 96/255)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.setColor(1, 1, 1)
end


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
        if self.x >= 0 t
        hen 
            self.x = self.x - self.speed * dt 
        end 
    end 
end 
