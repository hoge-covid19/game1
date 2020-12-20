class Player < Sprite
  def initialize(x,y,image)
    @tamas1 = []
    @tamas2 = []
    @tamas3 = []
    @tama_img = Image[:tama]
    super(x, y, image)
  end
  def update(time)
    self.x += Input.x * 2
    self.y += Input.y * 2
    if time%60 == 0 
      @tamas1 << Tama.new(self.x,self.y,@tama_img)
      @tamas2 << Tama.new(self.x,self.y,@tama_img)
      @tamas3 << Tama.new(self.x,self.y,@tama_img)
    end
    Sprite.update(@tamas1)
    Sprite.update(@tamas2)
    Sprite.update(@tamas3)
    Sprite.draw(@tamas1)
    Sprite.draw(@tamas2)
    Sprite.draw(@tamas3)
  end
end