#playerが放つワクチンのクラス
class Bullet < Sprite  
    #初期化
    def initialize(x,y)
        #画像登録
        image = Image[:bullet]
        super(x, y, image)
        # 当たり判定を円で設定(中心x, 中心y, 半径)
        self.collision = [image.width / 2, image.height / 2, 16]
    end
    #移動処理
    def update
        self.y -= 10
        #画面外に出た場合削除
        if self.y < 0
            self.vanish
        end
    end
    #当たったとき
    def hit(other)
        Sound[:explosion].play
        self.vanish
    end
end


# 弾丸を管理するクラス
class Bullets
    attr_accessor :bullets
    
    def initialize
        @bullets = []
    end

    def update(player,patients)
        @bullets.each{|x| x.update}

        Sprite.check(patients, @bullets)
        Sprite.clean(@bullets)

        if Input.key_push?(K_SPACE)
            @bullets.push(Bullet.new(player.x,player.y))
            GAME_INFO[:vaccine] -= 1
            if GAME_INFO[:saved] < 15 && GAME_INFO[:vaccine] <= 0
                GAME_INFO[:end_type] = 1
                GAME_INFO[:scene] = :game_over
            end
        end
        
        
    end 
    
    def draw
         Sprite.draw(@bullets)
    end
end