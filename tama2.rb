class Tama < Sprite
    def initialize(x,y,image)
        super(x, y, image)
        @speed = 10
        @angle1 = rand(360)
    end
    def update
        self.x += Math.cos(@angle1) * @speed
        self.y += Math.sin(@angle1) * @speed
        if self.x > 800 ||self.x <0||self.y>600||self.y<0
          self.vanish
        end
    end
    
    def hit
        self.vanish
    end
end
