{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    resilio-sync
  ];

  services.resilio = {
    enable = true;
    enableWebUI = false;

    sharedFolders = [
      {
        secret         = "A6EMOHCZPF7INP6BUR2VUX4SD7UHZR35R";
        directory      = "/var/lib/resilio-sync/shared/marshall";
	useRelayServer = false;
	useTracker     = true;
	useDHT         = false;
	searchLAN      = true;
	useSyncTrash   = false;
	knownHosts     = [];
      }
      {
        secret         = "AXFCOC7WKBWDFT24RXF3CLSONEWKYQ6AC";
	directory      = "/var/lib/resilio-sync/shared/jessica";
	useRelayServer = false;
	useTracker     = true;
	useDHT         = false;
	searchLAN      = true;
	useSyncTrash   = false;
	knownHosts     = [];
      }
    ];
  };
}
