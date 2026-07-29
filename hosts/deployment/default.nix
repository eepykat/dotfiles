# hosts/deployment/default.nix
{ config, pkgs, lib, mainUser, inputs, ... }:
{
  imports = [
    ./disko.nix 
    ../../modules/global
  ];

  system.stateVersion = "25.11";
  nixpkgs.config.allowUnfree = true;
  networking.hostName = "deployment";

  time.timeZone = "Europe/Vilnius";
  i18n.defaultLocale = "en_US.UTF-8";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "root" "@wheel" ];
  };

  default-users.enable = true;

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "prohibit-password"; 
    };
  };

  system.garbage.enable = true;
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };
  vpn.enable = lib.mkDefault false;
  laptop-power.enable = lib.mkDefault false;
  cellular.enable = lib.mkDefault false;
  system.audio.enable = lib.mkDefault false;

  home-manager.users.${mainUser.user} = { config, lib, pkgs, ... }: {
    imports = [ ../../modules/home ];
    desktop.enable = false;
    terminal.enable = true;
  };
}
