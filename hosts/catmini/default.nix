# hosts/catmini/default.nix

{ ... }: {
  imports = [../../modules/mac];

  apps = {
    enable = true;
  };

}