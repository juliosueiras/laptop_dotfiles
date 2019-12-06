with import <nixpkgs> {};

mkShell {
  buildInputs = [
    vagrant
    bundler
  ];
}
