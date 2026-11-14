# modules/desktop/gayming/pokemmo.nix
{ inputs, lib, pkgs, config, ... }: {
  config = lib.mkIf config.gayming.pokemmo.enable (
    lib.mkMerge [
      (lib.mkIf pkgs.stdenv.isLinux {
        environment.systemPackages = [ pkgs.stable.pokemmo-installer ];
      })

      (lib.mkIf pkgs.stdenv.isDarwin {
        homebrew.casks = [
          # "pokemmo"
        ];
      })
    ]
  );
}
