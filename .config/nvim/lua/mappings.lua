require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- Custom mappings for various functionality categories
-- Prefix mappings to show category descriptions in which-key
map("n", "<leader>w", "<Nop>", { desc = "window management" })
map("n", "<leader>t", "<Nop>", { desc = "tab management" })
map("n", "<leader>f", "<Nop>", { desc = "file management" })
map("n", "<leader>s", "<Nop>", { desc = "search/find" })
map("n", "<leader>g", "<Nop>", { desc = "git integration" })
map("n", "<leader>te", "<Nop>", { desc = "terminal" })
map("n", "<leader>l", "<Nop>", { desc = "lsp" })
map("n", "<leader>c", "<Nop>", { desc = "comment" })
map("n", "<leader>m", "<Nop>", { desc = "format" })
map("n", "<leader>b", "<Nop>", { desc = "buffer management" })
map("n", "<leader>q", "<Nop>", { desc = "quickfix/list" })
map("n", "<leader>d", "<Nop>", { desc = "debugging" })
map("n", "<leader>p", "<Nop>", { desc = "project/plugin" })
map("n", "<leader>r", "<Nop>", { desc = "replace/refactor" })

-- Windows management mappings
map("n", "<leader>wc", "<C-w>c", { desc = "window close" })
map("n", "<leader>wv", "<C-w>v", { desc = "window split vertical" })
map("n", "<leader>ws", "<C-w>s", { desc = "window split horizontal" })
map("n", "<leader>wh", "<C-w>h", { desc = "window focus left" })
map("n", "<leader>wl", "<C-w>l", { desc = "window focus right" })
map("n", "<leader>wj", "<C-w>j", { desc = "window focus down" })
map("n", "<leader>wk", "<C-w>k", { desc = "window focus up" })
map("n", "<leader>ww", "<C-w>w", { desc = "window switch to next" })
map("n", "<leader>wW", "<C-w>W", { desc = "window switch to prev" })
map("n", "<leader>w=", "<C-w>=", { desc = "window equal size" })
map("n", "<leader>wm", "<C-w>_", { desc = "window maximize" })
map("n", "<leader>wr", "<C-w>r", { desc = "window rotate" })

-- File management mappings
map("n", "<leader>fs", "<cmd>w<CR>", { desc = "file save" })
map("n", "<leader>fd", "<cmd>bd<CR>", { desc = "file delete buffer" })
map("n", "<leader>fn", "<cmd>enew<CR>", { desc = "file new" })

-- Search/Find mappings
map("n", "<leader>ss", "<cmd>Telescope live_grep<CR>", { desc = "search string" })
map("n", "<leader>sf", "<cmd>Telescope find_files<CR>", { desc = "search file" })
map("n", "<leader>sb", "<cmd>Telescope buffers<CR>", { desc = "search buffer" })
map("n", "<leader>sh", "<cmd>Telescope help_tags<CR>", { desc = "search help" })

-- Git integration mappings
map("n", "<leader>gg", "<cmd>Telescope git_status<CR>", { desc = "git status" })
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "git commits" })
map("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "git branches" })

-- Terminal mappings
map("n", "<leader>teh", "<cmd>split term://zsh<CR>", { desc = "terminal horizontal" })
map("n", "<leader>tev", "<cmd>vsplit term://zsh<CR>", { desc = "terminal vertical" })
map("n", "<leader>teo", "<cmd>tabnew | term://zsh<CR>", { desc = "terminal new tab" })

-- LSP mappings
map("n", "<leader>lf", "<cmd>LspInfo<CR>", { desc = "lsp info" })
map("n", "<leader>li", "<cmd>LspInstallInfo<CR>", { desc = "lsp install info" })
map("n", "<leader>lr", "<cmd>LspRestart<CR>", { desc = "lsp restart" })

-- Comment mappings
map("n", "<leader>cc", "gcc", { desc = "comment toggle current" })
map("v", "<leader>cc", "gc", { desc = "comment toggle selection" })

-- Format mappings
map("n", "<leader>mf", "<cmd>lua vim.lsp.buf.format()<CR>", { desc = "format current" })

-- Tab management mappings
map("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "tab new" })
map("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "tab close" })
map("n", "<leader>to", "<cmd>tabonly<CR>", { desc = "tab only" })
map("n", "<leader>tm", "<cmd>tabmove<CR>", { desc = "tab move" })
map("n", "<leader>tp", "<cmd>tabprevious<CR>", { desc = "tab previous" })
map("n", "<leader>tt", "<cmd>tabnext<CR>", { desc = "tab next" })
map("n", "<leader>tf", "<cmd>tabfirst<CR>", { desc = "tab first" })
map("n", "<leader>tl", "<cmd>tablast<CR>", { desc = "tab last" })

-- Buffer management mappings
map("n", "<leader>bn", "<cmd>enew<CR>", { desc = "buffer new" })
map("n", "<leader>bc", "<cmd>bd<CR>", { desc = "buffer close" })
map("n", "<leader>bo", "<cmd>%bd|e#<CR>", { desc = "buffer close others" })
map("n", "<leader>bf", "<cmd>bfirst<CR>", { desc = "buffer first" })
map("n", "<leader>bl", "<cmd>blast<CR>", { desc = "buffer last" })
map("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "buffer previous" })
map("n", "<leader>br", "<cmd>buffer #<CR>", { desc = "buffer recent" })

-- Quickfix/List mappings
map("n", "<leader>qn", "<cmd>cnext<CR>", { desc = "quickfix next" })
map("n", "<leader>qp", "<cmd>cprev<CR>", { desc = "quickfix previous" })
map("n", "<leader>qo", "<cmd>copen<CR>", { desc = "quickfix open" })
map("n", "<leader>qc", "<cmd>cclose<CR>", { desc = "quickfix close" })
map("n", "<leader>qf", "<cmd>cfirst<CR>", { desc = "quickfix first" })
map("n", "<leader>ql", "<cmd>clast<CR>", { desc = "quickfix last" })

-- Replace/Refactor mappings
map("n", "<leader>rc", "<cmd>nohlsearch<CR>", { desc = "clear search highlight" })
map("n", "<leader>rr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "replace word under cursor" })

-- Debugging mappings
-- (These would require a debugger plugin like nvim-dap to be fully functional)
map("n", "<leader>dt", "<cmd>echo 'Debug: Not configured'<CR>", { desc = "debug toggle" })

-- Project/Plugin mappings
map("n", "<leader>pp", "<cmd>Lazy<CR>", { desc = "plugins manager" })
map("n", "<leader>pc", "<cmd>edit ~/.config/nvim/lua/chadrc.lua<CR>", { desc = "config file" })
map("n", "<leader>pm", "<cmd>edit ~/.config/nvim/lua/mappings.lua<CR>", { desc = "mappings file" })

-- Select all mapping
map("n", "<leader>a", "<Nop>", { desc = "select all" })
map("n", "<leader>aa", "<cmd>keepjumps normal! ggVG<CR>", { desc = "select all" })

-- Other custom mappings
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
