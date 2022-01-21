Vehicle = {}
Vehicle.__index = Vehicle

function Vehicle:create(x, y, world)
    local vehicle = {}
    setmetatable(vehicle, Vehicle)
    vehicle.velocity = Vector:create(0,0)
    vehicle.acceleration = Vector:create(0, 0)
    vehicle.location = Vector:create(x, y)
    vehicle.r = 5
    vehicle.vertices = {0, -vehicle.r * 2, -vehicle.r, vehicle.r * 2, vehicle.r, vehicle.r * 2}
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()
    
    vehicle.body = love.physics.newBody(world, vehicle.location.x, vehicle.location.y, "dynamic")
    vehicle.shape = love.physics.newRectangleShape(vehicle.r * 2, vehicle.r * 3)
    vehicle.fixture = love.physics.newFixture(vehicle.body, vehicle.shape)
    
    vehicle.maxSpeed = 0.0001
    vehicle.maxForce = 0.008
    vehicle.theta = 0
    vehicle.mouseRadius = 20
    return vehicle
end

function Vehicle:update()
    self:moveToMouse()
end

function Vehicle:applyForce(force)
    self.acceleration:add(force)
end


function Vehicle:draw()
    love.graphics.push()
    love.graphics.translate(self.body:getX(), self.body:getY())
    love.graphics.rotate(self.theta)
    love.graphics.polygon("fill", self.vertices)
    love.graphics.pop()
end


function Vehicle:moveToMouse()
  local mousePos = Vector:create(love.mouse.getX(), love.mouse.getY())
  local location = Vector:create(self.body:getX(), self.body:getY())
  --print(tostring(location))
  dir = mousePos - location
  dir = dir:norm()
  self.theta = dir:heading() + math.pi / 2
  --print(tostring(dir))
  self.body:setLinearVelocity(dir.x * 100, dir.y * 100)
end
