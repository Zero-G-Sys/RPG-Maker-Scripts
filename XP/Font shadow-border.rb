#===============================
# ■ Bitmap.draw_text
#-------------------------------------
# Aliases and redefines draw_text so that a shadow is drawn
# Made by: Ultimate Jesus (Border added by Zero_G)
#======================================

class Bitmap

# Size of the shadow (usually 1..3)
ShadowIndent = 1
# Draw a border instead of a shadow, ignores ShadowIndent, uses BorderSize
FullBorder = true
# Size of border (usually 1..2)
BorderSize = 1
# the colour of the shadow/border
#   the 4th value is transparency (0-255)
ShadowColour = Color.new(0, 0, 0, 255)
                                     
 unless @ja_ta_feito == 1 # Fix for F12 Rebot by P@nCHo
   alias draw_text_plain draw_text
   @ja_ta_feito = 1
 end
 
 def draw_text(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
   if arg1.is_a?(Rect)
     x = arg1.x
     y = arg1.y
     width = arg1.width
     height = arg1.height
     string = arg2
     align = arg3
   else
     x = arg1
     y = arg2
     width = arg3
     height = arg4
     string = arg5
     align = arg6
   end
   colour = self.font.color.dup
   self.font.color = ShadowColour
   if FullBorder
     draw_text_plain(x + BorderSize, y, width, height, string, align)
     draw_text_plain(x - BorderSize, y, width, height, string, align)
     draw_text_plain(x, y + BorderSize, width, height, string, align)
     draw_text_plain(x, y - BorderSize, width, height, string, align)
   else
     draw_text_plain(x + ShadowIndent, y + ShadowIndent, width, height, string, align)
   end
   self.font.color = colour
   draw_text_plain(x, y, width, height, string, align)
 end
end