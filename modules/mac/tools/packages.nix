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
    (lib.hiPrio (python3.withPackages (ps: with ps; [
      pyyaml
      pip
    ])))
  ];
  homebrew.brews = [
    "openssh"
  ];
}