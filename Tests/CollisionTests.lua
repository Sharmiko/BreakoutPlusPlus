CollisionTests = Object:extend()

function CollisionTests:new()
    self.width = love.graphics.getWidth()
    self.height = love.graphics.getHeight()

    self.ball = {
        x = self.width / 2,
        y = self.height / 2 - 200,
        radius = 20,
        color = {65, 179, 163}
    }

    self.rectangle = {
        x = self.width / 2 - 100,
        y = self.height / 2 - 200,
        width = 200,
        height = 70,
        color = {146, 7, 232}
    }

    self.square = {
        x = self.width / 2 - 100,
        y = self.height / 2,
        width = 95,
        height = 18,
        color = {245, 179, 66}
    }
end 

function CollisionTests:update()
    self:updateBall()
    self:ballSquareWallCollision(self.ball.x, self.ball.y, self.ball.radius, 
        self.square.x, self.square.y, self.square.width, self.square.height)
    local coll = self:ballRectangleCollision(self.ball.x, self.ball.y, self.ball.radius,
        self.rectangle.x, self.rectangle.y, self.rectangle.width, self.rectangle.height)
    if coll
    then
        self.rectangle.color = {235, 64, 52}
        self.ball.color = {219, 0, 0}
    else
        self.rectangle.color = {146, 7, 232}
        self.ball.color = {226, 125, 96}
    end 
end 


function CollisionTests:draw()
    self:drawRectangle()
    self:drawSquare()
    self:drawBall()
end 


function CollisionTests:drawBall()
    local color = self.ball.color 
    love.graphics.setColor(color[1] / 255, color[2] / 255, color[3] / 255)
    love.graphics.circle("fill", self.ball.x, self.ball.y, self.ball.radius)
    love.graphics.setColor(1, 1, 1)
end 


function CollisionTests:updateBall()
    local mouseX = love.mouse.getX()
    local mouseY = love.mouse.getY()
    self.ball.x = mouseX 
    self.ball.y = mouseY
end 


function CollisionTests:ballRectangleCollision(ballX, ballY, ballRadius, rectangleX, rectangleY, rectangleWidth, rectangleHeight)
    local circleDistanceX = math.abs(ballX - rectangleX - rectangleWidth / 2)
	local circleDistanceY = math.abs(ballY - rectangleY - rectangleHeight / 2)

    if (circleDistanceX > (rectangleWidth / 2 + ballRadius) or 
    circleDistanceY > (rectangleHeight / 2 + ballRadius)) then
		return false
    elseif (circleDistanceX <= (rectangleWidth / 2) or 
    circleDistanceY <= (rectangleHeight / 2)) then
		return true
	end

    return ((math.pow(circleDistanceX - rectangleWidth / 2, 2) + 
        math.pow(circleDistanceY - rectangleHeight / 2, 2)) <= math.pow(ballRadius, 2))
end 


function CollisionTests:drawRectangle()
    local color = self.rectangle.color
    love.graphics.setColor(color[1] / 255, color[2] / 255, color[3] / 255)
    love.graphics.rectangle("fill", self.rectangle.x, self.rectangle.y, self.rectangle.width, self.rectangle.height)
    love.graphics.setColor(1, 1, 1)
end 


function CollisionTests:drawSquare()
    local color = self.square.color 
    love.graphics.setColor(color[1] / 255, color[2] / 255, color[3] / 255)
    love.graphics.rectangle("fill", self.square.x, self.square.y, self.square.width, self.square.height)
    love.graphics.setColor(1, 1, 1)
end 


function CollisionTests:ballSquareWallCollision(ballX, ballY, ballRadius, squareX, squareY, squareWidth, squareHeight)
    local w = 2
    local leftRect = {
        x = squareX,
        y = squareY + w,
        width = w,
        height = squareHeight - w * 2
    }

    local upperRect = {
        x = squareX + w,
        y = squareY,
        width = squareWidth - w * 2,
        height = w
    }

    local rightRect = {
        x = squareX + squareWidth - w,
        y = squareY + w,
        width = w,
        height = squareHeight - w * 2
    }

    local lowerRect = {
        x = squareX + w,
        y = squareY + squareHeight - w,
        width = squareWidth - w * 2,
        height = w
    }

    if (self:ballRectangleCollision(ballX, ballY, ballRadius, leftRect.x, leftRect.y, leftRect.width, leftRect.height))
    then
        print("LEFT")
        self.square.color = {3, 82, 252} 
    elseif (self:ballRectangleCollision(ballX, ballY, ballRadius, upperRect.x, upperRect.y, upperRect.width, upperRect.height))
    then
        print("UPPER")
        self.square.color = {3, 252, 248} 
    elseif (self:ballRectangleCollision(ballX, ballY, ballRadius, rightRect.x, rightRect.y, rightRect.width, rightRect.height))
    then 
        print("RIGHT")
        self.square.color = {252, 198, 3}
    elseif (self:ballRectangleCollision(ballX, ballY, ballRadius, lowerRect.x, lowerRect.y, lowerRect.width, lowerRect.height))
    then
        print("LOWER")
        self.square.color = {252, 3, 252} 
    else 
        self.square.color = {245, 179, 66}
    end 
end 