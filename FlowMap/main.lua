require "vector"
require "vehicle"
require "flowMap"

function love.load()
  vehicle = Vehicle:create(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
  --flowArea = FlowArea:create( love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 0)
  flowMap = FlowMap:create(30, 20)
end

function love.draw()
  flowMap:draw()
  vehicle:draw()
  
end

function love.update(dt)
  vehicle:update()
  vehicle:borders()
  flowMap:update()
end


