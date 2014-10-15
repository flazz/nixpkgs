{ stdenv, fetchurl, autoconf, automake, libtool, pkgconfig, libtomcrypt, libxml2 } :

stdenv.mkDerivation rec {
  name = "stoken-0.6";

  src = fetchurl {
    url = "http://softlayer-dal.dl.sourceforge.net/project/stoken/stoken-0.6.tar.gz";
    sha256 = "b29ee3715db7e55fafe93cbed4c0f7a91396a391a9416e8ea7c06d8e7e8bad37";
  };

  buildInputs = [ automake autoconf libtool libxml2 pkgconfig libtomcrypt ];

  preConfigure =  ''
    substituteInPlace Makefile.am --replace "--version-script," ""
    autoreconf -fi
  '';

  configureFlags = [
    "--without-gtk"
  ];

  meta = {
    description = "Software Token for Linux/UNIX";
    homepage    = https://github.com/cernekee/stoken;
    licenses    = stdenv.lib.licenses.lgpl2Plus;
  };

}
