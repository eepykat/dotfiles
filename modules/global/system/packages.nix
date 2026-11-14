# modules/global/system/packages.nix
{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    ansible
    bat
    btop
    curl
    eza
    fastfetch
    fd
    git
    hyfetch
    just
    nh
    nix-index
    nodejs
    pwgen
    ripgrep
    rsync
    sass
    sl
    unzip
    wget
    zip
    (lib.hiPrio (python3.withPackages (ps: with ps; [
      pyyaml
      pip
    ])))
  ]
  ++ lib.optionals pkgs.stdenv.isLinux [
    pciutils
    usbutils
  ]
  ++ lib.optionals pkgs.stdenv.isDarwin [
    coreutils-prefixed
    findutils
    gawk
    gnugrep
    gnused
    mas
  ];
}
