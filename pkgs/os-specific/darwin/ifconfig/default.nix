{ stdenv }:

assert stdenv.isDarwin;

stdenv.mkDerivation {
  name = "ifconfig";

  src = "/sbin/ifconfig";

  unpackPhase = "true";
  configurePhase = "true";
  buildPhase = "true";

  installPhase = ''
    mkdir -p "$out/bin"
    ln -s $src "$out/bin"
  '';

  meta = with stdenv.lib; {
    description = "configure network interface parameters";
    homepage    = "https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man8/ifconfig.8.html";
    platforms   = platforms.darwin;

    longDescription = ''
      The ifconfig utility is used to assign an address to a network interface
      and/or configure network interface parameters.
    '';
  };
}

