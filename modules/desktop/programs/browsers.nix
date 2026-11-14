# modules/desktop/programs/browsers.nix
{ config, lib, pkgs, inputs, ... }: {
  config = lib.mkIf config.desktop.programs.browsers.enable (
    lib.mkMerge [
      (lib.mkIf pkgs.stdenv.isLinux {
        environment.systemPackages = with pkgs; [
          inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
          ungoogled-chromium
        ];
      })

      (lib.optionalAttrs pkgs.stdenv.isDarwin {
        homebrew = {
          masApps = {
            "Wipr" = 1662217862;
            "Shut Up" = 1015043880;
          };
          casks = [
            "firefox"
            "ungoogled-chromium"
            "zen"
          ];
        };
      })
    ]
  );
}
