require "Paddle"
require "Ball"
require "Bricks"


Game = Object:extend()


function Game:new()
    --self.bricks = Bricks()
    self.paddle = Paddle()
    self.ball = Ball()
    self.bricks = nil 
end 


function Game:draw()
    self.ball:draw()
    self.paddle:draw()
    self.bricks:draw()
end 


function Game:update(dt)
    self.ball:update(dt, self.paddle)
    self.paddle:update(dt)
    self.bricks:update()
end 