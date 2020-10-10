Paddle = Object:extend()


--[[ 
    Paddle constructor
]]
function Paddle:new()
    Paddle.super.new(self)
    self.width = 120 
    self.height = 10 
    self.x = love.graphics.getWidth() / 2 - self.width / 2
    self.y = love.graphics.getHeight() - self.height * 4
    self.dx = 0
    self.radius = 4
    self.speed = 600
end 


--[[ 
    Function that draws a paddle
]]
function Paddle:draw()
    local color = Colors["paddleColor"]
    love.graphics.setColor(color[1], color[2], color[3])
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height, self.radius)
    love.graphics.setColor(1, 1, 1)
end


--[[ 
    Function that moves paddle using left and right
     arrow keys
]]
function Paddle:update(dt)
    if love.keyboard.isDown("right") 
    then 
        self.dx = self.speed
    elseif love.keyboard.isDown("left") 
    then
 
        self.dx = -self.speed
    else
        self.dx = 0
    end 

    if self.dx < 0 
    then
        -- check for right wall collision
        self.x = math.max(0, self.x + self.dx * dt)
    else
        -- check for left wall collision
        self.x = math.min(love.graphics.getWidth() - self.width, self.x + self.dx * dt)
    end
end 

