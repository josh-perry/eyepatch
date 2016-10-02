# eyepatch
Eyepatch is a tiny LÖVE library for displaying scalable 9-patch images.

## Example
```lua
local eyepatch = require("eyepatch")
local eyepatchExample = nil

function love.load()
    eyepatchExample = eyepatch:load(love.graphics.newImage("9patch.png"), 16)
end

function love.draw()
    local x, y = 100, 100
    local w, h = 200, 150
    eyepatchExample:draw(x, y, w, h)
end
```
