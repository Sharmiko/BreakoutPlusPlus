Text = Object:extend()


--[[ 
    Text constructor
]]
function Text:new(x, y, text, fontSize)
    self.x = x
    self.y = y
    self.text = text 
    self.originalFontSize = fontSize
    self.fontSize = fontSize 
    self.decision = 0
end 


--[[ 
    Draw Text 
]]
function Text:draw()
    local font = love.graphics.setNewFont(self.fontSize)
    font:setFilter("nearest", "nearest")
    local textWidth = font:getWidth(self.text)
    love.graphics.print(self.text, self.x - textWidth / 2, self.y)
end 


--[[
    Update text
]]
function Text:update()
    local font = nill
    if self.decision == 0
    then
        self.decision = 1
        self.fontSize = self.originalFontSize
    elseif self.decision == 1
    then
        self.decision = 0
        self.fontSize = self.originalFontSize + 4
    end 
    love.timer.sleep(0.5)
end

