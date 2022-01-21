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
  
  frictionArea = FrictionArea:create(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, false)
end

function love.draw()
  frictionArea:draw()
  for i = 0, numberOfVehicles do
    vehicles[i]:draw()
  end
end

function love.update(dt)
  for i = 0, numberOfVehicles do
    vehicles[i]:update()
    vehicles[i]:borders()
  end
  frictionArea:update()
end


