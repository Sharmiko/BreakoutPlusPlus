require "Text"
require "Button"

About = Object:extend()

--[[ 
    Options constructor
--]]
function About:new()
    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()
    self.text = Text(width / 2, height / 2, "About coming soon...", 32)
    self.backButton = Button(25, 25, 100, 40, "< back", {99, 96, 88}, 18, 0)
end 


--[[ 
    Function that draws options
--]]
function About:draw()
    self.text:draw()
    self.backButton:drawButton()
end 


--[[
    Function that updates state of options menu
]]
function About:update(state)
    local cursor = love.mouse.getSystemCursor("hand")
    if (self.backButton:isHover())
    then
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
end 

