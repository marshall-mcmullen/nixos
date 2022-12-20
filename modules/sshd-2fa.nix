{ lib, ... }:

{
  networking.firewall.allowedTCPPorts = [ 22 7722 ];

  security.pam.services = {
    login.googleAuthenticator.enable = false;
    sshd.googleAuthenticator.enable = true;
    sshd.unixAuth = lib.mkForce true;
    sudo.googleAuthenticator.enable = false;
  };

  services.openssh = {
    enable = true;
    permitRootLogin = "no";
    passwordAuthentication = false;
    extraConfig =
      ''
        # Listen on additional port 7722 that will be used for SSH in over cloudflare
	Port 7722

        # By default require public key AND 2FA
        AuthenticationMethods publickey,keyboard-interactive

	# No 2FA for local network hitting local port 22. Also allow root login
        Match Address 192.168.86.* LocalPort 22
            AuthenticationMethods publickey
            PermitRootLogin yes
      '';
  };
}
