vim.cmd"source ~/.vimrc"

vim.opt.rtp:append"~/dotfiles/vim"
vim.opt.rtp:append"~/dotfiles/vim/after"

-- Colorscheme.
vim.opt.termguicolors = true
vim.cmd"colorscheme verdurous-darker"

-- Statusline.
vim.cmd"source ~/dotfiles/vim/statusline.vim"
vim.opt.laststatus = 3

-- Bindings.
-- Let Ctrl-W delete the previous WORD.
vim.keymap.set("i", "<C-W>", "<C-\\><C-O>dB")
-- Let Ctrl-Backspace delete the previous word.
vim.keymap.set("i", "<C-H>", "<C-\\><C-O>db")
-- Let Ctrl-Delete delete the next word.
vim.keymap.set("i", "<C-Del>", "<C-\\><C-O>dw")
-- Correct the last spelling error.
vim.keymap.set("i", "<C-L>", "<C-G>u<ESC>[s1z=`]a<C-G>u")
vim.keymap.set("n", "<C-L>", "m`[s1z=``")
vim.g.mapleader = " "
-- Open file explorer.
vim.keymap.set("n", "<leader>e", ":Lex<CR>")

-- Commands.
-- See unsaved changes.
vim.api.nvim_create_user_command("Changes", ":w !diff % -", {})

-- Autocommands.
-- Highlight yanks.
local augroup_highlight_yank = vim.api.nvim_create_augroup("HighlightYank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup_highlight_yank,
    callback = function()
        vim.highlight.on_yank{higroup="Visual", timeout=120}
    end,
})

-- Other config files.
require"scrolloff"
