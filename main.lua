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
require "Game/Utils"
require "Game/ChoiceBox"


require "Game/states/BaseState"
require "Game/states/AboutState"
require "Game/states/MenuState"
require "Game/states/LevelsState"
require "Game/states/GameOverState"
require "Game/states/PlayState"
require "Game/states/OptionsState"
require "Game/states/ServeState"
require "Game/states/WinState"
require "Game/states/PauseState"
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
        ['gameOver'] = function() return GameOverState() end, 
        ['win'] = function() return WinState() end, 
        ['pause'] = function() return PauseState() end
    }

    stateMachine:change('menu')

    backgroundColor = Colors["backgroundColor"]

    gCurrentState = nil 
    gPaddle = Paddle()
    gBall = Ball()
    gBricks = nil
    gHeart = Heart(3)
    gCurrentLevel = nil
    gInfoBar = InfoBar() 
end 


function love.update(dt)
    stateMachine:update(dt)
end 


function love.draw()
    love.graphics.setBackgroundColor(backgroundColor)
    stateMachine:draw()
end 

