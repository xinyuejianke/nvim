local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("没有找到 dashboard")
  return
end

db.custom_center = {
  {
    icon = "  ",
    desc = "Projects            ",
    action = "Telescope projects",
  },
  {
    icon = "  ",
    desc = "New File            ",
    action = "DashboardNewFile"
  },
  {
    icon = "  ",
    desc = "Recently Used Files ",
    action = "Telescope oldfiles",
  },
  {
    icon = "  ",
    desc = "Edit keybindings    ",
    action = "edit ~/.config/nvim/lua/keybindings.lua",
  },
  {
    icon = "  ",
    desc = "Edit Projects       ",
    action = "edit ~/.local/share/nvim/project_nvim/project_history",
  },
}

db.custom_header = {
  [[                                            ]],
  [[ ███████╗███████╗███╗   ██╗██████╗ ███████╗ ]],
  [[ ╚══███╔╝██╔════╝████╗  ██║██╔══██╗██╔════╝ ]],
  [[   ███╔╝ █████╗  ██╔██╗ ██║██║  ██║█████╗   ]],
  [[  ███╔╝  ██╔══╝  ██║╚██╗██║██║  ██║██╔══╝   ]],
  [[ ███████╗███████╗██║ ╚████║██████╔╝███████╗ ]],
  [[ ╚══════╝╚══════╝╚═╝  ╚═══╝╚═════╝ ╚══════╝ ]],
  [[                                            ]],
  [[      [coding is easy, life is hard]        ]],
  [[                                            ]]
}

db.dashboard_custom_footer = { "Zen's development environment" }
db.custom_footer = {
  "Zen's development environment",
  "",
  ""
}
