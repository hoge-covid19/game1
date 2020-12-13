class Tama < Sprite
    def initialize(x,y,image)
        super(x, y, image)
    end
    def update
        self.y -= 10
        if self.y <= 0
          self.vanish
        end
    end
    
    def hit
        self.vanish
    end
end

