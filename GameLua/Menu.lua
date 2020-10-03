require "Button"

Menu = Object:extend()


--[[ 
    Menu object constructor
    - initialize menu table, with 3 main buttons: play, options, about
]]
function Menu:new() 
    Menu.super.new(self)
    
    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()

    local textColor = {99, 96, 88}

    local playButtonX = (width / 2) - 70
    local playButtonY = (height / 2) - 150
    self.playButton = Button(playButtonX, playButtonY, 140, 70, "Play", textColor, 30, 0)

    local optionsButtonX = (width / 2) - 60
    local optionsButtonY = playButtonY + 70 + 35
    self.optionsButton = Button(optionsButtonX, optionsButtonY, 120, 60, "Options", textColor, 22, 0)

    local aboutButtonX = (width / 2) - 45
    local aboutButtonY = optionsButtonY + 60 + 35
    self.aboutButton = Button(aboutButtonX, aboutButtonY, 90, 45, "About", textColor, 18, 0)
end 


--[[ 
    Function that draws menu buttons on the screen
]]
function Menu:draw()
    self.playButton:drawButton()
    self.optionsButton:drawButton()
    self.aboutButton:drawButton()
end 


--[[ 
    Function that updates (scales) buttons depending on
    mouse interaction, if mouse is hovered over button 
    it is rescaled and if mouse is clicked state of the game
    is changed
]]
function Menu:update(state)
    local cursor = love.mouse.getSystemCursor("hand")

    if (self.playButton:isHover())
    then
        if (love.mouse.isDown(1))
        then
            love.mouse.setCursor()
            state["playButtonClicked"] = true
        else
            love.mouse.setCursor(cursor)
            self.playButton.padding = 10
        end 
    elseif (self.optionsButton:isHover())
    then 
        if (love.mouse.isDown(1))
        then
            love.mouse.setCursor()
            state["optionsButtonClicked"] = true
        else
            love.mouse.setCursor(cursor)
            self.optionsButton.padding = 10
        end 
    elseif (self.aboutButton:isHover())
    then
        if (love.mouse.isDown(1))
        then
            love.mouse.setCursor()
            state["aboutButtonClicked"] = true 
        else 
            love.mouse.setCursor(cursor)
            self.aboutButton.padding = 10
        end
    else
        love.mouse.setCursor()
        self.playButton.padding = 0
        self.optionsButton.padding = 0
        self.aboutButton.padding = 0
    end 
end 

