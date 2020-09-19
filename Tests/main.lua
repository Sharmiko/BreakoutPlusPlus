function love.load()
    Object = require "classic"
    require "CollisionTests"
    require "DrawTests"
    --collisionTests = CollisionTests()
    drawTests = DrawTests()
    love.window.setMode(800, 800)
end 


function love.update(dt)
    drawTests:update(dt)
    --collisionTests:update()
end 


function love.draw()
    love.graphics.setBackgroundColor(133/255, 205/255, 202/255, 0)
    drawTests:draw()
    --collisionTests:draw()
end 