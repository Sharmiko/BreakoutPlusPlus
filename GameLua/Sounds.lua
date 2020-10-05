Sounds = Object:extend()


--[[ 
    Sounds constructor
]]
function Sounds:new()
    self.buttonHover = love.audio.newSource('sounds/a.wav', 'static')
end 

