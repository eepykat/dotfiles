# ./modules/home/system/terminal.nix

{ inputs, lib, pkgs, config, ... }: {
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ];

  options.terminal = {
    enable = lib.mkEnableOption "Terminal";
  };

  config = lib.mkIf config.terminal.enable {
    catppuccin.enable = true;
    catppuccin.autoEnable = true;
    catppuccin.starship.enable = true;
    catppuccin.starship.flavor = "mocha";

    programs.kitty = {
      enable = true;
      font = {
        name = "JetBrainsMono Nerd Font";
        size = 11;
      };
      settings = {
        term = "xterm-256color"; 
        window_padding_width = 6;
        enable_audio_bell = false;
        background_opacity = "0.85";

        enabled_layouts = "splits,stack,grid";

        # Boarders
        active_border_color = "#cba6f7";
        inactive_border_color = "#313244";
        window_border_width = "1.5pt";

        # URLS
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
      };
    };

    programs.fish = {
      enable = true;
      shellAliases = {
        ssh = "kitty +kitten ssh";
      };
      interactiveShellInit = ''
        set -l blue   (set_color 5bc4f1)
        set -l pink   (set_color ffc0cb)
        set -l white  (set_color ffffff)
        set -l norm   (set_color normal)

        set -l trans_top    "$blue╭──────────$pink──────────$white───────────$pink──────────$blue──────────╮"
        set -l trans_mid1_pink    "$pink┃                                                   ┃"
        set -l trans_mid_white       "$white┃    Mrrrrrrp meow meow~ :3                         ┃"
        set -l trans_mid2_pink    "$pink┃                                                   ┃"
        set -l trans_bottom    "$blue╰──────────$pink──────────$white───────────$pink──────────$blue──────────╯"

        set -g fish_greeting "$trans_top
        $trans_mid1_pink
        $trans_mid_white
        $trans_mid2_pink
        $trans_bottom$norm"
      '';
    };

    programs.starship = {
      enable = true;
      enableFishIntegration = true;
        settings = lib.mkForce ((lib.importTOML ./terminal/catppuccin-powerline.toml) // {
        palette = "catppuccin_mocha";
        command_timeout = 1300;
        scan_timeout = 50;
        add_newline = true;
      });
    };
  };
}
