WINDOW_WIDTH = 800
WINDOW_HEIGHT = 800


function love.load()
    Object = require "classic"

    require "Menu"
    require "Level"
    require "Game"
    require "Options"
    require "About"

    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
    love.window.setTitle("Breakout++")

    menu = Menu()
    level = Level()
    game = Game()
    options = Options()
    about = About()

    state = {
        playButtonClicked =  false,
        optionsButtonClicked =  false,
        aboutButtonClicked = false,
        levelButtonClicked = false,
        level = nil
    }

end 


function love.update(dt)
    if (state["playButtonClicked"])
    then
        level:update(state, game)
    elseif (state["levelButtonClicked"])
    then 
        game:update(dt)
    elseif(state["optionsButtonClicked"])
    then
        options:update(state)
    elseif(state["aboutButtonClicked"])
    then
        about:update(state)
    else
        menu:update(state)
    end
end 


function love.draw()
    love.graphics.setBackgroundColor(133/255, 205/255, 202/255, 0)
    if (state["playButtonClicked"])
    then 
        level:draw()
    elseif (state["levelButtonClicked"])
    then
        game:draw()
    elseif (state["optionsButtonClicked"])
    then 
        options:draw()
    elseif (state["aboutButtonClicked"])
    then
        about:draw()
    else
        menu:draw()
    end 
end 

