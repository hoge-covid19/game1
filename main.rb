require "dxopal"
require "Math"
require_remote "player.rb"
require_remote "item.rb"
require_remote "bullet.rb"
require_remote "sneese.rb"
require_remote "load.rb"
require_remote "patient.rb"
require_remote "end_roll.rb"

include DXOpal

# ゲームの状態を記憶するハッシュ
GAME_INFO = {
  life: 5,      #プレイヤーのライフ
  saved: 0,     #ワクチン接種に成功した患者数
  vaccine: 20,  #ワクチン保持数
  scene: :title,#ゲームステート
  end_type: 0   #ゲームオーバーのタイプ
}


Window.width = 800
Window.height = 480


Window.load_resources do
    player = Player.new
    items = Items.new
    patients = Patients.new
    bullets = Bullets.new
    sneeses = Sneeses.new
    end_roll = END_ROLL.new(Window.height)
    bgm_flag = 0
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
            if bgm_flag == 0
            Sound[:title_].play
            bgm_flag = 1
            end
            # enterキーでゲームスタート
            if Input.key_push?(K_RETURN)
                Sound[:title_].stop
                GAME_INFO[:scene] = :playing
                bgm_flag = 0
            end
        when :playing
            # ゲーム中
            if bgm_flag == 0
                Sound[:back].play
                bgm_flag = 1
            end
            player.update
            items.update(player)
            bullets.update(player,patients.patients)
            patients.update(player,bullets.bullets)
            sneeses.update(player,patients.patients)
            player.draw
            items.draw
            patients.draw
            bullets.draw
            sneeses.draw
            p patients.patients.size
            if patients.patients.size == 0
                Sound[:back].stop
                GAME_INFO[:scene] = :game_clear
                bgm_flag = 0
            end
        
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
                sneeses = Sneeses.new
                
                
                GAME_INFO[:life] = 5
                GAME_INFO[:vaccine] = 20
                GAME_INFO[:scene] = :playing
                bgm_flag = 0
            end
        when :game_clear
            # ゲームクリア画面
            Sound[:back].stop
            if bgm_flag == 0
                Sound[:endroll].play
                bgm_flag = 1
            end
            Window.draw_font(330, 190, "PRESS ENTER", Font.default,color:C_RED)
            Window.draw_font(330, 260, "GAME CLEAR", Font.default,color:C_BLACK)
            Window.draw_font(220, 290, "全員のワクチン接種に成功しました", Font.default,color:C_BLACK)
            
            # enterキーが押されたらリスタート
            if Input.key_push?(K_ENTER)
                Sound[:endroll].stop
                GAME_INFO[:scene] = :finish
                bgm_flag=0
            end
        
        when :finish
            if bgm_flag == 0
                Sound[:endroll].play
                bgm_flag = 1
            end
            Window.bgcolor = C_BLACK
            end_roll.update
            # enterキーが押されたらリスタート
              # enterキーが押されたらリスタート
            if Input.key_push?(K_ENTER)
                Sound[:endroll].stop
                player = Player.new
                items = Items.new
                patients = Patients.new
                bullets = Bullets.new
                sneeses = Sneeses.new
                
                
                GAME_INFO[:life] = 5
                GAME_INFO[:vaccine] = 20
                GAME_INFO[:scene] = :playing
                bgm_flag = 0
            end
        end
    end
end

