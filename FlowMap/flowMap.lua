require "flowArea"

FlowMap = {}
FlowMap.__index = FlowMap

function FlowMap:create(x, y) 
    local flowMap = {}
    setmetatable(flowMap, FlowMap)
    flowMap.flowAreaArray = {}
    flowMap.spacing = 14
    flowMap.spriteSize = 16
    flowMap.x = x
    flowMap.y = y
    for i = 0, x do
      flowMap.flowAreaArray[i] = {}
      for j = 0, y do
        dir = 0
        if (i % 2 == 0) then
          if (j % 2 == 0) then
            dir = 2
          else
            dir = 3
          end
        else
          if (j % 2 == 1) then
            dir = 1
          end
        end
        flowMap.flowAreaArray[i][j] = FlowArea:create(i * (flowMap.spriteSize + flowMap.spacing) + 10, j * (flowMap.spriteSize + flowMap.spacing) + 10, dir)
      end
    end
    return flowMap
end

function FlowMap:update()
  for i = 0, self.x do
    for j = 0, self.y do
      self.flowAreaArray[i][j]:update()
    end
  end
end

function FlowMap:draw()
  for i = 0, self.x do
    for j = 0, self.y do
      self.flowAreaArray[i][j]:draw()
    end
  end
end

function arrayInit(x, y)
  
end