# modules/desktop/programs/system.nix
{ config, lib, pkgs, inputs, ... }: {
  config = lib.mkIf config.desktop.programs.system.enable (
    lib.mkMerge [
      (lib.mkIf pkgs.stdenv.isLinux {
        environment.systemPackages = with pkgs; [
          gparted
        ];
      })

      (lib.optionalAttrs pkgs.stdenv.isDarwin {
        homebrew = {
          masApps = {
            "Amphetamine" = 937984704;
            "Home Assistant" = 1099568401;
          };
          casks = [
            #"alfred"
            "raycast"
            "seadrive"
            "seafile-client"
          ];
        };
      })
    ]
  );
}
