require "Paddle"
require "Ball"
require "Bricks"
require "Collisions"
require "Heart"
require "Text"
require "InfoBar"


Game = Object:extend()
globalkey = false 

--[[
    Game object constructor
    - initialize game components:
        paddle, ball and bricks
--]]
function Game:new()
    self.bricks = nil
    self.paddle = Paddle()
    self.ball = Ball()
    self.collisions = Collisions()
    self.hearts = Heart(3)
    self.text = Text(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 
        "Press any key to start game!", 24)
    self.infoBar = InfoBar()
end 


--[[
    Draw ball, paddle and bricks on the screen
--]]
function Game:draw()
    self.paddle:draw()
    self.ball:draw()
    --self.bricks:draw()
    self.infoBar:draw()
    if not globalkey
    then
        self.text:draw()
    end 
end 


--[[
    Update component information
--]]
function Game:update(dt)
    if globalkey
    then 
        self.collisions:ballWallCollision(self.ball, self.hearts)
        self.collisions:ballPaddleCollision(self.ball, self.paddle)
        --self.collisions:ballBricksCollision(self.ball, self.bricks)
        self.ball:update(dt, self.paddle)
        self.paddle:update(dt)
    else
        self.text:update()
    end 
end 


--[[
    Record pressed key
--]]
function love.keypressed(key, uni)
    globalkey = key
end


--[[
    Record released key
--]]
function love.keyreleased(key, uni)
    if globalkey
    then
        return
    elseif globalkey == key then
        globalkey = false
    end
end
