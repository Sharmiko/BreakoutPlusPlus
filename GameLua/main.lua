function love.load()
    Object = require "classic"
    require "Paddle"
    require "Ball"

    paddle = Paddle()
    ball = Ball()
end 


function love.update(dt)
    paddle:update(dt)
    ball:update(dt, paddle)
end 


function love.draw()
    love.graphics.setBackgroundColor(133/255, 205/255, 202/255, 0)
    paddle:draw()
    ball:draw()
end 