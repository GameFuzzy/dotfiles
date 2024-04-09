# pyright: basic, reportUndefinedVariable=false
import os
import sys

config.load_autoconfig()

## Always restore open sites when qutebrowser is reopened. Without this
c.auto_save.session = True

## Display changelog after every major update (default: minor)
c.changelog_after_upgrade = "major"

## Keybindings
config.bind(",m", "spawn mpv {url}")

## Set theme
sys.path.append(os.path.join(sys.path[0], "selenized-qutebrowser"))
config.source("themes/selenized-qutebrowser/qutebrowser.py")
