require "dxopal"
require "Math"
include DXOpal
require_remote "display.rb"
require_remote "player.rb"
require_remote "item.rb"
require_remote "bullet.rb"
require_remote "sneese.rb"
require_remote "load.rb"
require_remote "patient.rb"
require_remote "end_roll.rb"
require_remote "header.rb"
require_remote "init.rb"

Window.load_resources do
    init = Init.new
    display = Display.new   #画面表示
    player = Player.new     #プレイヤー
    items = Items.new       #アイテム
    patients = Patients.new #患者
    bullets = Bullets.new   #ワクチン
    sneeses = Sneeses.new   #くしゃみ
    end_roll = END_ROLL.new(Window.height)
    GAME_INFO[:bgm_flag] = :off
    Window.loop do
        #画面表示
        display.play
        # シーンごとの処理
        case GAME_INFO[:scene]
            #タイトル画面
            when :title
                display.title
                    if GAME_INFO[:bgm_flag] == :off 
                        Sound[:title_].play
                        GAME_INFO[:bgm_flag] = :on
                    end
                # enterキーでゲームスタート
                if Input.key_push?(K_RETURN)
                    Sound[:title_].stop
                    GAME_INFO[:scene] = :playing
                    GAME_INFO[:bgm_flag] = :off
                end
            # ゲーム中
            when :playing
                if GAME_INFO[:bgm_flag] == :off 
                    Sound[:back].play
                    GAME_INFO[:bgm_flag] = :on
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
                #患者全員のワクチン接種に成功した場合
                if patients.patients.size == 0
                    Sound[:back].stop
                    GAME_INFO[:scene] = :game_clear
                    GAME_INFO[:bgm_flag] = :off
                end
            # ゲームオーバー画面
            when :game_over
                Sound[:back].stop
                display.game_over
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
                    init.value
                end
            #ゲームクリア画面
            when :game_clear
                Sound[:back].stop
                display.game_clear
                # enterキーが押されたらエンドロールへ
                if Input.key_push?(K_ENTER)
                    GAME_INFO[:scene] = :finish
                end
            #エンドロール画面
            when :finish
                if GAME_INFO[:bgm_flag] == :off
                    Sound[:endroll].play
                    GAME_INFO[:bgm_flag] = :on
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
                    init.value
                end
        end
    end
end

