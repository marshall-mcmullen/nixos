{ ... }:

{
    security.pki.certificates = [ 
    	(builtins.readFile /usr/local/etc/ssl/netherrack.net.pem)
    ];
}
