Cherry = {}

function Cherry:load()
  self.x = Player.x + Player.width / 2
  self.y = Player.y + Player.height / 2
  self.radius = Player.width * 1.5
  self.angle = AdjustAngle(Player.angle + math.pi + math.random(-90, 90) * math.pi / 180)
  self.appear = true
end

function Cherry:update(dt)

end

function Cherry:draw() 
  if self.appear then
    love.graphics.push()
    love.graphics.setColor(237 / 255, 173 / 255, 233 / 255)
    love.graphics.translate(Lock.x, Lock.y)
    love.graphics.rotate(self.angle)
    love.graphics.circle("fill", self.x, self.y, self.radius)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.pop()
  end
end