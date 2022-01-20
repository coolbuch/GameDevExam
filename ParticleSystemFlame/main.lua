function love.load()
  windForce = -0.3 -- отрицательное значение ветер влево, положительное вправо
  
  img = love.graphics.newImage("/sprites/texture.png")
  firepit_img = love.graphics.newImage("/sprites/fireplace.png")
  
  pSystem = love.graphics.newParticleSystem(img, 4000)
  pSystem:setParticleLifetime(0.5,1)
  
  pSystem:setLinearAcceleration(windForce * 30, 0, windForce * 100, 0)
  pSystem:setSizes(0.3, 0.4, 0.5)
  pSystem:setDirection(math.pi * 3/ 2)
  pSystem:setSizeVariation(1)
  pSystem:setSpeed(50)
  pSystem:setEmissionArea("normal", 5, 5, 0, false)
  --pSystem:setSpin(0, 1)
  pSystem:setColors(237/255, 98/255, 12/255, 1, 242/255, 198/255, 22/255, 1, 1, 1, 1, 1)
  pSystem:setEmissionRate(800)
end

function love.draw()
  
  love.graphics.draw(firepit_img,  love.graphics.getWidth() / 2, 300, -0.2 , 0.1, 0.1)
  love.graphics.draw(pSystem, love.graphics.getWidth() / 2 + 43, 300)
end

function love.update(dt)
  pSystem:update(dt)
end