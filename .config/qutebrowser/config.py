from qutebrowser.config.config import ConfigContainer  # noqa: F401
from qutebrowser.config.configfiles import ConfigAPI  # noqa: F401

config: ConfigAPI = config  # noqa: F821 pylint: disable=E0602,C0103
c: ConfigContainer = c  # noqa: F821 pylint: disable=E0602,C0103
config.load_autoconfig()

c.new_instance_open_target = "tab"
c.content.autoplay = False
c.content.cookies.accept = "no-3rdparty"
c.content.geolocation = False
c.content.blocking.method = "both"
c.content.pdfjs = False

c.statusbar.show = "always"
c.statusbar.position = "bottom"
c.completion.open_categories = ["history", "filesystem"]

c.tabs.close_mouse_button = "none"
c.tabs.favicons.show = "always"
c.tabs.last_close = "close"
c.tabs.position = "bottom"
c.tabs.select_on_remove = "next"
c.tabs.show = "multiple"
c.tabs.title.alignment = "left"
c.tabs.title.elide = "right"
c.tabs.max_width = 250

c.url.default_page = "/home/emil/repos/personal/dotfiles/startpage/index.html"
c.url.start_pages = ["/home/emil/repos/personal/dotfiles/startpage/index.html"]
c.url.searchengines = {
    "DEFAULT": "https://www.startpage.com/sp/search?query={}",
    "ddg": "https://duckduckgo.com/?q={}",
}

c.zoom.default = "100%"

c.colors.webpage.preferred_color_scheme = "dark"
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.policy.images = "never"

urls = [
    "*://*.dreamhost.com/*",
    "*://emilnuutinen.com/*",
    "http://localhost/*",
    "http://*:*/*",
    "*://www.foreca.fi/*",
    "*://discord.com/*",
    "*://*.spotify.com/*",
    "*://*.youtube.com/*",
    "*://*.proton.me/*",
    "file:///*",
]

for url in urls:
    config.set("colors.webpage.darkmode.enabled", False, url)

c.fonts.default_family = "JetBrains Mono"
c.fonts.default_size = "10.5pt"
c.fonts.downloads = "default_size default_family"
c.fonts.hints = "bold default_size default_family"
c.fonts.keyhint = "default_size default_family"
c.fonts.prompts = "default_size default_family"
c.fonts.web.family.standard = "16"
c.fonts.web.family.fixed = "JetBrains Mono"
c.fonts.web.family.serif = "Noto Serif"
c.fonts.web.family.sans_serif = "Noto Sans"
c.fonts.web.size.default = 16
c.fonts.web.size.default_fixed = 14

# Hide the scrollbar
c.scrolling.bar = "never"

config.bind(",m", "spawn mpv {url}")
config.bind(",M", "hint links spawn mpv {hint-url}")

# Load theme
config.source("theme.py")
