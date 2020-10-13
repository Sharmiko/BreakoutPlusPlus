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

    local optionsButtonX = (width / 2) - 60
    local optionsButtonY = playButtonY + 70 + 35
    self.buttons["optionsButton"] = Button(optionsButtonX, optionsButtonY, 120, 60, "Options", textColor, 22, 0)

    local aboutButtonX = (width / 2) - 45
    local aboutButtonY = optionsButtonY + 60 + 35
    self.buttons["aboutButton"] = Button(aboutButtonX, aboutButtonY, 90, 45, "About", textColor, 18, 0)
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
    local cursor = love.mouse.getSystemCursor("hand")

    for key, value in pairs(self.buttons)
    do
        if (value:isHover())
        then
            if (love.mouse.isDown(1))
            then
                love.mouse.setCursor()
                local idx = string.find(key, "Button")
                if key == 'playButton'
                then
                    stateMachine:change('levels')
                else
                    stateMachine:change(string.sub(key, 0, idx - 1))
                end 
            else
                love.mouse.setCursor(cursor)
                value.padding = 10
            end
            break
        else
            value.padding = 0
            love.mouse.setCursor()
        end 
    end 
end 
