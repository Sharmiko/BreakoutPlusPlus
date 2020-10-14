ChoiceBox = Object:extend()

--[[ 
    ChoiceBox constructor
]]
function ChoiceBox:new(text, textColor, buttonList)
    local borderWidth = 500
    local borderHeight = 300
    self.border = {
        x = love.graphics.getWidth() / 2 - borderWidth / 2,
        y = love.graphics.getHeight() / 2 - 100,
        width = borderWidth,
        height = borderHeight
    }

    self.buttons = buttonList
    self:initButtons()

    self.text = Text(self.border.x + self.border.width / 2, self.border.y + 50, text, 24)
    self.textColor = textColor
end 


function ChoiceBox:initButtons()
    if #self.buttons == 2
    then  
        self.buttons[1].x = self.border.x + 50
        self.buttons[1].y = self.border.y + 150
        self.buttons[2].x = self.border.x + self.border.width - 50 - self.buttons[1].width
        self.buttons[2].y = self.border.y + 150
    end 
end 


--[[ 

]]
function ChoiceBox:draw()
    for i=1, #(self.buttons)
    do
        self.buttons[i]:draw()
    end 
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("line", self.border.x, self.border.y, self.border.width, self.border.height)
    love.graphics.setColor(self.textColor[1] / 255, self.textColor[2] / 255, self.textColor[3] / 255)
    self.text:draw()
end 


--[[ 

]]
function ChoiceBox:update(dt)
    local cursor = love.mouse.getSystemCursor("hand")
    for idx, button in pairs(self.buttons)
    do
        if button:isHover()
        then
            if (love.mouse.isDown(1))
            then
                if idx == 1
                then
                    Utils:resetGame()
                    stateMachine:change('menu')
                elseif idx == 2
                then 
                    Utils:resetGame()
                    bricks = Bricks(LevelsState():getLevelData(gCurrentLevel))
                    stateMachine:change('serve', bricks)
                end
            end 
            button.padding = 10
            love.mouse.setCursor(cursor)
            break 
        else
            love.mouse.setCursor()
            button.padding = 0
        end 
    end 
end 

