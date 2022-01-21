
Vehicle = {}
Vehicle.__index = Vehicle

function Vehicle:create(x, y)
    local vehicle = {}
    setmetatable(vehicle, Vehicle)
    vehicle.velocity = Vector:create(love.math.random() *2, love.math.random() *2)
    vehicle.acceleration = Vector:create(0, 0)
    vehicle.location = Vector:create(x, y)
    vehicle.r = 4
    vehicle.vertices = {0, -vehicle.r * 2, -vehicle.r, vehicle.r * 2, vehicle.r, vehicle.r * 2}
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()
    vehicle.currentColor = {1,1,1,1}
    vehicle.maxSpeed = 0.0001
    vehicle.maxForce = 0.008
    vehicle.theta = 0

    return vehicle
end

function Vehicle:update()
    self.velocity:add(self.acceleration)
    self.velocity:limit(self.maxSpeed)
    self.location:add(self.velocity)
    self.acceleration:mul(0)
end

function Vehicle:applyForce(force)
    self.acceleration:add(force)
end

function Vehicle:borders()
    if self.location.x < -self.r then
        self.location.x = width + self.r
    end

    if self.location.y < -self.r then
        self.location.y = height + self.r
    end

    if self.location.x > width + self.r then
        self.location.x = -self.r
    end

    if self.location.y > height + self.r then
        self.location.y = -self.r
    end
end

function Vehicle:draw()
    love.graphics.setColor(self.currentColor)
    local theta = self.velocity:heading() + math.pi / 2
    love.graphics.push()
    love.graphics.translate(self.location.x, self.location.y)
    love.graphics.rotate(theta)
    love.graphics.polygon("fill", self.vertices)
    love.graphics.pop()
end

function Vehicle:applyFriction(value)
  if (self.velocity:mag() > 0) then
    self.velocity:mul(value)
  end
end

function Vehicle:checkCollision(frictionAreas)
  for i=0, 1 do
    if ((self.location.x - frictionAreas[i].location.x) * (self.location.x - frictionAreas[i].location.x) + (self.location.y - frictionAreas[i].location.y) *(self.location.y - frictionAreas[i].location.y)  <= frictionAreas[i].radius * frictionAreas[i].radius) then
      if (not frictionAreas[i].isPositive) then
        self.currentColor = {1,0,0,1}
        self:applyFriction(frictionAreas[i].force)
      else
        self:applyFriction(frictionAreas[i].force)
        self.currentColor = {0,1,0,1}
      end
    end
  end
end


