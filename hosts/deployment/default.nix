# hosts/deployment/default.nix
{ config, pkgs, lib, mainUser, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/global
    #../../modules/desktop
  ];

  system.stateVersion = "25.11";
  nixpkgs.config.allowUnfree = true;
  networking.hostName = "deployment";
  time.timeZone = "Europe/Vilnius";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IE.UTF-8";
    LC_IDENTIFICATION = "en_IE.UTF-8";
    LC_MEASUREMENT = "en_IE.UTF-8";
    LC_MONETARY = "en_IE.UTF-8";
    LC_NAME = "en_IE.UTF-8";
    LC_NUMERIC = "en_IE.UTF-8";
    LC_PAPER = "en_IE.UTF-8";
    LC_TELEPHONE = "en_IE.UTF-8";
    LC_TIME = "en_DK.UTF-8";
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Toggles
  podman.enable = false;
  default-users.enable = true;
  vpn.enable = false;

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "prohibit-password"; 
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs mainUser; };
    users.${mainUser.user} = { config, lib, pkgs, ... }: {
      imports = [
        ../../modules/home
      ];
      # Home Manager Toggles
      desktop.enable = false;
      terminal.enable = true;
      kitty.enable = false;
      cursor.enable = false;
      umbriel.enable = false;
      programs.custom-noctalia.enable = false;
    };
  };
}