{
  description = ''Nim wrapper for libssh2'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."libssh2-master".dir   = "master";
  inputs."libssh2-master".owner = "nim-nix-pkgs";
  inputs."libssh2-master".ref   = "master";
  inputs."libssh2-master".repo  = "libssh2";
  inputs."libssh2-master".type  = "github";
  inputs."libssh2-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."libssh2-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."libssh2-0_1_5".dir   = "0_1_5";
  inputs."libssh2-0_1_5".owner = "nim-nix-pkgs";
  inputs."libssh2-0_1_5".ref   = "master";
  inputs."libssh2-0_1_5".repo  = "libssh2";
  inputs."libssh2-0_1_5".type  = "github";
  inputs."libssh2-0_1_5".inputs.nixpkgs.follows = "nixpkgs";
  inputs."libssh2-0_1_5".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."libssh2-0_1_6".dir   = "0_1_6";
  inputs."libssh2-0_1_6".owner = "nim-nix-pkgs";
  inputs."libssh2-0_1_6".ref   = "master";
  inputs."libssh2-0_1_6".repo  = "libssh2";
  inputs."libssh2-0_1_6".type  = "github";
  inputs."libssh2-0_1_6".inputs.nixpkgs.follows = "nixpkgs";
  inputs."libssh2-0_1_6".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}