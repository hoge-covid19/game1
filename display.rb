class Display
    #タイトル画面の表示
    def title
        Window.draw_font(330, 190, "PRESS ENTER", Font.default, color:C_RED)
        Window.draw_font(330, 260, "SAVE PATIENT", Font.default,color:C_BLACK)
    end
    #プレイ中の画面表示
    def play
         # 背景とスコア表示
        Window.draw_box_fill(0, 0, Window.width, Window.height, [224, 224, 224])
        #playerライフ表示
        Window.draw_font(5, 10, "LIFE : #{GAME_INFO[:life]}", Font.default,color:C_BLACK)
        #摂取可能なワクチンの残り
        Window.draw_font(5, 70, "SLOT : #{GAME_INFO[:vaccine]}", Font.default,color:C_BLACK)
    end
    #ゲームオーバー画面の表示
    def game_over
        Window.draw_font(330, 190, "PRESS ENTER", Font.default,color:C_RED)
        Window.draw_font(330, 260, "GAME OVER", Font.default,color:C_BLACK)
    end
    #ゲームクリア画面の表示
    def game_clear
        Window.draw_font(330, 190, "PRESS ENTER", Font.default,color:C_RED)
        Window.draw_font(330, 260, "GAME CLEAR", Font.default,color:C_BLACK)
        Window.draw_font(220, 290, "全員のワクチン接種に成功しました", Font.default,color:C_BLACK)
    end
end
