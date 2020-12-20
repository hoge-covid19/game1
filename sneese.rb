#Patient2が放つ「くしゃみ」クラス
class Sneese < Sprite  
    #初期化
    def initialize(x,y)
        #画像登録
        image = Image[:bullet2]
        super(x, y, image)
        # 当たり判定を円で設定(中心x, 中心y, 半径)
        self.collision = [image.width / 2, image.height / 2, 16]
        #移動量
        @dx = rand(-6..6)
        @dy = rand(-6..6)
    end
    #移動処理
    def update
        self.x += @dx
        self.y += @dy
        #画面外に出た場合削除
        if self.x <= 0 || self.x > (Window.width - 32)
            self.vanish
        end
        
        if self.y <= 0 || self.y > (Window.height - 32) 
            self.vanish
        end
    end
    #プレイヤーと当たったとき
    def hit(other)
        Sound[:explosion].play
        GAME_INFO[:life] -= 1
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
        #発射したくしゃみのアップデート
        @sneeses.each{|x| x.update}
        #くしゃみとプレイヤーの当たり判定
        Sprite.check(player, @sneeses)
        Sprite.clean(@sneeses)
        #マスク未着用の患者(Patient2)からのみ、くしゃみを発射する
        patients.each{|patient|
            if patient.class.name == "Kernel::Patient2"
                if patient.y % 100 == 0
                    @sneeses.push(Sneese.new(patient.x,patient.y))
                end
            end
        }
        
    end 
    #描画
    def draw
         Sprite.draw(@sneeses)
    end
end