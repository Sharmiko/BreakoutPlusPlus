-- https://github.com/rxi/classic
Object = require "Game/classic"

require "Game/Ball"
require "Game/Brick"
require "Game/Bricks"
require "Game/Button"
require "Game/Collisions"
require "Game/Game"
require "Game/Heart"
require "Game/InfoBar"
require "Game/Paddle"
require "Game/Sounds"
require "Game/Text"

require "Game/states/BaseState"
require "Game/states/AboutState"
require "Game/states/MenuState"
require "Game/states/LevelsState"
require "Game/states/GameState"
require "Game/states/OptionsState"
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
        ['play'] = function() return LevelsState() end,
        ['game'] = function() return GameState() end,

    }

    stateMachine:change('menu')

end 


function love.update(dt)
    stateMachine:update(dt)
end 


function love.draw()
    love.graphics.setBackgroundColor(133/255, 205/255, 202/255, 0)
    stateMachine:draw()
end 

