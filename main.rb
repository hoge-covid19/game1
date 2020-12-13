require "dxopal"
require_remote "player.rb"
require_remote "enemy.rb"
require_remote "item.rb"

include DXOpal

#画像登録
Image.register(:apple, 'images/apple.png')
Image.register(:enemy, 'images/awabi.png')
Image.register(:player, 'images/player.png')


# 読み込みたい音声を登録する
Sound.register(:get, 'sounds/get.wav')
Sound.register(:explosion, 'sounds/explosion.wav')


# ゲームの状態を記憶するハッシュを追加
GAME_INFO = {
  score: 0,        # score
  scene: :title,   # title(init status)
}

GROUND_Y = 400

Window.load_resources do
    player = Player.new
    # Itemsクラスのオブジェクトを作る
    items = Items.new

    Window.loop do
        # 背景とスコア表示は、どの画面でも出すことにする
        Window.draw_box_fill(0, 0, Window.width, Window.height, [0, 0, 0])
        Window.draw_font(0, 0, "SCORE: #{GAME_INFO[:score]}", Font.default)

        # シーンごとの処理
        case GAME_INFO[:scene]
        when :title
            # タイトル画面
            Window.draw_font(0, 30, "PRESS SPACE", Font.default)
            Window.draw_font(250, 250, "SAVE WORLD", Font.default)
            # スペースキーが押されたらシーンを変える
            if Input.key_push?(K_SPACE)
                GAME_INFO[:scene] = :playing
            end
        when :playing
            # ゲーム中
            player.update
            items.update(player)

            player.draw
            items.draw
        when :game_over
            # ゲームオーバー画面
            Window.draw_font(250, 270, "PRESS SPACE", Font.default)
            Window.draw_font(250, 240, "GAME OVER", Font.default)
            #player.draw
            #items.draw
            # スペースキーが押されたらゲームの状態をリセットし、シーンを変える
            if Input.key_push?(K_SPACE)
                player = Player.new
                items = Items.new
                GAME_INFO[:score] = 0
                GAME_INFO[:scene] = :playing
            end
        end
    end
end

