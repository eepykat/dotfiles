# hosts/catbook/default.nix

{ ... }: {
  imports = [../../modules/mac];

  apps = {
    enable = true;
  };

  tools = {
    enable = true;
  };

}