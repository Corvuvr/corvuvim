vim.lsp.config['zls'] = {
  -- Set to 'zls' if `zls` is in your PATH
  cmd = { '/usr/bin/zls' },
  filetypes = { 'zig' },
  root_markers = { 'build.zig' },
  -- There are two ways to set config options:
  --   - edit your `zls.json` that applies to any editor that uses ZLS
  --   - set in-editor config options with the `settings` field below.
  --
  -- Further information on how to configure ZLS:
  -- https://zigtools.org/zls/configure/
  settings = {
    zls = {
      -- Whether to enable build-on-save diagnostics
      --
      -- Further information about build-on save:
      -- https://zigtools.org/zls/guides/build-on-save/
      -- enable_build_on_save = true,

      -- omit the following line if `zig` is in your PATH
      zig_exe_path = '/usr/bin/zig'
    }
  },
}
vim.lsp.enable('zls')

-- Enable signs and virtual_text if desired
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  float = { border = "rounded", source = "always" },
})

-- Show diagnostics in a hover float on CursorHold
vim.o.updatetime = 250
vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false })]])
