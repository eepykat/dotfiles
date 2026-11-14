# modules/home/system/kitty.nix
{ inputs, lib, pkgs, config, ... }: {
  options.kitty = {
    enable = lib.mkEnableOption "Kitty";
  };

  config = lib.mkIf config.kitty.enable {
    catppuccin = {
      enable = true;
      autoEnable = true;
      starship = {
        enable = true;
        flavor = "mocha";
      };
    };

    programs.kitty = {
      enable = true;
      package = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin null;

      font = {
        name = "JetBrainsMono Nerd Font";
        size = if pkgs.stdenv.hostPlatform.isDarwin then 13 else 11;
      };

      settings = {
        term = "xterm-256color";
        window_padding_width = 6;
        enable_audio_bell = false;
        background_opacity = "0.85";

        enabled_layouts = "splits,stack,grid";

        # Borders
        active_border_color = "#cba6f7";
        inactive_border_color = "#313244";
        window_border_width = "1.5pt";

        # URLs
        detect_urls = "yes";
        url_color = "#89b4fa";
        url_style = "curly";
        copy_on_select = "yes";

        # Tabs
        tab_bar_style = "powerline";
        tab_powerline_style = "slanted";
        active_tab_font_style = "bold";
        inactive_tab_font_style = "normal";
        active_tab_foreground = "#1e1e2e";
        active_tab_background = "#5bc4f1";
        inactive_tab_foreground = "#ffffff";
        inactive_tab_background = "#ffc0cb";
        tab_bar_background = "#11111b";
        sync_to_monitor = "yes";
        input_delay = 1;
      } // lib.optionalAttrs pkgs.stdenv.hostPlatform.isDarwin {
        shell = "/run/current-system/sw/bin/fish";
        background_blur = 20;
        hide_window_decorations = "titlebar-only";
        macos_option_as_alt = "yes";
        macos_quit_when_last_window_closed = "yes";
      };
    };
  };
}
