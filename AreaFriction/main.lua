require "vector"
require "vehicle"
require "frictionArea"

numberOfVehicles = 50

function love.load()
  -- создаем массив агентов
  vehicles = {}
  for i = 0, numberOfVehicles do
    vehicles[i] = Vehicle:create(love.graphics.getWidth() * love.math.random(), love.graphics.getHeight() * love.math.random() )
  end
  
  frictionArea1 = FrictionArea:create(200, love.graphics.getHeight() / 2, 200,0.997, false) --торможение
  frictionArea2 = FrictionArea:create(800, love.graphics.getHeight() / 2, 300, 1.0015, true) -- ускорение
  frictionAreas = {}
  frictionAreas[0] = frictionArea1
  frictionAreas[1] = frictionArea2
end

function love.draw()
  for i = 0, 1 do
    frictionAreas[i]:draw()
  end
  for i = 0, numberOfVehicles do
    vehicles[i]:draw()
  end
end

function love.update(dt)
  for i = 0, numberOfVehicles do
    vehicles[i]:update()
    vehicles[i]:borders()
    vehicles[i]:checkCollision(frictionAreas)
  end
  for i = 0, 1 do
    frictionAreas[i]:update()
  end
end


