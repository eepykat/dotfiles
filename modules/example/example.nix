# ./modules/example/example.nix

{ inputs, lib, pkgs, config, ... }: {

  options.example = {
    enable = lib.mkEnableOption "Example";
  };

  config = lib.mkIf config.example.enable {

  };
}
