Player = {}

function Player:load()
  self.width = 10
  self.height = 20
  self.x = - self.width / 2
  self.y = - Lock.radius - self.height - 15
  self.rotVel = 0.5
  self.angle = 0
  self.gameOver = false
end

function Player:update(dt) 
  if not self.gameOver then
    self.angle = AdjustAngle(self.angle + self.rotVel * dt) 
  end
end

function Player:draw()
  love.graphics.push()
  love.graphics.translate(Lock.x, Lock.y)
  love.graphics.rotate(self.angle)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
  love.graphics.pop()
end

function Player:keypressed(key)
  if key == "space" then
    if not self.gameOver then
      if self.rotVel < 0 then
        self.rotVel = -self.rotVel + 0.1
      else
        self.rotVel = -self.rotVel - 0.1
      end

      if CheckOverlap(Player, Cherry) then
        Cherry.angle = AdjustAngle(self.angle + math.pi + math.random(-90, 90) * math.pi / 180)
        Score.score = Score.score + 1
        if Score.score >= Score.winningScore then
          self.rotVel = 0
          Cherry.appear = false
          self.gameOver = true
        end
      else
        self.gameOver = true
      end
    else
      Lock:load()
      Player:load()
      if not Cherry.appear then
        Cherry:load()
      end
      Score:load()
    end
  end
end