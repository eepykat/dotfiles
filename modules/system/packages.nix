# modules/global/packages.nix
{ pkgs, lib, ... }: {
  environment.systemPackages =
    (with pkgs; [
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
      (lib.hiPrio (
        python3.withPackages (
          ps: with ps; [
            pip
            pyyaml
          ]
        )
      ))
    ])
    ++ lib.optionals pkgs.stdenv.isLinux (
      with pkgs; [
        pciutils
        usbutils
      ]
    )
    ++ lib.optionals pkgs.stdenv.isDarwin (
      with pkgs; [
        coreutils-prefixed
        findutils
        gawk
        gnugrep
        gnused
        mas
      ]
    );
}
