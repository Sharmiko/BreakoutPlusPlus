Menu = Object:extend()


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
    self.menu["play"]["x"] = (width / 2) - (self.menu["play"]["width"] / 2)
    self.menu["play"]["y"] = (height / 2) - 150;

    self.menu["options"]["x"] = (width / 2) - (self.menu["options"]["width"] / 2)
    self.menu["options"]["y"] = self.menu["play"]["y"] + self.menu["play"]["height"] + self.menu["padding"]
    
    self.menu["about"]["x"] = (width / 2) - (self.menu["about"]["width"] / 2)
    self.menu["about"]["y"] = self.menu["options"]["y"] + self.menu["options"]["height"] + self.menu["padding"]
end 


function Menu:draw()
    play = self.menu["play"]
    self:drawMenuIcon(play["x"], play["y"], play["width"], play["height"], play["text"], 30, play["hoverPadding"])

    options = self.menu["options"]
    self:drawMenuIcon(options["x"], options["y"], options["width"], options["height"], options["text"], 22, options["hoverPadding"])

    about = self.menu["about"]
    self:drawMenuIcon(about["x"], about["y"], about["width"], about["height"], about["text"], 18, about["hoverPadding"])
end 


function Menu:update()
    cursor = love.mouse.getSystemCursor("hand")

    if (self:isOverMenuButton("play"))
    then
        if (love.mouse.isDown(1))
        then 
            print("Play Clicked")
        end
        love.mouse.setCursor(cursor)
        self.menu["play"]["hoverPadding"] = 10
    elseif (self:isOverMenuButton("options"))
    then
        love.mouse.setCursor(cursor)
        self.menu["options"]["hoverPadding"] = 10
    elseif (self:isOverMenuButton("about"))
    then
        love.mouse.setCursor(cursor)
        self.menu["about"]["hoverPadding"] = 10
    else
        love.mouse.setCursor()
        self.menu["play"]["hoverPadding"] = 0
        self.menu["options"]["hoverPadding"] = 0
        self.menu["about"]["hoverPadding"] = 0
    end
end 


function Menu:drawMenuIcon(x, y, width, height, text, fontSize, padding)
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("line", x - padding, y - padding, width + 2 * padding, height + 2 * padding)
    love.graphics.setColor(self.menu["textColor"][1] / 255, self.menu["textColor"][2] / 255, self.menu["textColor"][3] / 255)
    font = love.graphics.setNewFont(fontSize)
    textWidth = font:getWidth(text)
    textHeight = font:getHeight()
    love.graphics.print(text, x + width / 2 - textWidth / 2, y + height / 4)
end


function Menu:isOverMenuButton(menuButton)
    mouseX = love.mouse.getX()
    mouseY = love.mouse.getY()

    if (mouseX > self.menu[menuButton]["x"] - self.menu[menuButton]["hoverPadding"] and mouseX < self.menu[menuButton]["x"] + self.menu[menuButton]["width"] + self.menu[menuButton]["hoverPadding"]and
        mouseY > self.menu[menuButton]["y"] - self.menu[menuButton]["hoverPadding"] and mouseY < self.menu[menuButton]["y"] + self.menu[menuButton]["height"] + self.menu[menuButton]["hoverPadding"])
    then
        return true
    end
    return false
end