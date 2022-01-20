FlowArea = {}
FlowArea.__index = FlowArea

function FlowArea:create(x, y, dir)
    local flowArea = {}
    setmetatable(flowArea, FlowArea)
    arrow_img = love.graphics.newImage("sprites/arrow.png")
    flowArea.location = Vector:create(x,y)
    flowArea.direction = dir
    force = 0.0001
    flowArea.spriteSize = 16
    return flowArea
end

function FlowArea:update()
  
end

function FlowArea:draw()
  
  love.graphics.push()
  if (self.direction == 0) then
    love.graphics.draw(arrow_img, self.location.x + self.spriteSize, self.location.y, math.pi / 2)
  end
  if (self.direction == 1) then
    love.graphics.draw(arrow_img, self.location.x + self.spriteSize , self.location.y + self.spriteSize , math.pi)
  end
  if (self.direction == 2) then
    love.graphics.draw(arrow_img, self.location.x, self.location.y + self.spriteSize , math.pi * 3 / 2)
  end
  if (self.direction == 3) then
     love.graphics.draw(arrow_img, self.location.x , self.location.y , 0)
  end
  love.graphics.pop()
end