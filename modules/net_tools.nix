{
  flake.modules.homeManager.netTools = { pkgs, ... }: {
    home.packages = with pkgs; [
      nmap
      netcat
      dig
      whois
      mtr
      traceroute
      curl
      wget
      tcpdump
      iperf3
      ethtool
      ipcalc
    ];
  };
}
