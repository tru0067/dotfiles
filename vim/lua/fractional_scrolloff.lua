local function set_scrolloff()
    local FRACTION = 0.2
    local lines = vim.api.nvim_eval"winheight(0)"
    local scrolloff = math.floor(FRACTION * lines)
    vim.opt.scrolloff = scrolloff
end

local group = vim.api.nvim_create_augroup("FractionalScrolloff", {})
vim.api.nvim_create_autocmd(
    {"BufEnter", "VimResized"},
    {group = group, callback = set_scrolloff}
)
