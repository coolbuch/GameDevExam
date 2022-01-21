
Vehicle = {}
Vehicle.__index = Vehicle

function Vehicle:create(x, y)
    local vehicle = {}
    setmetatable(vehicle, Vehicle)
    vehicle.velocity = Vector:create(love.math.random() / 2, love.math.random() / 2)
    vehicle.acceleration = Vector:create(0, 0)
    vehicle.location = Vector:create(x, y)
    vehicle.r = 4
    vehicle.vertices = {0, -vehicle.r * 2, -vehicle.r, vehicle.r * 2, vehicle.r, vehicle.r * 2}
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()
    
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
    love.graphics.setColor(1,1,1, 1)
    local theta = self.velocity:heading() + math.pi / 2
    love.graphics.push()
    love.graphics.translate(self.location.x, self.location.y)
    love.graphics.rotate(theta)
    love.graphics.polygon("fill", self.vertices)
    love.graphics.pop()
end



