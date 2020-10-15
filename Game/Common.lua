Common = Object:extend()



function Common:new()
    
end


function Common:onHover()
    local cursor = love.mouse.getSystemCursor("hand")
    love.mouse.setCursor(cursor)
    self.padding = 10
end 

function Common:resetHover()
    love.mouse.setCursor()
    self.padding = 0
end 
