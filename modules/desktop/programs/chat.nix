# modules/desktop/programs/chat.nix
{ config, lib, pkgs, inputs, ... }: {
  config = lib.mkIf config.desktop.programs.chat.enable (
    lib.mkMerge [
      {
        environment.systemPackages = with pkgs; [
          cinny-desktop
        ];
      }

      (lib.mkIf pkgs.stdenv.isLinux {
        environment.systemPackages = with pkgs; [
          element-desktop
          mumble
          vesktop
        ];
        services.flatpak.packages = [
          "moe.sable.client"
        ];
      })

      (lib.mkIf pkgs.stdenv.isDarwin {
        homebrew = {
          masApps = {
            "Telegram" = 747648890;
            "WhatsApp" = 310633997;
          };
          casks = [
            "element"
            "sable"
            "vesktop"
          ];
        };
      })
    ]
  );
}
