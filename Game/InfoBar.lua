require "GameLua/Text"
InfoBar = Object:extend()


--[[ 
    InfoBar constructor
]]
function InfoBar:new()
    self.x = 0
    self.y = 0
    self.width = love.graphics.getWidth()
    self.height = 40
    self.color = {126, 133, 122}
end 


--[[ 
    Function that draws upper bar 
]]
function InfoBar:draw(hearts)
    love.graphics.setColor(self.color[1]/255, self.color[2]/255, self.color[3]/255)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.setColor(1, 1, 1)
    Text(50, 10, "Lives "..hearts.hearts, 18):draw()
end 


--[[ Function that updates ball position
     and checks for collisions
]]
function InfoBar:update(dt, paddle)

end 

