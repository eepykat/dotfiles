# modules/mac/system/homebrew.nix
{ userConfig, inputs, config, ... }: {
  nix-homebrew = {
    inherit (userConfig) user;
    enable = true;
    enableRosetta = true;
    mutableTaps = true;
    autoMigrate = true;
    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
      "homebrew/homebrew-bundle" = inputs.homebrew-bundle;
      "sableclient/sable" = inputs.homebrew-sable;
    };
  };

  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
    taps = [
      builtins.attrNamess config.nix-homebrew.taps
    ]
    ++ builtins.attrNames config.nix-homebrew.taps;
    brews = [
      "openssh"
    ];
  };
}
