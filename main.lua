local lg = love.graphics

local eyepatch = require("eyepatch")
local eyepatchExample = nil

local x, y = 100, 100
local w, h = 200, 150

function love.load()
    love.window.setTitle("eyepatch Example")

    eyepatchExample = eyepatch:load(lg.newImage("9patch.png"), 16)
end

function love.draw()
    eyepatchExample:draw(x, y, w, h)
end

function love.keypressed(key, isrepeat)
    if key == "escape" then
        love.event.quit()
    end
end
