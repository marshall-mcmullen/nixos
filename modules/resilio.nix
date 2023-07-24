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
        secret         = "A67ZDPY7I6UBY2YTQIVSWGSZHIPT5S226";
        directory      = "/var/lib/resilio-sync/shared/marshall";
	useRelayServer = false;
	useTracker     = true;
	useDHT         = false;
	searchLAN      = true;
	useSyncTrash   = false;
	knownHosts     = [];
      }
      {
        secret         = "AZ3IIRP2ELWNXAEWEYQ6ZM2UYGWS5UIUI";
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
