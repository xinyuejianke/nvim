local util = require 'lspconfig.util'

local opts = {
  cmd = { 'solargraph', 'stdio' },
  filetypes = { 'ruby' },
  settings = {
    solargraph = {
      diagnostics = true,
    },
  },
  flags = {
    debounce_text_changes = 150
  },
  init_options = { formatting = true },
  root_dir = util.root_pattern('Gemfile', '.git'),

  on_attach = function(client, bufnr)
    -- 禁用格式化功能，交给专门插件插件处理
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false

    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- 绑定快捷键
    require('keybindings').mapLSP(buf_set_keymap)
    -- 保存时自动格式化
    vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
  end,
}

return {
  on_setup = function(server)
    server:setup(opts)
  end,
}
