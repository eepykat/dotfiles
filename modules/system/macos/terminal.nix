# modules/mac/system/terminal.nix
{ pkgs, lib, config, ... }:

let
  starshipConfig = (lib.importTOML ./terminal/catppuccin-powerline.toml) // {
    palette = "catppuccin_mocha";
    command_timeout = 1300;
    scan_timeout = 50;
    add_newline = true;
  };
in
{
  environment.systemPackages = [
    pkgs.starship
  ];

  environment.etc."starship.toml".source = (pkgs.formats.toml { }).generate "starship.toml" starshipConfig;

  programs.fish = {
    enable = true;
    shellInit = ''
      if status is-interactive
        set -gx STARSHIP_CONFIG "/etc/starship.toml"
        ${pkgs.starship}/bin/starship init fish | source

        if test "$TERM" = "xterm-kitty"
          alias ssh="kitty +kitten ssh"
        end

        set -l blue   (set_color 5bc4f1)
        set -l pink   (set_color ffc0cb)
        set -l white  (set_color ffffff)
        set -l norm   (set_color normal)

        set -l trans_top       "$blue╭──────────$pink──────────$white───────────$pink──────────$blue──────────╮"
        set -l trans_mid1_pink "$pink┃                                                   ┃"
        set -l trans_mid_white "$white┃    Mrrrrrrp meow meow~ :3                         ┃"
        set -l trans_mid2_pink "$pink┃                                                   ┃"
        set -l trans_bottom    "$blue╰──────────$pink──────────$white───────────$pink──────────$blue──────────╯"

        set -g fish_greeting "$trans_top
$trans_mid1_pink
$trans_mid_white
$trans_mid2_pink
$trans_bottom$norm"
      end
    '';
  };

  programs.zsh = {
    enable = true;
    interactiveShellInit = ''
      export STARSHIP_CONFIG="/etc/starship.toml"
      eval "$(${pkgs.starship}/bin/starship init zsh)"
    '';
  };
}
