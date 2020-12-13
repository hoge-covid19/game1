class Player < Sprite
  def initialize(x,y,image)
    @tamas = []
    @tama_img = Image[:tama]
    super(x, y, image)
  end
  def update
    self.x += Input.x * 2
    self.y += Input.y * 2
    if Input.key_push?(K_SPACE)
      @tamas << Tama.new(self.x,self.y,@tama_img)
    end
    Sprite.update(@tamas)
    Sprite.draw(@tamas)
  end
end