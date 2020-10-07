require "GameLua/Text"
require "GameLua/Button"
require "GameLua/Sounds"

About = Object:extend()

--[[ 
    Options constructor
]]
function About:new()
    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()
    self.text = Text(width / 2, height / 2, "About coming soon...", 32)
    self.backButton = Button(25, 25, 100, 40, "< back", {99, 96, 88}, 18, 0)
    self.soundPlayed = 0
    self.sounds = Sounds()
end 


--[[ 
    Function that draws options
]]
function About:draw()
    self.text:draw()
    self.backButton:draw()
end 


--[[
    Function that updates state of options menu
]]
function About:update(state)
    local cursor = love.mouse.getSystemCursor("hand")
    local hovered = false

    if (self.backButton:isHover())
    then
        hovered = true 
        if self.soundPlayed == 0
        then
            self.soundPlayed = 1
        end 

        if self.soundPlayed == 1
        then 
            self.sounds.buttonHover:play()
            self.soundPlayed = 2
        end 
        if (love.mouse.isDown(1))
        then
            -- go back to main screen
            state["aboutButtonClicked"] = false
        end 
        love.mouse.setCursor(cursor)
        self.backButton.padding = 10
    else
        love.mouse.setCursor()
        self.backButton.padding = 0
    end 

    if not hovered
    then
        self.soundPlayed = 0
    end 
end 

