CollisionTests = Object:extend()

function CollisionTests:new()
    self.width = love.graphics.getWidth()
    self.height = love.graphics.getHeight()

    self.ball = {
        x = self.width / 2,
        y = self.height / 2 - 200,
        radius = 20
    }

    self.rectangle = {
        x = self.width / 2 - 100,
        y = self.height / 2,
        width = 200,
        height = 70,
        color = {226, 125, 96}
    }
end 

function CollisionTests:update()
    self:updateBall()
    self:ballRectangleCollision()
end 


function CollisionTests:draw()
    self:drawRectangle()
    self:drawBall()
end 


function CollisionTests:drawBall()
    love.graphics.setColor(65/255, 179/255, 163/255)
    love.graphics.circle("fill", self.ball.x, self.ball.y, self.ball.radius)
    love.graphics.setColor(1, 1, 1)
end 


function CollisionTests:updateBall()
    local mouseX = love.mouse.getX()
    local mouseY = love.mouse.getY()
    self.ball.x = mouseX 
    self.ball.y = mouseY
end 


function CollisionTests:ballRectangleCollision()
    if (self.ball.x + self.ball.radius / 2 > (self.rectangle.x - self.rectangle.width / 2)) and 
       (self.ball.x - self.ball.radius / 2< (self.rectangle.x + self.rectangle.width / 2)) and 
       (self.ball.y + self.ball.radius / 2> (self.rectangle.y - self.rectangle.height / 2)) and  
       (self.ball.y - self.ball.radius / 2< (self.rectangle.y + self.rectangle.height / 2)) 
    then 
        self.rectangle.color = {235, 64, 52}
    else
        self.rectangle.color = {226, 125, 96}
    end 
end 


function CollisionTests:drawRectangle()
    local color = self.rectangle.color
    love.graphics.setColor(color[1] / 255, color[2] / 255, color[3] / 255)
    love.graphics.rectangle("fill", self.rectangle.x, self.rectangle.y, self.rectangle.width, self.rectangle.height)
    love.graphics.setColor(1, 1, 1)
end 