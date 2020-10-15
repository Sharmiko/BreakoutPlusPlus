InfoBar = Object:extend()


--[[ 
    InfoBar constructor
]]
function InfoBar:new()
    self.x = 0
    self.y = 0
    self.width = love.graphics.getWidth()
    self.height = 40
    self.color = Colors["infoBarColor"]
end 


--[[ 
    Function that draws upper bar 
]]
function InfoBar:draw()
    love.graphics.setColor(self.color)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.setLineWidth(2)
    love.graphics.setColor(0, 0, 0)
    love.graphics.line(self.x, self.y + self.height, self.width, self.height)
    love.graphics.setColor(1, 1, 1)
end 


--[[ Function that updates ball position
     and checks for collisions
]]
function InfoBar:update(dt, paddle)

end 

