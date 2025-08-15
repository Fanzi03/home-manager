#!/usr/bin/env nix-shell
#! nix-shell -i bash --pure 
#! nix-shell -p bash cowsay lolcat 

desc=${1:-"Hello everybody I am Java developer don't ask me about why I cow, I know that weird so ignore it"}

cowsay "$desc" | lolcat

