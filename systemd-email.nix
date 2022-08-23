{ config, lib, pkgs, ... }:

{
  systemd.packages = [
    (pkgs.runCommandNoCC "toplevel-overrides.conf" {
      preferLocalBuild = true;
      allowSubstitutes = false;
    } ''
      mkdir -p $out/etc/systemd/system/service.d/
      {
        echo "[Unit]"
        echo "OnFailure=status-email@%n.service"
      } > $out/etc/systemd/system/service.d/toplevel-overrides.conf
    '')
  ];

  systemd.services."status-email@" = {
    serviceConfig.Type = "oneshot";
    path = with pkgs; [ systemd system-sendmail ];
    scriptArgs = "%I";
    script = ''
      TO="root"
      FROM="systemd <root@$HOSTNAME>"
      SUBJECT="[systemd] $1 failed on $HOSTNAME"
      HEADERS="To:$TO\nFrom:$FROM\nSubject: $SUBJECT\n"
      BODY=$(systemctl status --no-pager $1 || true)
      echo -e "$HEADERS\n$BODY" | sendmail -t
    '';
  };
}
