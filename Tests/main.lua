function love.load()
    Object = require "classic"
    require "CollisionTests"
    collisionTests = CollisionTests()

    love.window.setMode(800, 800)
end 


function love.update(dt)
    collisionTests:update()
end 


function love.draw()
    love.graphics.setBackgroundColor(133/255, 205/255, 202/255, 0)
    collisionTests:draw()
end 