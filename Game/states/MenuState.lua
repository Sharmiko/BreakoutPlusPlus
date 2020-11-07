MenuState = BaseState:extend()


--[[ 
    Menu state object constructor
    - initialize menu table, with 3 main buttons: play, options, about
]]
function MenuState:new() 
    MenuState.super.new(self)
    
    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()

    local textColor = {99, 96, 88}
    self.buttons = {}

    local playButtonX = (width / 2) - 70
    local playButtonY = (height / 2) - 150
    self.buttons["playButton"] = Button(playButtonX, playButtonY, 140, 70, "Play", textColor, 30, 0)
    self.buttons["playButton"].onClickFunction = function() 
        stateMachine:change('levels') 
    end

    local optionsButtonX = (width / 2) - 60
    local optionsButtonY = playButtonY + 70 + 35
    self.buttons["optionsButton"] = Button(optionsButtonX, optionsButtonY, 120, 60, "Options", textColor, 22, 0)
    self.buttons["optionsButton"].onClickFunction = function() 
        stateMachine:change('options') 
    end

    local aboutButtonX = (width / 2) - 45
    local aboutButtonY = optionsButtonY + 60 + 35
    self.buttons["aboutButton"] = Button(aboutButtonX, aboutButtonY, 90, 45, "About", textColor, 18, 0)
    self.buttons["aboutButton"].onClickFunction = function() 
        stateMachine:change('about') 
    end

    local quitButtonX = (width / 2) - 35
    local quitBUttonY = aboutButtonY + 45 + 35
    self.buttons["quitButton"] = Button(quitButtonX, quitBUttonY, 70, 35, "Quit", textColor, 18, 0)
    self.buttons["quitButton"].onClickFunction = function() 
        love.event.quit() 
    end
end 


--[[ 
    Function that draws menu buttons on the screen
]]
function MenuState:draw()
    for key, value in pairs(self.buttons) 
    do 
        value:draw()
    end 
end 


--[[ 
    Function that updates (scales) buttons depending on
    mouse interaction, if mouse is hovered over button 
    it is rescaled and if mouse is clicked state of the game
    is changed
]]
function MenuState:update(state)
    for key, value in pairs(self.buttons)
    do 
        if value:update()
        then
            break
        end
    end 
end 

