GameObject = Object:extend()

function GameObject:new(area, option)
    local option = option or {}
    if option then
        for key, value in ipairs(option) do
            self[key] = value
        end
    end

    self.area = area
    self.id = UUID()
    self.alive = true
    self.timer = Timer()
    self.draw_depth = 50

    if self.color == nil then
        self.color = {r = 1, g = 1, b = 1, a = 1}
    end
end

function GameObject:update(dt)
    if self.timer then self.timer:update(dt) end
end

function GameObject:draw()
    if self.color then love.graphics.setColor(self.color.r, self.color.g, self.color.b, self.color.a) end
end

function GameObject:destroy()


    print("Before collection: " .. collectgarbage("count")/1024)
    collectgarbage()
    print("After collection: " .. collectgarbage("count")/1024)
    print("Object count: ")
    local counts = type_count()
    for k, v in pairs(counts) do print(k, v) end
    print("-------------------------------------")

    for key, value in pairs(self) do
        if value then 
          if type(value) == "table" then
            for key, value in pairs(self[key]) do
              self[key] = nil
            end
          end
        end
        self[key] = nil
    end
    
    self = nil
    
    

    
    
end
