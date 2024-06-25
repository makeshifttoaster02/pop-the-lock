Lock = {}

function Lock:load()
  self.x = love.graphics.getWidth() / 2
  self.y = love.graphics.getHeight() / 2
  self.radius = love.graphics.getHeight() / 2 * (3/4)
end

function Lock:draw()
  love.graphics.circle("fill", self.x, self.y, self.radius)
end