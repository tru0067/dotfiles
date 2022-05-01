-- Largely default setup. See <https://github.com/hrsh7th/nvim-cmp>,
-- <https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#super-tab-like-mapping>,
-- and <https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion>.
-- `nvim-cmp` setup. {{{
vim.opt.completeopt = {"menu", "menuone", "noselect"}

local cmp = require"cmp"
local luasnip = require"luasnip"

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("[^%w_]") == nil
end

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ["<C-y>"] = cmp.config.disable,
        ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
    }, {
        --{ name = "buffer" },
    })
})

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- }}}
-- `nvim-lspconfig` setup. {{{
-- Setup lspconfig.
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

local handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            signs = false,
            virtual_text = {spacing = 8}
        }
    )
}

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
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = handlers,
}
-- Julia.
require"lspconfig".julials.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = handlers,
}
-- }}}
