{ config, pkgs, lib, mainUser, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/global
    ../../modules/server/front-end
  ];

  system.stateVersion = "25.11";
  nixpkgs.config.allowUnfree = true;
  networking.hostName = "frontends";

  time.timeZone = "Europe/Vilnius"; 
  i18n.defaultLocale = "en_US.UTF-8";

  podman.enable = true;
  default-users.enable = true;
  system.garbage.enable = true;
  nix-extra-misc.enable = true;




  boot.initrd.network = {
    enable = true;
    ssh = {
      enable = true;
      port = 2222;
      authorizedKeys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5..." ];
      hostKeys = [ "/etc/secrets/initrd_ssh_host_ed25519_key" ];
    };
    postCommands = ''
      echo "To unlock your root disk, run: ssh root@YOUR_SERVER_IP -p 2222 'systemd-tty-ask-password-agent'"
    '';
  };


  home-manager.users.${mainUser.user} = { config, lib, pkgs, inputs, ... }: {
    imports = [
      ../../modules/home
    ];

    terminal.enable = true;
  };
}
