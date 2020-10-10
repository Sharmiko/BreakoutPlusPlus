AboutState = BaseState:extend()

--[[ 
    Options state constructor
]]
function AboutState:new()
    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()
    self.text = Text(width / 2, height / 2, "About coming soon...", 32)
    self.backButton = Button(25, 25, 100, 40, "< back", {99, 96, 88}, 18, 0)
    self.soundPlayed = 0
end 


--[[ 
    Function that draws options
]]
function AboutState:draw()
    self.text:draw()
    self.backButton:draw()
end 


--[[
    Function that updates state of options menu
]]
function AboutState:update(state)
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
            Sounds["buttonHover"]:play()
            self.soundPlayed = 2
        end 
        if (love.mouse.isDown(1))
        then
            stateMachine:change('menu')
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

