require 'dxopal'
include DXOpal
require_remote 'player2.rb'
require_remote 'tama2.rb'
require_remote 'end.rb'

Image.register(:player, 'images/player.png') 
Image.register(:tama, 'images/enemy.png') 

Window.load_resources do
  Window.width  = 800
  Window.height = 600
  Window.bgcolor = C_BLACK
  player_img = Image[:player]
  player_img.set_color_key([0, 0, 0])
  player = Player.new(400, 500, player_img)
  fin_flag = 0
  fin = Fin.new(600)
  time = 0
  
  Window.loop do
    if Input.key_push?(K_TAB)
      fin_flag = 1
    end
    if fin_flag == 0
      player.update(time)
      player.draw
    elsif fin_flag == 1
      Window.bgcolor = C_BLACK
      fin.update
    end
    time +=1
  end
end
