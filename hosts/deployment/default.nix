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

  users.users.${mainUser.user} = {
    shell = pkgs.fish;
    ignoreShellProgramCheck = true; 
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Toggles
  podman.enable = false;
  flatpak.enable = false;
  default-users.enable = true;
  vpn.enable = false;
  desktop-networking.enable = false;
  system.audio.enable = false;
  nix-extra-misc.enable = false;
  laptop-power.enable = false;
  system.garbage.enable = true;
  steam.enable = false;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "root" "@wheel" ];
  };

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "prohibit-password"; 
    };
  };

  users.users.${mainUser.user} = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL+CWDsp+9sR0jji7s59f21wAH2G79FzrTYAmRDs8X09 katmini"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDC5aEWP44sxCeRDAjdh/bTaAfnfHkzkXO/J35L22T75 meowpad"
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs mainUser; };
    users.${mainUser.user} = { config, lib, pkgs, ... }: {
      imports = [
        ../../modules/home
      ];
      desktop.enable = false;
      terminal.enable = true;
      programs.custom-noctalia.enable = false;
    };
  };
}