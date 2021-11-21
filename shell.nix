let
  rust-version = "1.56.1";
  moz_overlay = import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz);
  nixpkgs = import <nixpkgs> { overlays = [ moz_overlay ]; };
  rust-channel = nixpkgs.rustChannelOf {
    channel = rust-version;
  };
  rust = rust-channel.rust.override {
    extensions = [ "rust-src" ];
  };
  cargo = rust-channel.cargo;
in with nixpkgs; mkShell {
  buildInputs = [
    rust cargo
  ];
}
