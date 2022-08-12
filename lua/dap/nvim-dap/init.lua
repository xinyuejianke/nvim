local dap = require("dap")

-- setup nvim-dap-virtual-text
require("nvim-dap-virtual-text").setup({
  commented = true,
})

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

-- -- setup nvim-dap for nodejs adapter
-- require("dap-vscode-js").setup({
--   adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
-- })
--
-- for _, language in ipairs({ "typescript", "javascript" }) do
--   require("dap").configurations[language] = {
--     {
--       name = "Launch file",
--       type = "node2",
--       request = "launch",
--       sourceMaps = true,
--       protocol = 'inspector',
--       skipFiles = {'<node_internals>/**/*.js'},
--       console = 'integratedTerminal',
--       port = 3001,
--       runtimeArgs = {"--inspect=3001"},
--       program = "${workspaceFolder}/app.js",
--       cwd = "${workspaceFolder}"
--     },
--     {
--       name = "Attach",
--       type = "node2",
--       request = "attach",
--       cwd = vim.fn.getcwd(),
--       processId = require 'dap.utils'.pick_process,
--     }
--   }
-- end

-- node2 adapter for javascript
-- dap.adapters.node2 = {
--   type = 'executable',
--   command = 'node',
--   args = { os.getenv('HOME') .. "/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
--   -- args = { os.getenv('HOME') .. "/.local/share/nvim/site/pack/packer/opt/vscode-js-debug/out/src/vsDebugServer.js" },
-- }

local nodejs = require('dap.nvim-dap.dap-nodejs')
-- setup configuration
nodejs.setUpDapConfig(dap,{ "typescript", "javascript" })
-- setup adapter
dap.adapters.node2 = nodejs.getNodeJsAdapter

local dapui = require('dap.nvim-dap.dap-ui').setup

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

require("keybindings").mapDAP()
