if arg[#arg] == "-debug" then
    require("mobdebug").start()
end
require("util")

local test = nil

function love.load()
    test = GameObject()
end

function love.update(dt)
    Lurker.update(dt)
    Timer:update(dt)
    if test then
        test:destroy()
        test = nil
    end
end

function love.draw()
    if test then
        test:draw()
    end
end
