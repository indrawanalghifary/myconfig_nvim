require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- -- Configure shell for Termux environment to handle /usr/bin/env issue
-- vim.o.shell = '/data/data/com.termux/files/usr/bin/zsh'
-- vim.o.shellcmdflag = '-c'
-- vim.o.shellredir = '&>'


-- Deteksi OS
local is_windows = vim.fn.has "win32" == 1
local is_termux = vim.fn.isdirectory("/data/data/com.termux") == 1

if is_windows then
  -- Windows
  vim.o.shell = "pwsh"
  vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
  vim.o.shellredir = "2>&1 | Out-File -Encoding UTF8 %s"
  vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s"

elseif is_termux then
  -- Termux (Android)
  vim.o.shell = "/data/data/com.termux/files/usr/bin/zsh"
  vim.o.shellcmdflag = "-c"
  vim.o.shellredir = "&>"
  vim.o.shellpipe = "2>&1 | tee"

else
  -- Linux & macOS
  vim.o.shell = vim.env.SHELL or "/bin/sh"
  vim.o.shellcmdflag = "-c"
  vim.o.shellredir = "&>"
  vim.o.shellpipe = "2>&1 | tee"
end
