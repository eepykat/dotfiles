# modules/mac/apps/default.nix
{ config, lib, ... }: {
  imports = [
    ./audio.nix
    ./books.nix
    ./browsers.nix
    ./development.nix
    ./filemanagment.nix
    ./mail.nix
    ./music.nix
    ./office.nix
    ./photo.nix
    ./print.nix
    ./security.nix
    ./social.nix
    ./stickers.nix
    ./terminal.nix
    ./tools.nix
    ./utils.nix
    ./video.nix
    ./virtualization.nix
    ./vpn.nix
  ];

  options.apps = {
    enable = lib.mkEnableOption "macOS Apps";
    audio = { enable = lib.mkEnableOption "Audio Tools"; };
    books = { enable = lib.mkEnableOption "Books"; };
    browsers = { enable = lib.mkEnableOption "Browsers"; };
    development = { enable = lib.mkEnableOption "Development"; };
    filemanagment = { enable = lib.mkEnableOption "File Utilities"; };
    mail = { enable = lib.mkEnableOption "Mail clients"; };
    music = { enable = lib.mkEnableOption "Music Listening"; };
    office = { enable = lib.mkEnableOption "Office"; };
    photo = { enable = lib.mkEnableOption "Photo Editing"; };
    print = { enable = lib.mkEnableOption "3D Printing"; };
    security = { enable = lib.mkEnableOption "Security Related"; };
    social = { enable = lib.mkEnableOption "Chat Apps"; };
    stickers = { enable = lib.mkEnableOption "Sticker Making"; };
    terminal = { enable = lib.mkEnableOption "Terminal"; };
    tools = { enable = lib.mkEnableOption "Tools"; };
    utils = { enable = lib.mkEnableOption "Utilities"; };
    video = { enable = lib.mkEnableOption "Video Editing"; };
    virtualization = { enable = lib.mkEnableOption "VM"; };
    vpn = { enable = lib.mkEnableOption "VPN"; };
  };

  config.apps = {
    audio.enable = lib.mkDefault config.apps.enable;
    books.enable = lib.mkDefault config.apps.enable;
    browsers.enable = lib.mkDefault config.apps.enable;
    development.enable = lib.mkDefault config.apps.enable;
    filemanagment.enable = lib.mkDefault config.apps.enable;
    mail.enable = lib.mkDefault config.apps.enable;
    music.enable = lib.mkDefault config.apps.enable;
    office.enable = lib.mkDefault config.apps.enable;
    photo.enable = lib.mkDefault config.apps.enable;
    print.enable = lib.mkDefault config.apps.enable;
    security.enable = lib.mkDefault config.apps.enable;
    social.enable = lib.mkDefault config.apps.enable;
    stickers.enable = lib.mkDefault config.apps.enable;
    terminal.enable = lib.mkDefault config.apps.enable;
    tools.enable = lib.mkDefault config.apps.enable;
    utils.enable = lib.mkDefault config.apps.enable;
    video.enable = lib.mkDefault config.apps.enable;
    virtualization.enable = lib.mkDefault config.apps.enable;
    vpn.enable = lib.mkDefault config.apps.enable;
  };
}