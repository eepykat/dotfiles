# modules/desktop/gayming/roblox.nix
{ inputs, lib, pkgs, config, ... }: {
  config = lib.mkIf config.gayming.roblox.enable (
    lib.mkMerge [
      (lib.mkIf pkgs.stdenv.isLinux {
        services.flatpak.packages = [ "org.vinegarhq.Sober" ];
      })

      (lib.mkIf pkgs.stdenv.isDarwin {
        homebrew.casks = [
          "roblox"
        ];
      })
    ]
  );
}
