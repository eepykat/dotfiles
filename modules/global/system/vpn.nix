# ./modules/global/system/vpn.nix
{ inputs, lib, pkgs, config, mainUser, ... }: {

  options.vpn = {
    enable = lib.mkEnableOption "VPN";
  };

  config = lib.mkIf config.vpn.enable {
    networking.wg-quick.interfaces = {
        home = {
            configFile = "/home/${mainUser.user}/.config/wireguard/home.conf";
            autostart = false;
        };
        lithuania = {
            configFile = "/home/${mainUser.user}/.config/wireguard/lithuania.conf";
            autostart = false;
        };
        iceland = {
            configFile = "/home/${mainUser.user}/.config/wireguard/iceland.conf";
            autostart = false;
        };
    };
    networking.firewall.checkReversePath = false;
  };
}
