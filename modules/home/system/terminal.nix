# ./modules/home/system/terminal.nix

{ inputs, lib, pkgs, config, ... }: {
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ];

  options.terminal = {
    enable = lib.mkEnableOption "Terminal";
  };

  config = lib.mkIf config.terminal.enable {
    catppuccin.autoEnable = true;
    catppuccin.starship.enable = true;
    catppuccin.starship.flavor = "mocha";

    programs.kitty = {
      enable = true;
      font = {
        name = "JetBrainsMono Nerd Font";
        size = 11;
      };
    };

    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        starship init fish | source
      '';
    };

    programs.starship = {
      enable = true;
      enableFishIntegration = true;
      settings = (lib.importTOML ./terminal/catppuccin-powerline.toml) // {
        palette = "catppuccin_mocha";
        command_timeout = 1300;
        scan_timeout = 50;
        add_newline = true;
        format = "$all$nix_shell$nodejs$lua$golang$rust$php$git_branch$git_commit$git_state$git_status\n$username$hostname$directory";
        character = {
          success_symbol = "[](bold green) ";
          error_symbol = "[✗](bold red) ";
        };
      };
    };
  };
}
