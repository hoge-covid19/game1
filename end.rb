class Fin
    
  def initialize(y)
    @fin_y = y
  end
    def update
      @fin_y -= 1
      Window.draw_font(100, @fin_y, "製作者", Font.default)
      Window.draw_font(100, @fin_y+25,"J1633　升田　圭亮", Font.default)
      Window.draw_font(100, @fin_y+50,"J1627　日野　鎌", Font.default)
      Window.draw_font(100, @fin_y+75,"J1761　ヴィンセン", Font.default)
      Window.draw_font(100, @fin_y+100,"コロナには気を付けましょう．", Font.default)
      Window.draw_font(100, @fin_y+125,"手洗い", Font.default)
      Window.draw_font(100, @fin_y+150,"うがい", Font.default)
      Window.draw_font(100, @fin_y+175,"マスクの着用", Font.default)
      Window.draw_font(100, @fin_y+200,"三密の回避", Font.default)
      Window.draw_font(100, @fin_y+225,"換気", Font.default)
    end
end