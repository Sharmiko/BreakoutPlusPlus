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
        onClick (function) - function to execute when the button is clicked
]]
function Button:new(x, y, width, height, text, textColor, fontSize, padding, onClickFunction)
    self.x = x 
    self.y = y 
    self.width = width 
    self.height = height 
    self.text = text 
    self.textColor = textColor 
    self.fontSize = fontSize
    self.padding = padding
    self.hovered = false
    self.soundPlayed = 0
    self.onClickFunction = onClickFunction or nil 
end 


--[[
    Function that executes when button is hovered
]]
function Button:onHover()
    local cursor = love.mouse.getSystemCursor("hand")
    love.mouse.setCursor(cursor)
    self.padding = 10
end 


--[[
    Function that resets button state to original
    when mouse is not hovered anymore
]]
function Button:resetHover()
    love.mouse.setCursor()
    self.padding = 0
end 


--[[
     Helper function that draws button on the screen
]]
function Button:draw()
    local font = love.graphics.setNewFont(self.fontSize)
    local textWidth = font:getWidth(self.text)
    font:setFilter("nearest", "nearest")

    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("line", self.x - self.padding, self.y - self.padding, self.width + 2 * self.padding, self.height + 2 * self.padding, 5)
    love.graphics.setColor(self.textColor[1] / 255, self.textColor[2] / 255, self.textColor[3] / 255)

    love.graphics.setColor(Colors["buttonTextColor"])
    love.graphics.print(self.text, self.x + self.width / 2 - textWidth / 2, self.y + self.height / 4)
end


--[[
    Function that updates state of the button
]]
function Button:update()
    local mouseX = love.mouse.getX()
    local mouseY = love.mouse.getY()
    self.hovered = false

    if (mouseX > self.x - self.padding and mouseX < self.x + self.width + self.padding and
        mouseY > self.y - self.padding and mouseY < self.y + self.height + self.padding)
    then
        self.hovered = true 

        if self.soundPlayed == 0
        then
            self.soundPlayed = 1
        end 

        if self.soundPlayed == 1
        then 
            Sounds["buttonHover"]:play()
            self.soundPlayed = 2
        end 
        self:onHover()
        if love.mouse.isDown(1)
        then
            if self.onClickFunction
            then
                self.onClickFunction()
            end 
        end 

        return true 
    else
        self:resetHover()
    end 

    if not self.hovered
    then
        self.soundPlayed = 0
    end 
end

