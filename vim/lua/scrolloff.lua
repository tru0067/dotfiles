local function set_scrolloff()
    -- Vertical (fractional) scrolloff.
    local FRACTION = 0.2
    local lines = vim.api.nvim_eval("winheight(0)")
    local scrolloff = math.floor(FRACTION * lines)
    vim.opt.scrolloff = scrolloff

    -- Horizontal scrolloff.
    local DEFAULT = 8
    local cols = vim.api.nvim_eval("winwidth(0)")
    local tw = vim.api.nvim_get_option_value("textwidth", {})
    if cols > tw then
        vim.opt.sidescrolloff = 1
    else
        vim.opt.sidescrolloff = DEFAULT
    end
end

local group = vim.api.nvim_create_augroup("CustomScrolloff", {})
vim.api.nvim_create_autocmd(
    {"BufEnter", "VimResized"},
    {group = group, callback = set_scrolloff}
)
