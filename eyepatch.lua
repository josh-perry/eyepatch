local eyepatch = {}

local lg = love.graphics

function eyepatch:load(image, segmentSize)
    self.image = image
    self.segmentSize = segmentSize

    self.image:setFilter("nearest", "nearest")

    local s = segmentSize
    local sw = self.image:getWidth()
    local sh = self.image:getHeight()

    self.topLeft = lg.newQuad(0, 0, s, s, sw, sh)
    self.topMidd = lg.newQuad(s, 0, s, s, sw, sh)
    self.topRigh = lg.newQuad(s*2, 0, s, s, sw, sh)

    self.midLeft = lg.newQuad(0, s, s, s, sw, sh)
    self.midMidd = lg.newQuad(s, s, s, s, sw, sh)
    self.midRigh = lg.newQuad(s*2, s, s, s, sw, sh)

    self.botLeft = lg.newQuad(0, s*2, s, s, sw, sh)
    self.botMidd = lg.newQuad(s, s*2, s, s, sw, sh)
    self.botRigh = lg.newQuad(s*2, s*2, s, s, sw, sh)

    return self
end

function eyepatch:draw(x, y, w, h)
    local s = self.segmentSize
    local midHeightRemainder = h - (s*2)
    local midWidthRemainder = w - (s*2)

    local stretchH = midHeightRemainder / s
    local stretchW = midWidthRemainder / s

    -- Top
    lg.draw(self.image, self.topLeft, x, y)
    lg.draw(self.image, self.topRigh, (x + w) - s, y)
    lg.draw(self.image, self.topMidd, x + s, y, 0, stretchW, 1)

    -- Middle
    lg.draw(self.image, self.midLeft, x, y + s, 0, 1, stretchH)
    lg.draw(self.image, self.midRigh, (x + w) - s, y + s, 0, 1, stretchH)
    lg.draw(self.image, self.midMidd, x + s, y + s, 0, stretchW, stretchH)

    -- Bottom
    lg.draw(self.image, self.botLeft, x, (y + h) - s)
    lg.draw(self.image, self.botRigh, (x + w) - s, (y + h) - s)
    lg.draw(self.image, self.botMidd, x + s, (y + h) - s, 0, stretchW, 1)
end

return eyepatch
