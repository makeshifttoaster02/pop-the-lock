require("lock")
require("player")
require("cherry")
require("score")

math.randomseed(os.time())

function love.load()
  Lock:load()
  Player:load()
  Cherry:load()
  Score:load()
end

function love.update(dt)
  Player:update(dt)
end

function love.draw()
  Lock:draw()
  Cherry:draw()
  Player:draw()
  Score:draw()
end

function love.keypressed(key, scancode, isrepeat)
  Player:keypressed(key)
end

function CheckOverlap(a, b)
  local angleThreshold = math.acos((Cherry.y ^ 2 + Cherry.y ^ 2 - (Cherry.radius + Player.width / 2) ^ 2) / (2 * Cherry.y * Cherry.y)) * 1.5
  local angleDistance = math.abs(((a.angle + 5 * math.pi) % math.pi) - ((b.angle + 5 * math.pi) % math.pi))
  return angleDistance < angleThreshold
end

function AdjustAngle(angle)
  if angle < 0 then
    angle = angle + math.pi * 2
  end

  if angle > 2 * math.pi then
    angle = angle - math.pi * 2
  end

  return angle
end