{ fetchurl, flashplayer-standalone, ... }:

flashplayer-standalone.overrideAttrs(oldAtts: {
  src = fetchurl {
    url = "https://fpdownload.macromedia.com/pub/flashplayer/updaters/32/flash_player_sa_linux.x86_64.tar.gz";
    sha256 = "0mi3ggv6zhzmdd1h68cgl87n6izhp0pbkhnidd2gl2cp95f23c2d";
  };
})
