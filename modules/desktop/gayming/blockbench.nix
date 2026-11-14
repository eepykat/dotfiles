# modules/desktop/gayming/blockbench.nix
{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.gayming.blockbench.enable (
    lib.mkMerge [
      (lib.mkIf pkgs.stdenv.isLinux {
        environment.systemPackages = with pkgs; [
          blockbench
        ];
      })

      (lib.mkIf pkgs.stdenv.isDarwin {
        homebrew.casks = [
          "blockbench"
        ];
      })
    ]
  );
}
