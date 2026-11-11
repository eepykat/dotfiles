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
        shell = pkgs.fish;
        ignoreShellProgramCheck = true; 
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL+CWDsp+9sR0jji7s59f21wAH2G79FzrTYAmRDs8X09 katmini"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDC5aEWP44sxCeRDAjdh/bTaAfnfHkzkXO/J35L22T75 meowpad"
        ];
    };
    users.groups.${mainUser.user} = {};
  };
}