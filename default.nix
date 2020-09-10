with import <nixpkgs> {};

let
  deps = [
    dmd dtools
    dotnet-sdk omnisharp-roslyn mono6
    fsharp
    gfortran
    go
    guile
    lua
    nasm
    nodejs-14_x yarn
    ocaml
    perl
    python3
    R
    ruby
    rustc
  ];

  binPath = lib.makeBinPath deps;

  babix-lisp = runCommand "babix-lisp" {} ''
    cp -r ${./lisp} $out
  '';

in writeScriptBin "babix" ''
   #!${pkgs.stdenv.shell}

   RED='\033[0;31m'
   YELLOW='\033[1;33m'
   NC='\033[0m' # No Color

   themes="default one one-light vibrant acario-dark acario-light city-lights challenger-deep dark+ dracula ephemeral fairy-floss flatwhite gruvbox gruvbox-light henna horizon Iosvkem laserwave material manegarm miramare molokai monokai-classic monokai-pro moonlight nord nord-light nova oceanic-next old-hope opera opera-light outrun-electric palenight plain peacock rouge snazzy solarized-dark solarized-light sourcerer spacegrey tomorrow-day tomorrow-night wilmersdorf zenburn mono-dark mono-light tron"

   themeFlag=""

   for arg do
     shift

     if [ ! -z "$themeFlag" ]; then

       if [[ ! " $themes[@] " =~ " $arg " ]]; then
         printf "''${RED}✗''${YELLOW} '$arg' is not a valid theme.''${NC}\n"
         for t in $themes; do
           let "i=$RANDOM % 256"
           echo -en "\e[38;5;''${i}m$t \e[0m";
         done
         exit 1
       fi

       export theme="$arg"
       themeFlag=""
       continue
     fi

     if [ "$arg" = "-theme" ]; then
       themeFlag="1"
       extras="-l ${babix-lisp}/babix-extras.el"
       continue
     fi

     if [ "$arg" = "-extras" ]; then
       extras="-l ${babix-lisp}/babix-extras.el"
       continue
     fi

     set -- "$@" "$arg"
   done

   if [ "$theme" = "" ]; then
     export theme="default"
   fi

   env PATH=${binPath}:$PATH ${emacs}/bin/emacs -Q -l ${babix-lisp}/bootstrap.el $extras $@
''
