local on_attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0})
    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, {buffer = 0})
    -- TODO: There's a lot of other possible LSP related actions.
    --       (See `:help vim.lsp.*`.)
    --       Ideally I would like to come up with a way to have a single
    --       keymapping open a floating window with a list of all possible
    --       actions, similar to a right-click context menu.
    vim.keymap.set("n", "<leader>dj", vim.lsp.diagnostic.goto_next, {buffer = 0})
    vim.keymap.set("n", "<leader>dk", vim.lsp.diagnostic.goto_prev, {buffer = 0})
end

-- Language server configurations.
-- See `:help lspconfig-server-configurations`.

-- Lua.
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
require"lspconfig".sumneko_lua.setup{
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = runtime_path,
            },
            diagnostics = {
                globals = {"vim"},
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
    on_attach = on_attach,
}
