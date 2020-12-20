# アイテムを表すクラス
class Item < Sprite  
    def initialize(image)
        x = rand(Window.width - image.width)
        y = 0
        super(x, y, image)
        @speed_y = rand(9) + 4
    end

    def update
        self.y += @speed_y
        if self.y > Window.height
            self.vanish
        end
        
    end
end
  
# 加点アイテムのクラス
class Apple < Item
    def initialize
        super(Image[:apple])
        # 衝突範囲を円で設定(中心x, 中心y, 半径)
        self.collision = [image.width / 2, image.height / 2, 16]
    end
    
    # playerと衝突したとき呼ばれるメソッドを追加
    def hit
        # 効果音を鳴らす
        Sound[:get].play
        self.vanish
        GAME_INFO[:life] += 1
    end
end


# アイテム群を管理するクラスを追加
class Items
# 同時に出現するアイテムの個数
N = 1

    def initialize
        @items = []
    end

    def update(player)
        @items.each{|x| x.update(player)}
        
        # playerとitemsが衝突しているかチェックする。衝突していたらhitメソッドが呼ばれる
        Sprite.check(player, @items)
        Sprite.clean(@items)
        
        #r0<5ならアイテムを落とす
        r0 = rand(1..100)
        if r0 <5
            (N - @items.size).times do
            # どっちのアイテムにするか、ランダムで決める
            @items.push(Apple.new)
            end
        end

    def draw
        Sprite.draw(@items)
    end
    end
end
