# modules/desktop/programs/books.nix
{ config, lib, pkgs, inputs, ... }: {
  config = lib.mkIf config.desktop.programs.books.enable (
    lib.mkMerge [
      (lib.mkIf pkgs.stdenv.isLinux {
        environment.systemPackages = with pkgs; [
        ];
      })

      (lib.mkIf pkgs.stdenv.isDarwin {
        homebrew.casks = [
          "calibre"
        ];
      })
    ]
  );
}
