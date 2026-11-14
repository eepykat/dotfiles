# modules/mac/home/omniwm.nix
{ ... }: {
  programs.omniwm = {
    enable = true;
    launchd.enable = true;
  };
}
