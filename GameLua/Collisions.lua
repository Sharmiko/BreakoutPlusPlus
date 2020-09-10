Collisions = Object:extend()


function Collisions:new()

end 


--[[ 
    Function that checks Ball and paddle collision
--]]
function Collisions:ballPaddleCollision(ball, paddle)
    if (ball.x + ball.radius / 2 > (paddle.x - paddle.width / 2)) and 
       (ball.x - ball.radius / 2< (paddle.x + paddle.width / 2)) and 
       (ball.y + ball.radius / 2> (paddle.y - paddle.height / 2)) and  
       (ball.y - ball.radius / 2< (paddle.y + paddle.height / 2)) 
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
        if (brick.hits > 0)
        then 
            if ((ball.x + ball.radius > (brick.x - brick.width / 2)) and 
                (ball.x - ball.radius < (brick.x + brick.width / 2)) and
                (ball.y + ball.radius > (brick.y - brick.height / 2)) and
                (ball.y - ball.radius < (brick.y + brick.height / 2)))
            then
                ball.dy = -ball.dy --* (-1)
                brick.hits = brick.hits - 1
                break 
            end 

            if (brick.hits == 0)
            then 
                -- remove brick 
            end 
        end 
    end 
end 