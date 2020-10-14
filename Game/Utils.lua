Utils = Object:extend()



function Utils:new()
    
end


function Utils:resetGame()
    gHeart = Heart(1)

    gPaddle.x = love.graphics.getWidth() / 2 - gPaddle.width / 2
    gPaddle.y = love.graphics.getHeight() - gPaddle.height * 4
end 
