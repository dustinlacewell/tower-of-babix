with import <nixpkgs> {};

mkShell rec {
  name = "babel-tour";
  buildInputs = [
    dmd
    dotnet-sdk omnisharp-roslyn mono6
    dtools
    fsharp
    gfortran
    go
    guile
    lua
    nasm
    nodejs-14_x yarn
    ocaml
    perl
    python37
    R
    ruby
    rustc
  ];
}
