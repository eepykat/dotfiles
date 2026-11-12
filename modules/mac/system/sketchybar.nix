# modules/mac/system/sketchybar.nix
{ ... }: {
  services.sketchybar = {
    enable = true;
    config = ''
      sketchybar --bar height=32 position=top color=0xff1e1e2e
      sketchybar --update
    '';
  };
}