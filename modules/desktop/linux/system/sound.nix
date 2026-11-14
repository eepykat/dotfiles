# ./modules/desktop/system/audio.nix
{ inputs, lib, pkgs, config, ... }: {

  options.system.audio = {
    enable = lib.mkEnableOption "Audio";
  };

  config = lib.mkIf config.system.audio.enable {
    
    services.pulseaudio.enable = false;

    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;

      extraConfig = {
        pipewire."99-low-latency"."context.properties" = {
          "default.clock.rate" = 48000;
          "default.clock.allowed-rates" = [ 44100 48000 88200 96000 ]; 
          "default.clock.quantum" = 256;
          "default.clock.min-quantum" = 128;
          "default.clock.max-quantum" = 2048;

          "core.rt.prio" = 88;
          "modules.rt.prio" = 88;
        };

        pipewire-pulse."99-low-latency"."pulse.properties" = {
          "pulse.default.req" = "256/48000"; 
        };
      };
    };
    security.rtkit.enable = true;
  };
}
