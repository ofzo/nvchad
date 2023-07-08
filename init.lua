-- rm -rf ~/.local/share/nvim/ ~/.cache/mnvim/
vim.cmd [[ lcd %:p:h ]]
require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

vim.cmd[[
    au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw! " 方块
    au InsertEnter,InsertChange *
                \ if v:insertmode == 'i' |
                \   silent execute '!echo -ne "\e[5 q"' | redraw! |  " 竖线
                \ elseif v:insertmode == 'r' |
                \   silent execute '!echo -ne "\e[3 q"' | redraw! |  " 下划线
                \ endif
    au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw! " 竖线
]]

vim.cmd [[ command Q q ]]
vim.cmd [[ map q <CMD>q<CR> ]]
vim.cmd [[ command W w ]]
vim.cmd [[ map <leader>s <CMD>w<CR> ]]
vim.cmd [[ map <leader>w <C-w><C-w> ]]

vim.cmd [[
  " hi CursorLine term=NONE cterm=NONE guibg=LightGray
  " hi CursorLineNr term=NONE  cterm=BOLD,ITALIC guifg=Black guibg=LightGray
]]
--
-- vim.cmd[[ :NvimTreeFocus ]]
