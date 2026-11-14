# ./modules/desktop/system/laptop-power.nix

{ inputs, lib, pkgs, config, ... }: {

  options.laptop-power = {
    enable = lib.mkEnableOption "Laptop Power";
  };

  config = lib.mkIf config.laptop-power.enable {
    services.upower.enable = true;
    services.tlp = {
        enable = true;
        settings = {
            CPU_SCALING_GOVERNOR_ON_AC = "performance";
            CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
            START_CHARGE_THRESH_BAT0 = 75; 
            STOP_CHARGE_THRESH_BAT0 = 80;
        };
    };
  };
}
