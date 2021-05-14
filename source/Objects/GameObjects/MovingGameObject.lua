MovingGameObject = Object:extend()

function MovingGameObject:new(position, speed, acceleration, angel, angel_speed)
    self.position = position or {x = 200, y = 200}

    self.speed = speed or 0
    self.acceleration = acceleration or 0

    self.angel = angel or 0
    self.angel_speed = angel_speed or 0

    self.timer = Timer()
end

function MovingGameObject:update(dt)
    self.timer:update(dt)

    self.speed = self.speed + self.acceleration
    self.position.x = self.position.x + math.cos(self.angel) * self.speed * dt
    self.position.y = self.position.y + math.sin(self.angel) * self.speed * dt

    self.angel = self.angel_speed * dt

end

function MovingGameObject:draw()
    love.graphics.setColor(self.color.r, self.color.g, self.color.b, self.color.a)
end