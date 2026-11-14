# modules/desktop/programs/development.nix
{ config, lib, pkgs, inputs, ... }: {
  config = lib.mkIf config.desktop.programs.development.enable (
    lib.mkMerge [
      (lib.mkIf pkgs.stdenv.isLinux {
        environment.systemPackages = with pkgs; [
          remmina
          vscodium
        ];
      })

      (lib.mkIf pkgs.stdenv.isDarwin {
        homebrew.casks = [
          "beekeeper-studio"
          "github"
          "nova"
          "transmit"
          "vscodium"
        ];
      })
    ]
  );
}
