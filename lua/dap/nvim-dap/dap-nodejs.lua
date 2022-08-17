-- setup nvim-dap for nodejs adapter

-- lastest microsoft offical nodejs debugger
-- but have bug when using in nvim-dap, the session will not be terminate
require("dap-vscode-js").setup({
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
})

local M = {}

M.setUpDapConfig = function(dap, languages)
  for _, language in ipairs( languages ) do
      dap.configurations[language] = {
        {
          name = "Launch file",
          type = "node2",
          -- type = "pwa-node",
          request = "launch",
          sourceMaps = true,
          protocol = 'inspector',
          skipFiles = {'<node_internals>/**/*.js'},
          console = 'integratedTerminal',
          port = 3001,
          runtimeArgs = {"--inspect=3001"},
          program = "${workspaceFolder}/app.js",
          cwd = "${workspaceFolder}"
        },
        {
          name = "Attach",
          type = "node2",
          request = "attach",
          cwd = vim.fn.getcwd(),
          processId = require 'dap.utils'.pick_process,
        }
      }
    end
  end


M.getNodeJsAdapter = {
  type = 'executable',
  command = 'node',
  args = {
    os.getenv('HOME') .. "/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js",
    -- os.getenv('HOME') .. "/.local/share/nvim/site/pack/packer/opt/vscode-js-debug/out/src/vsDebugServer.js"
  },
}

return M
