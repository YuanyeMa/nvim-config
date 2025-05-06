local opt = vim.opt

-- 行号
opt.number = true

-- 光标行
opt.cursorline = true

-- 启用鼠标
-- opt.mouse:append("a")
-- 停用鼠标, 启用鼠标后会和iTerm2的Command+C/V功能冲突
opt.mouse = ""

-- 系统剪贴板
 opt.clipboard:append("unnamedplus")

 -- 默认分割窗口在右边和下边
 opt.splitright = true
 opt.splitbelow = true

 -- 搜索: 高亮搜索结果，忽略大小写
 opt.ignorecase = true
 opt.smartcase = true

 -- 开启终端真颜色
 opt.termguicolors = true
 opt.signcolumn = "yes"

 -- 设置主题
 vim.cmd[[colorscheme tokyonight-moon]]
