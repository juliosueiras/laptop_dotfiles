with import <nixpkgs> {};

mkShell {
  buildInputs = [
    vagrant
    virtualboxHeadless
  ];
}
