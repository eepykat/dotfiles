#/hosts/global.nix

{ config, pkgs, lib, ... }: {  
    system.stateVersion = "25.11";
    nixpkgs.config.allowUnfree = true;
    networking.hostName = "meowpad";
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
}