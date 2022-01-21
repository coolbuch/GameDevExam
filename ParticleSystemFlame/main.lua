timer = 0

debugOutput = false

lastWindForce = 0
generatedWindForce = 0
windForce = 0 -- отрицательное значение ветер влево, положительное вправо

function love.load()
  generatedWindForce = love.math.random() * 80 - 40
  -- загрузка картинок
  img = love.graphics.newImage("/sprites/texture.png")
  firepit_img = love.graphics.newImage("/sprites/fireplace2.png")
  background_img = love.graphics.newImage("/sprites/background.jpg")
  shezlong1_img = love.graphics.newImage("/sprites/shezlong.png")
  shezlong2_img = love.graphics.newImage("/sprites/shezlong.png")
  
  pSystem = love.graphics.newParticleSystem(img, 30000)
  -- настройки системы частиц
  pSystem:setParticleLifetime(0.5,1)
  pSystem:setLinearAcceleration(windForce * 3, 0, windForce * 10, 0)
  pSystem:setSizes(0.2, 0.25, 0.3)
  pSystem:setSizeVariation(1)
  pSystem:setDirection(math.pi * 3/ 2)
  pSystem:setSpeed(75)
  pSystem:setEmissionArea("normal", 15, 5, 0, false)
  --pSystem:setSpin(0, 1)
  pSystem:setColors(237/255, 98/255, 12/255, 1, 242/255, 198/255, 22/255, 1, 1, 1, 1, 1)
  pSystem:setEmissionRate(20000)
end

function love.draw()
  love.graphics.draw(background_img, 0, 0, 0, 0.55, 0.5)
  love.graphics.draw(shezlong1_img, 0, 350, 0, 0.3, 0.3)
  love.graphics.draw(shezlong2_img, 800, 350, 0, -0.3, 0.3)
  love.graphics.draw(firepit_img,  love.graphics.getWidth() / 2 - 100, 400, 0 , 0.3, 0.3)
  love.graphics.draw(pSystem, love.graphics.getWidth() / 2 - 5 , 430)
  if (debugOutput) then
    love.graphics.printf(tostring(timer), love.graphics.getWidth() / 2, 50, 200)
    love.graphics.printf(tostring(windForce), 50, 50, 200)
    love.graphics.printf(tostring(generatedWindForce), 50, 100, 200)
  end
end

function love.update(dt)
  pSystem:update(dt)
  timer = timer + dt
  if timer > 10 then 
    timer = 0
    changeWind()
  end
  if (timer < 10) then
    smoothlyMoveWind(lastWindForce, generatedWindForce)
  end
end

function changeWind()
  lastWindForce = windForce
  generatedWindForce = love.math.random() * 80 - 40
end

function smoothlyMoveWind(old, new)
  step = 0.05
  if (windForce > generatedWindForce) then
    windForce = windForce - step
  else
    windForce = windForce + step
  end
  pSystem:setLinearAcceleration(windForce * 3, 0, windForce * 10, 0)
end
