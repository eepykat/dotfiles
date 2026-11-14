# ./modules/desktop/system/flatpak.nix

{ inputs, lib, pkgs, config, ... }: {

  options.flatpak = {
    enable = lib.mkEnableOption "Flatpak";
  };

  config = lib.mkIf config.flatpak.enable {
    services.flatpak = {
      enable = true;
      packages = ["io.github.kolunmi.Bazaar"]; # Install Bazaar for a UI to browse software and test
      update = {
        onActivation = true;
        auto.enable = true;
      };
      remotes = [
        {
          name = "flathub";
          location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
        }
      ];
    };
  };
}