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
    self.currentTime = tonumber(love.timer.getTime())
    self.decision = 1
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
    if (tonumber(love.timer.getTime()) - self.currentTime >= 0.6)
    then
        self.currentTime = love.timer.getTime()
        self.decision = -self.decision
    end 

    local fontSize = self.originalFontSize
    if self.decision == -1
    then
        fontSize = fontSize + 4
    end 

    self.fontSize = fontSize 
end

