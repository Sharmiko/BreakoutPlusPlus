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
        height = 70
    }
end 

function CollisionTests:update()

end 


function CollisionTests:draw()
    self:drawBall()
    self:drawRectangle()
end 


function CollisionTests:drawBall()
    love.graphics.setColor(65/255, 179/255, 163/255)
    love.graphics.circle("fill", self.ball.x, self.ball.y, self.ball.radius)
    love.graphics.setColor(1, 1, 1)
end 


function CollisionTests:drawRectangle()
    love.graphics.setColor(226/255, 125/255, 96/255)
    love.graphics.rectangle("fill", self.rectangle.x, self.rectangle.y, self.rectangle.width, self.rectangle.height)
    love.graphics.setColor(1, 1, 1)
end 