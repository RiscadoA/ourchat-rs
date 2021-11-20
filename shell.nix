let
  moz_overlay = import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz);
  nixpkgs = import <nixpkgs> { overlays = [ moz_overlay ]; };
in with nixpkgs; mkShell {
  nativeBuildInputs = [
    latest.rustChannels.stable.rust
    pkgconfig
    cargo
    rls
  ];
}
