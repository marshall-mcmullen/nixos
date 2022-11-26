{ lib, ... }:

{
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
        # By default require public key AND 2FA
        AuthenticationMethods publickey,keyboard-interactive

	# Only require public key, no 2FA required for these hosts/ networks
        Match Address 192.168.86.0/24
            AuthenticationMethods publickey
      '';
  };
}
