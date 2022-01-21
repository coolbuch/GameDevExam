FrictionArea = {}
FrictionArea.__index = FrictionArea

function FrictionArea:create(x, y, isPositive)
    local frictionArea = {}
    setmetatable(frictionArea, FrictionArea)
    
    
    frictionArea.force = 0.0001
    frictionArea.location = Vector:create(x,y)
    frictionArea.radius = 300
    frictionArea.isPositive = isPositive
    
    return frictionArea
end

function FrictionArea:update()
  
end

function FrictionArea:draw()
  love.graphics.push()
  love.graphics.setColor(200/255, 100/255, 100/255, 1)
  love.graphics.circle("fill",self.location.x, self.location.y, self.radius)
  love.graphics.pop()
end