
function love.load()
  windForce = 0 -- отрицательное значение ветер влево, положительное вправо
  
  img = love.graphics.newImage("snowflake.png")
  pSystem = love.graphics.newParticleSystem(img, 200)
  pSystem:setParticleLifetime(4,20)
  pSystem:setRadialAcceleration(-1, 1)
  pSystem:setEmissionArea("ellipse", love.graphics.getWidth(), 0, 0, false)
  pSystem:setLinearAcceleration(windForce * 15, 0, windForce * 50, 0)
  pSystem:setSizes(0.3, 0.5, 0.7)
  pSystem:setDirection(math.pi/ 2)
  pSystem:setSizeVariation(1)
  pSystem:setSpeed(150)
  pSystem:setSpin(0, 1)
  pSystem:setTangentialAcceleration(-10, 10)
  pSystem:setColors(1,1,1,1, 1, 1, 1, 0)
  pSystem:setEmissionRate(20)
end

function love.draw()
  love.graphics.draw(pSystem, love.graphics.getWidth() / 2, -70)
end

function love.update(dt)
  pSystem:update(dt)
end