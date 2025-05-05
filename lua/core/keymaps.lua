-- 设置主键为空格
vim.g.mapleader = " "

local keymap = vim.keymap

--------插入模式--------
-- keymap.set("i", "jk", "<ESC>")
-- options : $1 : 哪个模式
-- 	     $2 : 改成哪个键
-- 	     $3 : 哪个键要改

--------visual模式--------
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '>-2<CR>gv=gv")

---------正常模式---------
-- 窗口
-- keymap.set("n", "<leader>sv", "<C-w>v") -- 水平分割新增窗口
-- keymap.set("n", "<leader>sh", "<C-w>s")

--------- 插件 ----------
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- bufferline
keymap.set("n", "<C-S-j>", ":BufferLineCycleNext<CR>")
keymap.set("n", "<C-S-k>", ":BufferLineCyclePrev<CR>")
