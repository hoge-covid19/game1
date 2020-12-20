#ハクション大魔王が放つ「くしゃみ」クラス
class Sneese < Sprite  
    #初期化
    def initialize(x,y,c)
        #画像登録
        image = Image[:bullet2]
        super(x, y, image)
        # 当たり判定を円で設定(中心x, 中心y, 半径)
        self.collision = [image.width / 2, image.height / 2, 16]
        #移動量
        @dx = 1
        @dy = 1
        #移動方向を調整する定数
        @c = c
    end
    #移動処理
    def update
        self.x += @c*@dx
        self.y += @c*@dy
        #画面外に出た場合削除
        if self.x <= 0 || self.x > (Window.width - 32)
            self.vanish
        end
        
        if self.y <= 0 || self.y > (Window.height - 32) 
            self.vanish
        end
    end
    #当たったとき
    def hit
        Sound[:explosion].play
        self.vanish
    end
end


# くしゃみを管理するクラス
class Sneeses
    attr_accessor :sneeses
    
    def initialize
        @sneeses = []
    end

    def update(player,patients)
        @sneeses.each{|x| x.update}

        Sprite.check(player, @sneeses)
        #p "p_x:#{patients.return_x}"
        #p "p_y:#{patients.return_y}"
        #if Input.key_push?(K_Z)
         #   r = rand(-2..2)
          #  @sneeses.push(Sneese.new(patients.x,patients.y,r))
        #end
        
        
    end 
    
    def draw
         Sprite.draw(@sneeses)
    end
end