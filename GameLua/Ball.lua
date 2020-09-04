Ball = Object:extend()

--[[ Ball constructor

--]]
function Ball:new()
    Ball.super.new()
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    self.radius = 20
    self.dx = 2
    self.dy = 2
end 


--[[ Function that drwas a ball

--]]
function Ball:draw()
    love.graphics.setColor(65/255, 179/255, 163/255)
    love.graphics.circle("fill", self.x, self.y, self.radius)
    love.graphics.setColor(1, 1, 1)
    print(self.radius)
end 


--[[ Function that updates ball position
     and checks for collisions
--]]
function Ball:update(dt, paddle)
    self:ballPaddleCollision(paddle)

    self.x = self.x + self.dx 
    self.y = self.y + self.dy 

    -- check for wall collisions
    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()
    if self.x + self.radius >= width or self.x <= self.radius
    then 
        self.dx = self.dx * (-1)
    elseif self.y <= self.radius then 
        self.dy = self.dy * (-1)
    elseif self.y + self.radius / 2 >= height then 
        self.dy = self.dy * (-1)
    end 
end 


--[[ Function that checks Ball and paddle
     collision
--]]
function Ball:ballPaddleCollision(paddle)
    if (self.x + self.radius / 2 > (paddle.x - paddle.width / 2)) and 
       (self.x - self.radius / 2< (paddle.x + paddle.width / 2)) and 
       (self.y + self.radius / 2> (paddle.y - paddle.height / 2)) and  
       (self.y - self.radius / 2< (paddle.y + paddle.height / 2)) 
    then 
        self.dy = self.dy * (-1)
    end 
end 