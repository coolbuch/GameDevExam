require "vector"
require "vehicle"

numberOfVehicles = 50

function love.load()
  -- создаем массив агентов
  vehicles = {}
  for i = 0, numberOfVehicles do
    vehicles[i] = Vehicle:create(love.graphics.getWidth() * love.math.random(), love.graphics.getHeight() * love.math.random() )
  end
  
 
end

function love.draw()
  
  for i = 0, numberOfVehicles do
    vehicles[i]:draw()
  end
end

function love.update(dt)
  for i = 0, numberOfVehicles do
    vehicles[i]:update()
    vehicles[i]:borders()
  end
  
end


