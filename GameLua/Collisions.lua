Collisions = Object:extend()


function Collisions:new()

end 


--[[ 
    Function that checks Ball and paddle collision
--]]
function Collisions:ballPaddleCollision(ball, paddle)
    if (self:circleRectangleCollision(ball.x, ball.y, ball.radius,
        paddle.x, paddle.y, paddle.width, paddle.height))
    then 
        ball.dy = ball.dy * (-1)
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
            if (self:circleRectangleCollision(ball.x, ball.y, ball.radius, 
                brick.x, brick.y, brick.width, brick.height))
            then
                ball.dy = -ball.dy
                brick.hits = brick.hits - 1
                break 
            end 

            if (brick.hits == 0)
            then 
                brick = nil 
            end 
        end 
    end 
end 


--[[
    Function that checks collisions between circle and a rectangle
--]]
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