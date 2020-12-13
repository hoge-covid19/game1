require 'dxopal'
include DXOpal
require_remote 'player.rb'
require_remote 'tama.rb'

Image.register(:player, 'images/player.png') 
Image.register(:tama, 'images/enemy.png') 

Window.load_resources do
  Window.width  = 800
  Window.height = 600
  Window.bgcolor = C_BLACK
  player_img = Image[:player]
  player_img.set_color_key([0, 0, 0])
  player = Player.new(400, 500, player_img)
  
  Window.loop do
    player.update
    player.draw
  end
end
