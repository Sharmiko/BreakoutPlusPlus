-- https://github.com/rxi/classic
Object = require "Game/classic"

require "Game/Colors"
require "Game/Ball"
require "Game/Brick"
require "Game/Bricks"
require "Game/Button"
require "Game/Collisions"
require "Game/Heart"
require "Game/InfoBar"
require "Game/Paddle"
require "Game/Sounds"
require "Game/Text"


require "Game/states/BaseState"
require "Game/states/AboutState"
require "Game/states/MenuState"
require "Game/states/LevelsState"
require "Game/states/PlayState"
require "Game/states/OptionsState"
require "Game/states/ServeState"
require "Game/states/StateMachine"

WINDOW_WIDTH = 800
WINDOW_HEIGHT = 800


function love.load()
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
    love.window.setTitle("Breakout++")


    stateMachine = StateMachine {
        ['menu'] = function() return MenuState() end,
        ['options'] = function() return OptionsState() end,
        ['about'] = function() return AboutState() end, 
        ['levels'] = function() return LevelsState() end,
        ['play'] = function() return PlayState() end,
        ['serve'] = function() return ServeState() end,
    }

    stateMachine:change('menu')

    backgroundColor = Colors["backgroundColor"]

    gPaddle = Paddle()
    gBall = Ball()
    gBricks = nil
    gInfoBar = InfoBar()
end 


function love.update(dt)
    stateMachine:update(dt)
end 


function love.draw()
    love.graphics.setBackgroundColor(backgroundColor)
    stateMachine:draw()
end 

