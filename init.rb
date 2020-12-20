class Init
    #変数初期化
    def value
        GAME_INFO[:life] = 5
        GAME_INFO[:vaccine] = 20
        GAME_INFO[:bgm_flag] = :off
        GAME_INFO[:scene] = :playing
    end
end