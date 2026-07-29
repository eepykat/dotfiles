{ config, pkgs, lib, mainUser, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/global
    ../../modules/desktop
  ];
  system.stateVersion = "25.11";
  nixpkgs.config.allowUnfree = true;
  networking.hostName = "lunchbox";

  time.timeZone = "Europe/Vilnius"; # Lithuanian Time
  i18n.defaultLocale = "en_US.UTF-8";
    # Nvidia 4070 Related move to dedicated file

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    open = true;
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  environment.sessionVariables = {
    SDL_VIDEODRIVER = "x11";
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1"; 
  };


  # Toggles
  podman.enable = true;
  flatpak.enable = true;
  default-users.enable = true;
  vpn.enable = true;
  desktop-networking.enable = true;
  system.audio.enable = true;
  nix-extra-misc.enable = true;
  laptop-power.enable = false;
  system.garbage.enable = true;
  cellular.enable = false;
  steam.enable = true;
  

  home-manager.users.${mainUser.user} = { config, lib, pkgs, inputs, ... }: {
    imports = [
      ../../modules/home
    ];
    
    desktop.enable = true;

    terminal.enable = true;
    programs.custom-niri.enable = true;
    programs.custom-noctalia.enable = true;
  
  };
}
