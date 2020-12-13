class Player < Sprite
    def initialize
       x = Window.width / 2
       y = GROUND_Y - Image[:player].height
       image = Image[:player]
       super(x, y, image)
       # 当たり判定を円で設定(中心x, 中心y, 半径)
        self.collision = [image.width / 2, image.height / 2, 16]
    end
              
    #移動処理(xからself.xになった)
    def update
        if Input.key_down?(K_LEFT) && self.x > 0
            self.x -= 8
        elsif Input.key_down?(K_RIGHT) && self.x < (Window.width - Image[:player].width)
            self.x += 8
        elsif Input.key_down?(K_UP) && self.y > 0
            self.y -= 8
        elsif Input.key_down?(K_DOWN) && self.y < (Window.height - Image[:player].height)
            self.y += 8
        end
    end
end
