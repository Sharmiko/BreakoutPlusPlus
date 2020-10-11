GameState = BaseState:extend()

start = false

--[[
    Game object constructor
    - initialize game components:
        paddle, ball and bricks
]]
function GameState:new()
    self.bricks = nil
    self.paddle = Paddle()
    self.ball = Ball()
    self.collisions = Collisions()
    self.hearts = Heart(3)
    self.text = Text(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 
        "Press 'space' to serve the ball!", 24)
    self.infoBar = InfoBar()
end 


--[[
    Update game object parameters
]]
function GameState:enter(bricks)
    self.bricks = bricks
end 

--[[
    Draw ball, paddle and bricks on the screen
]]
function GameState:draw()
    self.paddle:draw()
    self.ball:draw()
    self.bricks:draw()
    self.infoBar:draw()
    self.hearts:draw()
    if not start 
    then
        self.text:draw()
    end 
end 


--[[
    Update component information
]]
function GameState:update(dt)
    self.paddle:update(dt)
    if start
    then 
        self.collisions:ballWallCollision(self.ball, self.hearts)
        self.collisions:ballPaddleCollision(self.ball, self.paddle)
        self.collisions:ballBricksCollision(self.ball, self.bricks)
        self.ball:update(dt)
    else
        self.ball.x = self.paddle.x  + (self.paddle.width / 2) - 4
        self.ball.y = self.paddle.y - 9
        self.text:update()
    end 
end 


--[[
    Record pressed key
]]
function love.keypressed(key, uni)
    if key == "space"
    then
        start = true 
    end
end 