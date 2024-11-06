{ host, ... }:
{
  networking.hostName = host;

  networking.networkmanager = {
    enable = true;
  };

  networking.enableIPv6 = true;
}
