Collisions = Object:extend()


function Collisions:new()
    -- for score counter
    self.ballInAir = true
    self.batchScore = 0
    self.mult = 1
end 


--[[ 
    Function that checks Ball and paddle collision
]]
function Collisions:ballPaddleCollision(ball, paddle)
    if (self:circleRectangleCollision(ball.x, ball.y, ball.radius,
        paddle.x, paddle.y, paddle.width, paddle.height))
    then 
        -- add currently accumulated score to our score
        -- and reset score combo
        gInfoBar.currentScore = gInfoBar.currentScore + self.batchScore
        gInfoBar.batchScore = 0
        self.batchScore = 0
        self.mult = 1

        ball.y = paddle.y - 8
        ball.dy = -ball.dy
        Sounds['ballPaddleHit']:play()
        if ball.x < paddle.x + (paddle.width / 2) and paddle.dx < 0 then
            -- if the paddle is moving left...
            if paddle.dx < 0 then
                ball.dx = -math.random(30, 50 + 
                    10 * paddle.width / 2 - (ball.x + 8 - paddle.x))
            end
        else
            -- if the paddle is moving right...
            if paddle.dx > 0 then
                ball.dx = math.random(30, 50 + 
                    10 * (ball.x - paddle.x - paddle.width / 2))
            end
        end
    end 
end 


--[[
    Functiont that checks collisions between
    ball and wall
]]
function Collisions:ballWallCollision(ball)
    -- check for wall collisions
    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()
    if ball.x + ball.radius >= width or ball.x <= ball.radius
    then 
        ball.dx = ball.dx * (-1)
        local sign = 1
        if math.abs(ball.dx) ~= ball.dx
        then
            sign = -1
        end 
        ball.x = ball.x + (sign * ball.offset)
        Sounds['ballWallHit']:play()
    elseif ball.y <= ball.radius + 40
    then 
        ball.dy = ball.dy * (-1)
        Sounds['ballWallHit']:play()
    elseif ball.y + ball.radius / 2 >= height 
    then 
        Sounds["ballHitsGround"]:play()
        if (gHeart.hearts > 0)
        then
            gHeart.hearts = gHeart.hearts - 1
            stateMachine:change('serve', gBricks)
        end 
        if (gHeart.hearts == 0)
        then 
            stateMachine:change('gameOver')
        end
    end 
end 

--[[
    Funtion that checks collisions between ball and bricks
]]
function Collisions:ballBricksCollision(ball, bricks)
    for i in pairs(bricks.array)
    do 
        local brick = bricks.array[i]
        if (brick and brick.hits > 0)
        then 
            local wall = self:ballSquareWallCollision(ball.x, ball.y, ball.radius, 
                brick.x, brick.y, brick.width, brick.height)
            if (wall ~= nil)
            then
                -- score combo counter
                self.batchScore = self.batchScore + (brick.hits * (10 * self.mult))
                gInfoBar.batchScore = self.batchScore
                self.mult = self.mult + 0.05
                
                Sounds["brickHit"]:play()
                if (wall == "left")
                then
                    ball.dx = -ball.dx
                    ball.x = ball.x - ball.offset 
                elseif (wall == "top")
                then
                    ball.dy = -ball.dy
                    ball.y = ball.y - ball.offset 
                elseif (wall == "right")
                then
                    ball.dx = -ball.dx 
                    ball.x = ball.x + ball.offset  
                elseif (wall == "bottom")
                then
                    ball.dy = -ball.dy
                    ball.y = ball.y + ball.offset
                end 
                brick.hits = brick.hits - 1

                if (brick.hits == 0)
                then 
                    brick = nil 
                    gBricks.brickCount = gBricks.brickCount - 1
                end
                
                return nil
            end
        end 
    end 
end 


--[[
    Function that checks collisions between circle and a rectangle
]]
function Collisions:circleRectangleCollision(circleX, circleY, circleRadius, rectangleX, rectangleY, rectangleWidth, rectangleHeight)
    local circleDistanceX = math.abs(circleX - rectangleX - rectangleWidth / 2)
	local circleDistanceY = math.abs(circleY - rectangleY - rectangleHeight / 2)

    if (circleDistanceX > (rectangleWidth / 2 + circleRadius) or 
    circleDistanceY > (rectangleHeight / 2 + circleRadius)) then
		return false
    elseif (circleDistanceX <= (rectangleWidth / 2) or 
    circleDistanceY <= (rectangleHeight / 2)) then
		return true
	end

    return ((math.pow(circleDistanceX - rectangleWidth / 2, 2) + 
        math.pow(circleDistanceY - rectangleHeight / 2, 2)) <= math.pow(circleRadius, 2))
end 


--[[
    Function that checks collisions between circle and a rectangle wall
    Returns string representing side of the rectangle
]]
function Collisions:ballSquareWallCollision(circleX, circleY, circleRadius, brickX, brickY, brickWidth, brickHeight)
    local w = 2

    local leftRect = {
        x = brickX,
        y = brickY + w,
        width = w,
        height = brickHeight - w * 2
    }

    local topRect = {
        x = brickX + w,
        y = brickY,
        width = brickWidth - w * 2,
        height = w
    }

    local rightRect = {
        x = brickX + brickWidth - w,
        y = brickY + w,
        width = w,
        height = brickHeight - w * 2
    }

    local bottomRect = {
        x = brickX + w,
        y = brickY + brickHeight - w,
        width = brickWidth - w * 2,
        height = w
    }

    if (self:circleRectangleCollision(circleX, circleY, circleRadius, 
        leftRect.x, leftRect.y, leftRect.width, leftRect.height))
    then
        return "left"
    elseif (self:circleRectangleCollision(circleX, circleY, circleRadius, 
        topRect.x, topRect.y, topRect.width, topRect.height))
    then
        return "top"
    elseif (self:circleRectangleCollision(circleX, circleY, circleRadius, 
        rightRect.x, rightRect.y, rightRect.width, rightRect.height))
    then 
        return "right"
    elseif (self:circleRectangleCollision(circleX, circleY, circleRadius, 
        bottomRect.x, bottomRect.y, bottomRect.width, bottomRect.height))
    then
        return "bottom"
    else
        return nil
    end 
end 

