vim.g.mapleader = " "

vim.pack.add({
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/MeanderingProgrammer/render-markdown.nvim",
    "https://github.com/folke/sidekick.nvim",
})

require("render-markdown").setup({})
require("mason").setup({})
require("sidekick").setup({})

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.wrap = false
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.signcolumn = "yes"
vim.opt.completeopt = { "menu", "menuone", "noselect", "popup", "fuzzy" }
vim.opt.termguicolors = false -- Use the terminal theme palette and background

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format buffer" })
vim.keymap.set("n", "<leader>cf", ":e ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<leader>cr", ":source $MYVIMRC<CR>")
vim.keymap.set("n", "<leader>a", ":Sidekick cli toggle<CR>")

vim.keymap.set("n", "J", "2j")
vim.keymap.set("n", "K", "2k")

vim.lsp.config("lua_ls", {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
    settings = { Lua = { runtime = { version = "LuaJIT" }, diagnostics = { globals = { "vim" } } } },
})

vim.lsp.config("clangd", {
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_markers = { "compile_commands.json", "compile_flags.txt", ".clangd", ".git" },
})

vim.lsp.config("pyright", {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "pyrightconfig.json", ".git" },
})

vim.lsp.enable({ "lua_ls", "clangd", "pyright" })

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
        end
    end,
})
