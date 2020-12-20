
# アイテムを表すクラスを追加
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
  
# 加点アイテムのクラスを追加
class Apple < Item
    def initialize
        super(Image[:apple])
        # 衝突範囲を円で設定(中心x, 中心y, 半径)
        self.collision = [image.width / 2, image.height / 2, 56]
    end
    
    # playerと衝突したとき呼ばれるメソッドを追加
    def hit
        # 効果音を鳴らす
        Sound[:get].play
        self.vanish
        GAME_INFO[:score] += 10
    end
end

# 妨害アイテムのクラスを追加
class Bomb < Item
    def initialize
        super(Image[:enemy])
        # 衝突範囲を円で設定(中心x, 中心y, 半径)
        self.collision = [image.width / 2, image.height / 2, 42]
    end
    
    # playerと衝突したとき呼ばれるメソッドを追加
    def hit
        Sound[:explosion].play
        self.vanish
        # ゲームオーバー画面に遷移
        #GAME_INFO[:scene] = :game_over
        GAME_INFO[:score] += 10
    end
end

# アイテム群を管理するクラスを追加
class Items
# 同時に出現するアイテムの個数
N = 5

    def initialize
        @items = []
    end

    def update(player)
        @items.each{|x| x.update(player)}
        # playerとitemsが衝突しているかチェックする。衝突していたらhitメソッドが呼ばれる
        Sprite.check(player, @items)
        Sprite.clean(@items)
        
        (N - @items.size).times do
        # どっちのアイテムにするか、ランダムで決める
        if rand(1..100) < 40
            @items.push(Apple.new)
        else
            @items.push(Bomb.new)
        end
        end
    end

    def draw
        Sprite.draw(@items)
    end
end
