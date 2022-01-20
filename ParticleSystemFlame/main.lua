function love.load()
  windForce = 2 -- отрицательное значение ветер влево, положительное вправо
  
  img = love.graphics.newImage("/sprites/texture.png")
  firepit_img = love.graphics.newImage("/sprites/fireplace2.png")
  background_img = love.graphics.newImage("/sprites/background.jpg")
  shezlong1_img = love.graphics.newImage("/sprites/shezlong.png")
  shezlong2_img = love.graphics.newImage("/sprites/shezlong.png")
  
  pSystem = love.graphics.newParticleSystem(img, 15000)
  pSystem:setParticleLifetime(0.5,1)
  
  pSystem:setLinearAcceleration(windForce * 30, 0, windForce * 100, 0)
  pSystem:setSizes(0.3, 0.4, 0.5)
  pSystem:setDirection(math.pi * 3/ 2)
  pSystem:setSizeVariation(1)
  pSystem:setSpeed(75)
  pSystem:setEmissionArea("normal", 15, 5, 0, false)
  --pSystem:setSpin(0, 1)
  pSystem:setColors(237/255, 98/255, 12/255, 1, 242/255, 198/255, 22/255, 1, 1, 1, 1, 1)
  pSystem:setEmissionRate(3000)
end

function love.draw()
  love.graphics.draw(background_img, 0, 0, 0, 0.55, 0.5)
  love.graphics.draw(shezlong1_img, 0, 350, 0, 0.3, 0.3)
  love.graphics.draw(shezlong2_img, 800, 350, 0, -0.3, 0.3)
  love.graphics.draw(firepit_img,  love.graphics.getWidth() / 2 - 100, 400, 0 , 0.3, 0.3)
  love.graphics.draw(pSystem, love.graphics.getWidth() / 2 - 5 , 430)
  
end

function love.update(dt)
  pSystem:update(dt)
end