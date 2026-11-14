# modules/desktop/programs/default.nix
{ config, lib, ... }: {
  imports = [
    ./audio.nix
    ./books.nix
    ./browsers.nix
    ./chat.nix
    ./creative.nix
    ./desktop.nix
    ./development.nix
    ./files.nix
    ./mail.nix
    ./music.nix
    ./office.nix
    ./print.nix
    ./security.nix
    ./system.nix
    ./video.nix
    ./virtualization.nix
    ./vpn.nix
  ];

    desktop.programs = {
      enable = lib.mkEnableOption "Desktop Programs";

      audio.enable = lib.mkEnableOption "Audio Tools";
      books.enable = lib.mkEnableOption "Books";
      browsers.enable = lib.mkEnableOption "Browsers";
      chat.enable = lib.mkEnableOption "Chat & Social Apps";
      creative.enable = lib.mkEnableOption "Creative, Photo & Sticker Tools";
      desktop.enable = lib.mkEnableOption "Desktop Utilities";
      development.enable = lib.mkEnableOption "Development";
      files.enable = lib.mkEnableOption "File Management";
      mail.enable = lib.mkEnableOption "Mail Clients";
      music.enable = lib.mkEnableOption "Music Listening";
      office.enable = lib.mkEnableOption "Office";
      print.enable = lib.mkEnableOption "3D Printing";
      security.enable = lib.mkEnableOption "Security Tools";
      system.enable = lib.mkEnableOption "System Utilities";
      video.enable = lib.mkEnableOption "Video Editing";
      virtualization.enable = lib.mkEnableOption "Virtualization & VMs";
      vpn.enable = lib.mkEnableOption "VPN";
    };

  config.desktop.programs = {
    audio.enable = lib.mkDefault config.desktop.programs.enable;
    books.enable = lib.mkDefault config.desktop.programs.enable;
    browsers.enable = lib.mkDefault config.desktop.programs.enable;
    chat.enable = lib.mkDefault config.desktop.programs.enable;
    creative.enable = lib.mkDefault config.desktop.programs.enable;
    desktop.enable = lib.mkDefault config.desktop.programs.enable;
    development.enable = lib.mkDefault config.desktop.programs.enable;
    files.enable = lib.mkDefault config.desktop.programs.enable;
    mail.enable = lib.mkDefault config.desktop.programs.enable;
    music.enable = lib.mkDefault config.desktop.programs.enable;
    office.enable = lib.mkDefault config.desktop.programs.enable;
    print.enable = lib.mkDefault config.desktop.programs.enable;
    security.enable = lib.mkDefault config.desktop.programs.enable;
    system.enable = lib.mkDefault config.desktop.programs.enable;
    video.enable = lib.mkDefault config.desktop.programs.enable;
    virtualization.enable = lib.mkDefault config.desktop.programs.enable;
    vpn.enable = lib.mkDefault config.desktop.programs.enable;
  };
}
