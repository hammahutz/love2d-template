Player = MovingGameObject:extend()

function Player:new()
    Player.super.new()
end

function Player.update(dt)
    Player.super.update(self, dt)
end

function Player.draw()
    Player.super.draw()
end