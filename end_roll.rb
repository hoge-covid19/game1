#ゲームクリア画面の描画クラス
class END_ROLL
    def initialize(y)
        @fin_y = y
    end
    
    def update
        @fin_y -= 0.5
        Window.draw_font(200,@fin_y,"製作者",Font.default,color:C_BLACK)
        Window.draw_font(200,@fin_y+25,"j1633 升田 圭亮",Font.default,color:C_BLACK)
        Window.draw_font(200,@fin_y+50,"j1627 日野 鎌",Font.default,color:C_BLACK)
        Window.draw_font(200,@fin_y+75,"j1761 ヴィンセン",Font.default,color:C_BLACK)
        Window.draw_font(200,@fin_y+125,"皆さんマスクつけていますか？",Font.default,color:C_BLACK)
        Window.draw_font(200,@fin_y+150,"手洗いうがい消毒してますか？",Font.default,color:C_BLACK)
        Window.draw_font(200,@fin_y+175,"冬に換気しろって言ったてつらいですよね",Font.default,color:C_BLACK)
        Window.draw_font(200,@fin_y+200,"ソーシャルディスタンス　　密です密です",Font.default,color:C_BLACK)
        Window.draw_font(200,@fin_y+225,"３密　　　アベノマスク　　　Go TOキャンペーン",Font.default,color:C_BLACK)
        Window.draw_font(200,@fin_y+275,"コロナが発生してから約１年…",Font.default,color:C_BLACK)
        Window.draw_font(200,@fin_y+300,"いつになったら収まるのか…",Font.default,color:C_BLACK)
        Window.draw_font(200,@fin_y+325,"わかりませんが皆さん頑張りましょう！！！",Font.default,color:C_BLACK)
        Window.draw_font(200,@fin_y+325,"音源引用元: 魔王魂",Font.default,color:C_BLACK)
    end
end