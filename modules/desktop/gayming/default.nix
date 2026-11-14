# modules/desktop/gayming/default.nix
{ config, lib, ... }: {
  imports = [
    ./blockbench.nix
    ./hydra-launcher.nix
    ./mac-gaming.nix
    ./pokemmo.nix
    ./prismlauncher.nix
    ./roblox.nix
    ./steam.nix
  ];

  options.gayming = {
    enable = lib.mkEnableOption "Gaming Apps & Launchers";

    blockbench.enable = lib.mkEnableOption "Blockbench";
    hydra-launcher.enable = lib.mkEnableOption "Hydra Launcher";
    mac-gaming.enable = lib.mkEnableOption "macOS-Specific Games";
    pokemmo.enable = lib.mkEnableOption "PokeMMO";
    prismlauncher.enable = lib.mkEnableOption "Prism Launcher";
    roblox.enable = lib.mkEnableOption "Roblox";
    steam.enable = lib.mkEnableOption "Steam";
  };

  config.gayming = {
    blockbench.enable = lib.mkDefault config.gayming.enable;
    hydra-launcher.enable = lib.mkDefault config.gayming.enable;
    mac-gaming.enable = lib.mkDefault config.gayming.enable;
    pokemmo.enable = lib.mkDefault config.gayming.enable;
    prismlauncher.enable = lib.mkDefault config.gayming.enable;
    roblox.enable = lib.mkDefault config.gayming.enable;
    steam.enable = lib.mkDefault config.gayming.enable;
  };
}
