{ stdenv, fetchurl, pkgconfig, openssl, libxml2, libtomcrypt, stoken} :

stdenv.mkDerivation rec {
  name = "openconnect-6.00";

  src = fetchurl {
    url = "ftp://ftp.infradead.org/pub/openconnect/${name}.tar.gz";
    sha256 = "8a0c684dccac2447d204d544f6f466e41b21bce71e033ba58e2cb17b795ab81c";
  };

  buildInputs = [ libxml2 pkgconfig stoken libtomcrypt ];

  preConfigure = ''
    configureFlags="--with-vpnc-script=$out/bin/vpnc-script --disable-nls";
  '';

  postFixup = ''
    mkdir $out/bin
    cp ${./vpnc-script} $out/bin/vpnc-script
    chmod +x $out/bin/vpnc-script
  '';

  meta = {
    description = "OpenConnect is a client for Cisco's AnyConnect SSL VPN";
    homepage    = http://www.infradead.org/openconnect/;
    licenses    = stdenv.lib.licenses.lgpl21;
  };

}
