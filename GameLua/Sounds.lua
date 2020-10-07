Sounds = Object:extend()


--[[ 
    Sounds constructor
]]
function Sounds:new()
    self.buttonHover = love.audio.newSource('sounds/buttonHover.wav', 'static')
    self.brickHit = love.audio.newSource('sounds/brickHit.wav', 'static')
    self.ballHitsGround = love.audio.newSource('sounds/ballHitsGround.wav', 'static')
end 

