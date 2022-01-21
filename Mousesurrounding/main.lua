require "vector"
require "vehicle"

numberOfVehicles = 50

function love.load()
  
  world = love.physics.newWorld(0, 0, true)
  
  circleBody = love.physics.newBody(world, love.mouse.getX(), love.mouse.getY(), "kinematic")
  shape = love.physics.newCircleShape(40)
  fixture = love.physics.newFixture(circleBody, shape)
  
  leftBorderBody = love.physics.newBody(world, 0, 0, "static")
  leftBorderShape = love.physics.newRectangleShape(20, 10000)
  leftBorderFixture = love.physics.newFixture(leftBorderBody, leftBorderShape)
  
  rightBorderBody = love.physics.newBody(world, love.graphics.getWidth(), 0, "static")
  rightBorderShape = love.physics.newRectangleShape(20, 10000)
  rightBorderFixture = love.physics.newFixture(rightBorderBody, rightBorderShape)
  
  upBorderBody = love.physics.newBody(world, 0, 0, "static")
  upBorderShape = love.physics.newRectangleShape(10000, 20)
  upBorderFixture = love.physics.newFixture(upBorderBody, upBorderShape)
  
  bottomBorderBody = love.physics.newBody(world, 0, love.graphics.getHeight(), "static")
  bottomBorderShape = love.physics.newRectangleShape(10000, 20)
  bottomBorderFixture = love.physics.newFixture(bottomBorderBody, bottomBorderShape)
  
  -- создаем массив агентов
  vehicles = {}
  for i = 0, numberOfVehicles do
    vehicles[i] = Vehicle:create(love.graphics.getWidth() * love.math.random(), love.graphics.getHeight() * love.math.random(), world)
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
    --vehicles[i]:borders()
    --vehicles[i]:checkCollisionWithOtherVehicles(vehicles, numberOfVehicles)
  end
  circleBody:setX(love.mouse.getX())
  circleBody:setY(love.mouse.getY())
  world:update(dt)
end


