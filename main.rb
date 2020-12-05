# coding: utf-8
require 'dxopal'
include DXOpal

require_remote 'mob.rb'

Image.register(:mob, 'images/teki.png')

Window.load_resources do
  Window.width = 800
  Window.height = 480
  
#  x = 240
#  y = 400

mob_image = Image[:mob]
mobs = []
10.times do
  mobs << Mob.new(rand(800), rand(480), mob_image)
end  
  
  
  Window.loop do
#    Window.draw_circle_fill(x,y,10,C_RED)
#    x = x + Input.x * 2
#    y = y + Input.y * 2
  for Mob in mobs do
#    Mob::move_or_not = [true,false].sample
  end
  
  Sprite.update(mobs)
  Sprite.draw(mobs)
  
  end
end