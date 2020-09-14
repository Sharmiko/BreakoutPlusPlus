Button = Object:extend()


--[[
    Button object constructor
    Parameters:
        x (number) - x location of the button
        y (number) - y location of the button
        width (number) - width of the button
        height (number) - height of the button
        text (string) - text that is centered in the button
        textColor (table) - RGB color of the text
        fontSize (number) - font size of the text
        padding (number) - padding usef for rescaling the button
--]]
function Button:new(x, y, width, height, text, textColor, fontSize, padding)
    self.x = x 
    self.y = y 
    self.width = width 
    self.height = height 
    self.text = text 
    self.textColor = textColor 
    self.fontSize = fontSize
    self.padding = padding
end 


--[[
     Helper function that draws button on the screen
--]]
function Button:drawButton()
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("line", self.x - self.padding, self.y - self.padding, self.width + 2 * self.padding, self.height + 2 * self.padding)
    love.graphics.setColor(self.textColor[1] / 255, self.textColor[2] / 255, self.textColor[3] / 255)
    local font = love.graphics.setNewFont(self.fontSize)
    local textWidth = font:getWidth(self.text)
    love.graphics.print(self.text, self.x + self.width / 2 - textWidth / 2, self.y + self.height / 4)
end


--[[ 
    Helper Function that checks if mouse is hovered over
    on of the buttons
    Returns:
        boolean - whether mouse if hovered or not
--]]
function Button:isHover()
    local mouseX = love.mouse.getX()
    local mouseY = love.mouse.getY()

    if (mouseX > self.x - self.padding and mouseX < self.x + self.width + self.padding and
        mouseY > self.y - self.padding and mouseY < self.y + self.height + self.padding)
    then
        return true
    end
    return false
end