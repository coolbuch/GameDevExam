require "vector"
require "vehicle"
require "flowMap"

debug = false

numberOfVehicles = 50

function love.load()
  vehicles = {}
  for i = 0, numberOfVehicles do
    vehicles[i] = Vehicle:create(love.graphics.getWidth() * love.math.random(), love.graphics.getHeight() * love.math.random() )
  end
  --flowArea = FlowArea:create( love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 0)
  flowMap = FlowMap:create(30, 20)
end

function love.draw()
  flowMap:draw()
  
  for i = 0, numberOfVehicles do
    vehicles[i]:draw()
  end
end

function love.update(dt)
  for i = 0, numberOfVehicles do
    vehicles[i]:update()
    vehicles[i]:borders()
    vehicles[i]:checkCollision(flowMap)
  end
  flowMap:update()
  
end


