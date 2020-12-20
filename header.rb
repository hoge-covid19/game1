# ゲームの状態を記憶するハッシュ
GAME_INFO = {
  life: 5,      #プレイヤーのライフ
  saved: 0,     #ワクチン接種に成功した患者数
  vaccine: 20,  #ワクチン保持数
  scene: :title,#ゲームステート
  end_type: 0,  #ゲームオーバーのタイプ
  bgm_flag: :on #BGMが再生中か否か
}

#ウィンドウサイズ
Window.width = 800
Window.height = 480