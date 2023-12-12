local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")


dashboard.section.header.val = {
	"      |\\      _,,,---,,_            ",
	"ZZZzz /,`.-'`'    -.  ;-;;,_        ",
	"     |,4-  ) )-,_. ,\\ (  `'-'       ",
	"    '---''(_/--'  `-'\\_)  re4urnzer0 ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button("e", "  -> New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "󰛔  -> Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
    dashboard.button("r", "  -> Recent", ":Telescope oldfiles<CR>"),
    dashboard.button("s", "  -> Settings", ":e $MYVIMRC | :cd %:p:h | pwd<CR>"),
    dashboard.button("q", "  -> Quit", ":qa<CR>"),
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
