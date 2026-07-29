# ./modules/global/system/users.nix

{ inputs, lib, pkgs, config, mainUser, ... }: {

  options.default-users = {
    enable = lib.mkEnableOption "Default Users";
  };

  config = lib.mkIf config.default-users.enable {
    users.users.${mainUser.user} = {
        isSystemUser = false;
        isNormalUser = true;
        description = "Katarina";
        group = "${mainUser.user}";
        extraGroups = [ "networkmanager" "wheel" "podman" "wireshark" ];
        packages = with pkgs; [];
    };
    users.groups.${mainUser.user} = {};
  };
}
