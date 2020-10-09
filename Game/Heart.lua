Heart = Object:extend()


--[[
    Initialize Heart object
]]
function Heart:new(numHearts)
    self.initHearts = numHearts
    self.hearts = numHearts 
    self.heartImage = love.graphics.newImage('assets/heart.png')
    self.emptyHeartImage = love.graphics.newImage('assets/empty_heart.png')
    self.heartImage:setFilter('nearest')
    self.emptyHeartImage:setFilter('nearest')
end 


--[[
    TODO: Draw Heart
]]
function Heart:draw()
    local width = self.heartImage:getWidth() 
    local startX = -width / 2
    local startY = -width / 2  - 5

    local emptyHearts = self.initHearts - self.hearts 

    for i=1, self.hearts 
    do 
        love.graphics.draw(self.heartImage, startX, startY, 0, 2)
        startX = startX + width / 2 + 5
    end 

    for i=1, emptyHearts
    do 
        love.graphics.draw(self.emptyHeartImage, startX, startY, 0, 2)
        startX = startX + width / 2 + 5
    end 
end

