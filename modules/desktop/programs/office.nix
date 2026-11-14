# modules/desktop/programs/office.nix
{ config, lib, pkgs, inputs, ... }: {
  config = lib.mkIf config.desktop.programs.office.enable (
    lib.mkMerge [
      (lib.mkIf pkgs.stdenv.isLinux {
        environment.systemPackages = with pkgs; [
          libreoffice
          obsidian
        ];
      })

      (lib.mkIf pkgs.stdenv.isDarwin {
        homebrew = {
          masApps = {
            "LibreOffice" = 1630474372;
            "Microsoft Outlook" = 985367838;
            "Supernote Partner" = 1494992020;
          };
          casks = [
            "obsidian"
          ];
        };
      })
    ]
  );
}
