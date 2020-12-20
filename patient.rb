# 患者クラス1
class Patient1 < Sprite  
    
    def initialize
        image = Image[:patient1]
        x = rand(Window.width - image.width)
        y = rand(Window.height - image.height)
        @dx = rand(1..4)
        @dy = rand(1..4)
        super(x,y, image)
        self.collision = [image.width / 2, image.height / 2, 16]
    end

    def update
      
        self.x += @dx
        self.y += @dy
        
        if self.x <= 0 || self.x > (Window.width - 32)
            self.x = self.x - @dx
            @dx = @dx*-1
        end
        
        if self.y <= 0 || self.y > (Window.height - 32) 
            self.y = self.y - @dy
            @dy = @dy*-1 
        end
        
            
        # ワクチンと衝突したとき呼ばれるメソッド
        def shot(other)
            Sound[:hit_vac].play
            self.vanish
        end
     
        # playerと衝突したとき呼ばれるメソッド
        def hit(other)
            Sound[:damage].play
            self.vanish
            GAME_INFO[:life] -= 1
        end
    end
end
    
    
# 患者クラス2 (ときより現れて「くしゃみ」をする)\
class Patient2 < Sprite
    
    #初期化
    def initialize
        image = Image[:patient2]
        x = rand(Window.width - image.width)
        y = 0
        @dx = rand(1..4)
        @dy = rand(1..4)
        super(x, y, image)
        self.collision = [image.width / 2, image.height / 2, 16]
    end

    def update
        
        self.x+=@dx
        self.y+=@dy
        
        if self.x <= 0 || self.x > (Window.width - 32)
            self.x = self.x - @dx
            @dx = @dx*-1
        end
        
        if self.y <= 0 || self.y > (Window.height - 32) 
            self.y = self.y - @dy
            @dy = @dy*-1 
        end
        
            
        # ワクチンと衝突したとき呼ばれるメソッド
        def shot(other)
            Sound[:hit_vac].play
            self.vanish
        end
     
        # playerと衝突したとき呼ばれるメソッド
        def hit(other)
            Sound[:damage].play
            self.vanish
            GAME_INFO[:life] -= 1
        end
            
    end
end



# 患者を管理するクラス
class Patients
    
    attr_accessor :patients
    
    # 患者の数
    N = 15
    
    def initialize
        @patients = []
        
        N.times do
            r = rand(1..100)
            if r < 80
                @patients.push(Patient1.new)
            else
                @patients.push(Patient2.new)
            end
        end
    end
    
    def update(player,bullets)
        @patients.each{|x| x.update(player)}
        # playerとpatientsが衝突しているかチェックする。衝突していたらhitメソッドが呼ばれる
        Sprite.check(player,@patients)
        #Sprite.check(bullets,@patients)
        Sprite.clean(@patients)
    end
    
    def draw
        Sprite.draw(@patients)
    end
end
