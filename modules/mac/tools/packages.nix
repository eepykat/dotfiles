{ config, pkgs, lib, ... }: {
  environment.systemPackages = with pkgs; [
    git
    hyfetch
    mas
    coreutils-prefixed
    gnugrep
    gnused
    gawk
    findutils
    ripgrep
    fd
    eza
    bat
    btop
    sl
    ansible
    (python3.withPackages (ps: with ps; [
      pyyaml
    ]))
  ];
  homebrew.brews = [
    "openssh"
  ];
}