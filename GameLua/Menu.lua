Menu = Object:extend()


--[[ Menu object constructor
    - initialize menu table, with 3 main keys: play, options, about
    - that represent buttons.
--]]
function Menu:new() 
    Menu.super.new(self)
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()
    self.menu = {
        play = {
            width = 140,
            height = 70,
            text = "Play",
            hoverPadding = 0
        },
        options = {
            width = 120,
            height = 60,
            text = "Options",
            hoverPadding = 0
        },
        about = {
            width = 90,
            height = 45,
            text = "About",
            hoverPadding = 0
        },
        padding = 35,
        textColor = {99, 96, 88}
    }

    -- Set up menu buttons x and y coordinates
    -- Each button will be centered
    self.menu["play"]["x"] = (width / 2) - (self.menu["play"]["width"] / 2)
    self.menu["play"]["y"] = (height / 2) - 150;

    self.menu["options"]["x"] = (width / 2) - (self.menu["options"]["width"] / 2)
    self.menu["options"]["y"] = self.menu["play"]["y"] + self.menu["play"]["height"] + self.menu["padding"]
    
    self.menu["about"]["x"] = (width / 2) - (self.menu["about"]["width"] / 2)
    self.menu["about"]["y"] = self.menu["options"]["y"] + self.menu["options"]["height"] + self.menu["padding"]
end 


--[[ Function that draws menu buttons on the screen
    
--]]
function Menu:draw()
    play = self.menu["play"]
    self:drawMenuIcon(play["x"], play["y"], play["width"], play["height"], play["text"], 30, play["hoverPadding"])

    options = self.menu["options"]
    self:drawMenuIcon(options["x"], options["y"], options["width"], options["height"], options["text"], 22, options["hoverPadding"])

    about = self.menu["about"]
    self:drawMenuIcon(about["x"], about["y"], about["width"], about["height"], about["text"], 18, about["hoverPadding"])
end 


--[[ Function that updates (scales) buttons depending on
     mouse interaction, if mouse is hovered over button 
     it is rescaled and if mouse is clicked state of the game
     is changed
--]]
function Menu:update(state)
    cursor = love.mouse.getSystemCursor("hand")

    -- mouse over play button
    if (self:isOverMenuButton("play"))
    then
        if (love.mouse.isDown(1))
        then 
            state["playButtonClicked"] = true 
        end
        love.mouse.setCursor(cursor)
        self.menu["play"]["hoverPadding"] = 10
    -- mouse over options button
    elseif (self:isOverMenuButton("options"))
    then
        if (love.mouse.isDown(1))
        then
            state["optionsButtonClicked"] = true 
        end 
        love.mouse.setCursor(cursor)
        self.menu["options"]["hoverPadding"] = 10
    -- mouse over about button
    elseif (self:isOverMenuButton("about"))
    then
        if (love.mouse.isDown(1))
        then
            state["aboutButtonClicked"] = true
        end 
        love.mouse.setCursor(cursor)
        self.menu["about"]["hoverPadding"] = 10
    -- reset each button and cursor
    else
        love.mouse.setCursor()
        self.menu["play"]["hoverPadding"] = 0
        self.menu["options"]["hoverPadding"] = 0
        self.menu["about"]["hoverPadding"] = 0
    end
end 


--[[ Helper function that draws menu button on the screen
     Parameters:
        x (number) - x location of the button
        y (number) - y location of the button
        width (number) - width of the button
        height (number) - height of the button
        text (string) - text that is centered in the button
        fontSize (number) - font size of the text
        padding (number) - padding usef for rescaling the button
--]]
function Menu:drawMenuIcon(x, y, width, height, text, fontSize, padding)
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("line", x - padding, y - padding, width + 2 * padding, height + 2 * padding)
    love.graphics.setColor(self.menu["textColor"][1] / 255, self.menu["textColor"][2] / 255, self.menu["textColor"][3] / 255)
    font = love.graphics.setNewFont(fontSize)
    textWidth = font:getWidth(text)
    textHeight = font:getHeight()
    love.graphics.print(text, x + width / 2 - textWidth / 2, y + height / 4)
end


--[[ Helper Function that checks if mouse is hovered over
     on of the buttons
     Paramters:
        menuButton (string) - name of the button
    
     Returns:
        boolean - whether mouse if hovered or not
--]]
function Menu:isOverMenuButton(menuButton)
    mouseX = love.mouse.getX()
    mouseY = love.mouse.getY()

    if (mouseX > self.menu[menuButton]["x"] - self.menu[menuButton]["hoverPadding"] and mouseX < self.menu[menuButton]["x"] + 
        self.menu[menuButton]["width"] + self.menu[menuButton]["hoverPadding"] and
        mouseY > self.menu[menuButton]["y"] - self.menu[menuButton]["hoverPadding"] and mouseY < self.menu[menuButton]["y"] + 
        self.menu[menuButton]["height"] + self.menu[menuButton]["hoverPadding"])
    then
        return true
    end
    return false
end