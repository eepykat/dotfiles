# modules/mac/system/kitty.nix
{ pkgs, ... }: {
  homebrew.casks = [
    "kitty"
  ];
  environment.etc."xdg/kitty/kitty.conf".text = ''
    font_family      JetBrainsMono Nerd Font
    shell            /run/current-system/sw/bin/fish
    font_size        13.0
    term                     xterm-256color
    window_padding_width     6
    enable_audio_bell        no
    background_opacity       0.85
    background_blur          20
    hide_window_decorations  titlebar-only
    enabled_layouts          splits,stack,grid
    sync_to_monitor          yes
    input_delay              1
    macos_option_as_alt                 yes
    macos_quit_when_last_window_closed  yes
    active_border_color    #cba6f7
    inactive_border_color  #313244
    window_border_width    1.5pt
    detect_urls     yes
    url_color       #89b4fa
    url_style       curly
    copy_on_select  yes
    tab_bar_style            powerline
    tab_powerline_style      slanted
    active_tab_font_style    bold
    inactive_tab_font_style  normal
    active_tab_foreground    #1e1e2e
    active_tab_background    #5bc4f1
    inactive_tab_foreground  #ffffff
    inactive_tab_background  #ffc0cb
    tab_bar_background       #11111b
    foreground              #cdd6f4
    background              #1e1e2e
    selection_foreground    #1e1e2e
    selection_background    #f5e0dc
    cursor                  #f5e0dc
    cursor_text_color       #1e1e2e
    color0 #45475a
    color8 #585b70
    color1 #f38ba8
    color9 #f38ba8
    color2  #a6e3a1
    color10 #a6e3a1
    color3  #f9e2af
    color11 #f9e2af
    color4  #89b4fa
    color12 #89b4fa
    color5  #f5c2e7
    color13 #f5c2e7
    color6  #94e2d5
    color14 #94e2d5
    color7  #bac2de
    color15 #a6adc8
  '';
}
