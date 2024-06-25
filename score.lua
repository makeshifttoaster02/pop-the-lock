Score = {}

function Score:load()
  self.x = Lock.x
  self.y = Lock.y
  self.score = 0
  self.font = love.graphics.newFont(24)
  self.winningScore = 30
end

function Score:draw()
  love.graphics.setColor(0, 0, 0)
  local fontHeight = self.font:getHeight()
  if self.score >= self.winningScore then
    local message = string.format("You Win! Retry?\nFinal Score: %d", self.score)
    local fontWidth = self.font:getWidth(message)
    love.graphics.print(message, self.x - fontWidth / 2, self.y - fontHeight / 2, 0, 2)
  elseif Player.gameOver then
    local message = string.format("Game Over! Retry?\nFinal Score: %d", self.score)
    local fontWidth = self.font:getWidth(message)
    love.graphics.print(message, self.x - fontWidth / 2, self.y - fontHeight * 2 / 2, 0, 2)
  else
    local message = tostring(self.score)
    local fontWidth = self.font:getWidth(message)
    love.graphics.print(message, self.x - fontWidth / 2, self.y - fontHeight / 2, 0, 2)
  end
  love.graphics.setColor(1, 1, 1)
end