# /modules/mac/system/configs.nix
{ inputs, userConfig, ... }: { 
  system.defaults.CustomUserPreferences = {
    "com.apple.symbolichotkeys" = {
      AppleSymbolicHotKeys = {
        "64" = { enabled = false; }; # Spotlight Search
      };
    };
  };
}