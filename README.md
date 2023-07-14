# jx-xmonad

https://xmonad.org/INSTALL.html

# Xmonad
my-xmonad conf file

Download

use Stack

## Clone inside your ~/.config/xmonad folder
```bash
$ git clone https://github.com/xmonad/xmonad
$ git clone https://github.com/xmonad/xmonad-contrib
```

(Sources and binaries don’t usually go into ~/.config. In our case, however, it avoids complexities related to Haskell build tools and lets us focus on the important bits of XMonad installation.)



#!/bin/sh

exec stack ghc --  \
  --make xmonad.hs \
  -i               \
  -ilib            \
  -fforce-recomp   \
  -main-is main    \
  -v0              \
  -o "$1"


```bash
$bash build xmonad-x86_64-linux
```
