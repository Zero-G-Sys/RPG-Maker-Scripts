#--------------------------------------------------------------------------
# RGSS3 マップフェード速度変更 ver1.00
# Map fade out fade in speed
#--------------------------------------------------------------------------
# ただ、マップのフェード速度を早めてテンポを上げるためのスクリプトです。
# returnの値を少なくすると、フェードが早くなります。

class Scene_Map
  #--------------------------------------------------------------------------
  # ● フェードアウト速度の取得　改変　※default = 30
  #--------------------------------------------------------------------------
  alias SSS002_fadeout_speed fadeout_speed
  def fadeout_speed
    return 10
  end
  #--------------------------------------------------------------------------
  # ● フェードイン速度の取得　改変　※default = 30
  #--------------------------------------------------------------------------
  alias SSS002_fadein_speed fadein_speed
  def fadein_speed
    return 10
  end
end

# Battle start animation speed increase
# Deafult 60
class Scene_Map < Scene_Base
  def perform_battle_transition
    Graphics.transition(20, "Graphics/System/BattleStart", 100)
    Graphics.freeze
  end
end