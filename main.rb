require "dxopal"
require_remote "player.rb"
require_remote "item.rb"
require_remote "bullet.rb"
require_remote "sneese.rb"
require_remote "load.rb"
require_remote "patient.rb"

include DXOpal

# ゲームの状態を記憶するハッシュ
GAME_INFO = {
  life: 5,
  saved: 0,
  vaccine: 20,
  scene: :title, 
  end_type: 0
}


Window.width = 800
Window.height = 480


Window.load_resources do
    player = Player.new
    items = Items.new
    patients = Patients.new
    bullets = Bullets.new
    #sneeses = Sneeses.new

    Window.loop do
        # 背景とスコア表示
        Window.draw_box_fill(0, 0, Window.width, Window.height, [224, 224, 224])
        #playerライフ表示
        Window.draw_font(5, 10, "LIFE : #{GAME_INFO[:life]}", Font.default,color:C_BLACK)
        #摂取可能なワクチンの残り
        Window.draw_font(5, 70, "SLOT : #{GAME_INFO[:vaccine]}", Font.default,color:C_BLACK)

        # シーンごとの処理
        case GAME_INFO[:scene]
        when :title
            # タイトル画面
            Window.draw_font(330, 190, "PRESS ENTER", Font.default, color:C_RED)
            Window.draw_font(330, 260, "SAVE PATIENT", Font.default,color:C_BLACK)
            # enterキーでゲームスタート
            if Input.key_push?(K_RETURN)
                GAME_INFO[:scene] = :playing
            end
        when :playing
            # ゲーム中
            player.update
            items.update(player)
            bullets.update(player,patients.patients)
            patients.update(player,bullets.bullets)
            #sneeses.update(player,patients.patients)
            player.draw
            items.draw
            patients.draw
            bullets.draw
            #sneeses.draw
        
        when :game_over
            # ゲームオーバー画面
            Window.draw_font(330, 190, "PRESS ENTER", Font.default,color:C_RED)
            Window.draw_font(330, 260, "GAME OVER", Font.default,color:C_BLACK)
            if GAME_INFO[:end_type] == 0
                Window.draw_font(260, 290, "自分が感染してしまいました", Font.default,color:C_BLACK)
            else 
                 Window.draw_font(260, 290, "ワクチンがなくなりました", Font.default,color:C_BLACK)
            end
            # enterキーが押されたらリスタート
            if Input.key_push?(K_ENTER)
                player = Player.new
                items = Items.new
                patients = Patients.new
                bullets = Bullets.new
              #  sneeses = Sneeses.new
                
                GAME_INFO[:life] = 5
                GAME_INFO[:vaccine] = 25
                GAME_INFO[:scene] = :playing
            end
        end
    end
end

