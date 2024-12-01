{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
 packages = with pkgs;[
    ocaml
    dune_3
    ocamlPackages.ocamlformat
    ocamlPackages.lsp
  ];
}

