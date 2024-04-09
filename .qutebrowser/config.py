# pyright: basic, reportUndefinedVariable=false
import os
import sys

config.load_autoconfig()

## Always restore open sites when qutebrowser is reopened. Without this
c.auto_save.session = True

## Display changelog after every major update (default: minor)
c.changelog_after_upgrade = "major"

c.content.fullscreen.window = True
c.window.hide_decoration = True
c.fonts.default_size = "15pt"
c.colors.webpage.preferred_color_scheme = "dark"

## Keybindings
config.bind(",m", "spawn mpv {url}")
config.bind("pa", "spawn --userscript bitwarden --totp")
config.bind("pu", "spawn --userscript bitwarden --totp --username-only")
config.bind("pk", "spawn --userscript bitwarden --totp --password-only")

## Set theme
sys.path.append(os.path.join(sys.path[0], "selenized-qutebrowser"))
config.source("themes/selenized-qutebrowser/qutebrowser.py")

## This should not be necessary...
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36",
    "accounts.google.com",
)
