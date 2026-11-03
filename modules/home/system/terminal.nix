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
        window_padding_width = 6;
        enable_audio_bell = false;
      };
    };

    programs.fish = {
      enable = true;
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
