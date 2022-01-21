
Vehicle = {}
Vehicle.__index = Vehicle

function Vehicle:create(x, y)
    local vehicle = {}
    setmetatable(vehicle, Vehicle)
    vehicle.velocity = Vector:create(love.math.random() / 5, love.math.random() / 5)
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
  
    local theta = self.velocity:heading() + math.pi / 2
    love.graphics.push()
    love.graphics.translate(self.location.x, self.location.y)
    love.graphics.rotate(theta)
    love.graphics.polygon("fill", self.vertices)
    love.graphics.pop()
end

function Vehicle:checkCollision(flowMap)
  
  array = flowMap:getArray()
  
  x = flowMap:getX()
  y = flowMap:getY()
  for i = 0, x do
    for j = 0, y do
      if (self.location.x > array[i][j].location.x) and (self.location.x < array[i][j].location.x + array[i][j].spriteSize) and
      (self.location.y > array[i][j].location.y) and (self.location.y < array[i][j].location.y + array[i][j].spriteSize) then
        if (array[i][j].direction == 0) then
          if (debug) then
           print("Collision with DOWN arrow")
          end
          self:applyForce(Vector:create(0, self.maxForce))
        end
        if (array[i][j].direction == 1) then
          if (debug) then
           print("Collision with LEFT arrow")
          end
          self:applyForce(Vector:create(-self.maxForce, 0))
        end
        if (array[i][j].direction == 2) then
          if (debug) then
           print("Collision with UP arrow")
          end
          self:applyForce(Vector:create(0, -self.maxForce))
        end
        if (array[i][j].direction == 3) then
          if (debug) then
           print("Collision with RIGHT arrow")
          end
          self:applyForce(Vector:create(self.maxForce, 0))
        end
      end
      
    end
  end
end

--function Vehicle:follow(flow)
 -- local desired = flow:lookup(self.location)
 --   if desired:mag() == 0 then
 --       return
 --   end
 --   desired:mul(self.maxSpeed)
 --   local steer = desired -- - self.velocity
  --  steer:limit(self.maxForce)
 --   self:applyForce(steer)
--end