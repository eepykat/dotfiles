

# ./modules/desktop/system/misc.nix

{ inputs, lib, pkgs, config, ... }: {





  options.nix-extra-misc = {
    enable = lib.mkEnableOption "Nix Extra";
  };

  config = lib.mkIf config.nix-extra-misc.enable {
    nix = {
        settings = {
            experimental-features = [ "nix-command" "flakes" ];
            auto-optimise-store = true;
        };
    };
  };
}
