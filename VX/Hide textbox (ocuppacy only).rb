=begin
===============================================================================
 Hide textbox (with ocupacity)
 Message Visibility by Zero_G
 Version: RGSS
===============================================================================
 This script will allow to player to toogle window ocupacy (make it transparent) 
 while displaying text with a key.

 
 Example : 
 -Press "C" to turn message window transparent and repress "C" to set default
 ocupacy.
 
 Possible key bindings: A B C X Y Z L R, 
 SHIFT CTRL ALT (these are defualt keyboard bindings)
 Functions Keys use: Input::F# (ex: Input::F5) [F1-4 can't be used]
 Gamepad = Keboard key
 A = shift
 B = x
 C = z
 X = a
 Y = s
 Z = d
 L = q
 R = w
--------------------------------------------------------------------------------
=end

#Hide textbox disabled, use other script or SUI MESSAGE function (if scrip used)

module ZERO
    DEFAULT_BACK_OPACITY = 180
    TRANSPARENCY_KEY = Input::Y   # Set hide textbox window while displaying text button
end

class Window_Message < Window_Selectable
  @transparent = 0
  
  alias zero_update update
  def update
    zero_update

    # Hide msgbox while keeping text
    if Input.trigger?(ZERO::TRANSPARENCY_KEY)
      if @transparent == 1
        self.opacity          = 255
        self.back_opacity     = ZERO::DEFAULT_BACK_OPACITY
        @name_window_frame.visible = true unless @name_window_frame.nil?
        @name_window_text.visible  = true unless @name_window_text.nil?
        @input_number_window.visible  = true unless @input_number_window.nil?
        @transparent = 0
      else
        self.opacity            = 0
        self.back_opacity       = 0
        @name_window_frame.visible = false unless @name_window_frame.nil?
        @input_number_window.visible  = false unless @input_number_window.nil?
        @transparent = 1
      end
    end
    
    # Keep msgbox transparent for subsequent messages
    if @transparent == 1
      self.opacity            = 0
      self.back_opacity       = 0
      @name_window_frame.visible = false unless @name_window_frame.nil?
      @input_number_window.visible  = false unless @input_number_window.nil?
    end
  end    
end