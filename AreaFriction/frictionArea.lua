FrictionArea = {}
FrictionArea.__index = FrictionArea

function FrictionArea:create(x, y, radius, force, isPositive)
    local frictionArea = {}
    setmetatable(frictionArea, FrictionArea)
    
    
    frictionArea.force = force
    frictionArea.location = Vector:create(x,y)
    frictionArea.radius = radius
    frictionArea.isPositive = isPositive
    
    return frictionArea
end

function FrictionArea:update()
  
end

function FrictionArea:draw()
  love.graphics.push()
  if (not self.isPositive) then
    love.graphics.setColor(200/255, 100/255, 100/255, 1)
  else
    love.graphics.setColor(100/255, 200/255, 100/255, 1)
  end
  love.graphics.circle("fill",self.location.x, self.location.y, self.radius)
  love.graphics.pop()
end