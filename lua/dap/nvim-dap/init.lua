local dap = require("dap")

vim.fn.sign_define("DapBreakpoint", {
  text = "🔴",
  texthl = "LspDiagnosticsSignError",
  linehl = "",
  numhl = "",
})

vim.fn.sign_define("DapStopped", {
  text = "🔶",
  texthl = "LspDiagnosticsSignInformation",
  linehl = "DiagnosticUnderlineInfo",
  numhl = "LspDiagnosticsSignInformation",
})

vim.fn.sign_define("DapBreakpointRejected", {
  text = "⭕",
  texthl = "LspDiagnosticsSignHint",
  linehl = "",
  numhl = "",
})

-- setup nvim-dap-virtual-text
require("nvim-dap-virtual-text").setup({
  commented = true,
})

local nodejs = require('dap.nvim-dap.dap-nodejs')
-- setup configuration
nodejs.setUpDapConfig(dap, { "typescript", "javascript" })

-- setup adapter
dap.adapters.node2 = nodejs.getNodeJsAdapter

-- setup nvim-dap-ui
local dapui = require('dap.nvim-dap.dap-ui').setup

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open({reset = true})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dap.repl.close()
  dap.disconnect()
  dap.clear_breakpoints()
  dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dap.repl.close()
  dap.disconnect()
  dapui.close({})
end

require("keybindings").mapDAP()
