-- Options Menu - <leader>eo için komple ayarlar menüsü
local M = {}

-- Colorscheme değiştirme
local function change_colorscheme()
  local colorschemes = vim.fn.getcompletion('', 'color')
  vim.ui.select(colorschemes, {
    prompt = '🎨 Select Colorscheme:',
  }, function(choice)
    if choice then
      vim.cmd('colorscheme ' .. choice)
      print('Colorscheme: ' .. choice)
    end
  end)
end

-- Background toggle
local function toggle_background()
  if vim.o.background == 'dark' then
    vim.o.background = 'light'
    print('Background: light')
  else
    vim.o.background = 'dark'
    print('Background: dark')
  end
end

-- Font size değiştirme (Kitty için)
local function change_font_size()
  local sizes = {'10', '11', '12', '13', '14', '15', '16', '17', '18', '20', '22', '24'}
  vim.ui.select(sizes, {
    prompt = '🔤 Select Font Size:',
  }, function(choice)
    if choice then
      -- Kitty config'i güncelle
      local config_path = vim.fn.expand('~/.config/kitty/kitty.conf')
      local lines = vim.fn.readfile(config_path)
      for i, line in ipairs(lines) do
        if line:match('^font_size') then
          lines[i] = 'font_size        ' .. choice .. '.0'
          break
        end
      end
      vim.fn.writefile(lines, config_path)
      print('Font size: ' .. choice .. ' (Kitty\'yi reload edin: Ctrl+Shift+F5)')
    end
  end)
end

-- Number display toggle
local function toggle_number_mode()
  local modes = {
    'Absolute (number)',
    'Relative (relativenumber)',
    'Both (number + relativenumber)',
    'None (no numbers)',
  }
  vim.ui.select(modes, {
    prompt = '🔢 Select Number Mode:',
  }, function(choice)
    if choice:match('Absolute') then
      vim.opt.number = true
      vim.opt.relativenumber = false
      print('Number mode: Absolute')
    elseif choice:match('Relative') then
      vim.opt.number = false
      vim.opt.relativenumber = true
      print('Number mode: Relative')
    elseif choice:match('Both') then
      vim.opt.number = true
      vim.opt.relativenumber = true
      print('Number mode: Both')
    elseif choice:match('None') then
      vim.opt.number = false
      vim.opt.relativenumber = false
      print('Number mode: None')
    end
  end)
end

-- Tab width değiştirme
local function change_tab_width()
  local widths = {'2', '4', '8'}
  vim.ui.select(widths, {
    prompt = '⇥ Select Tab Width:',
  }, function(choice)
    if choice then
      local width = tonumber(choice)
      vim.opt.tabstop = width
      vim.opt.softtabstop = width
      vim.opt.shiftwidth = width
      print('Tab width: ' .. choice)
    end
  end)
end

-- Ana options menüsü
function M.show_options_menu()
  local options = {
    '🎨 Change Colorscheme',
    '🌓 Toggle Background (light/dark)',
    '🔤 Change Font Size',
    '🔢 Number Display Mode',
    '⇥ Tab Width',
    '📏 Toggle Line Wrap',
    '📍 Toggle Cursor Line',
    '📋 Toggle Spell Check',
    '🔍 Toggle Search Highlight',
    '📊 Toggle Sign Column',
    '💾 Save Current Settings',
  }

  vim.ui.select(options, {
    prompt = '⚙️  Settings & Options:',
  }, function(choice)
    if not choice then return end

    if choice:match('Colorscheme') then
      change_colorscheme()
    elseif choice:match('Background') then
      toggle_background()
    elseif choice:match('Font Size') then
      change_font_size()
    elseif choice:match('Number Display') then
      toggle_number_mode()
    elseif choice:match('Tab Width') then
      change_tab_width()
    elseif choice:match('Line Wrap') then
      vim.opt.wrap = not vim.opt.wrap:get()
      print('Wrap: ' .. (vim.opt.wrap:get() and 'ON' or 'OFF'))
    elseif choice:match('Cursor Line') then
      vim.opt.cursorline = not vim.opt.cursorline:get()
      print('Cursorline: ' .. (vim.opt.cursorline:get() and 'ON' or 'OFF'))
    elseif choice:match('Spell Check') then
      vim.opt.spell = not vim.opt.spell:get()
      print('Spell: ' .. (vim.opt.spell:get() and 'ON' or 'OFF'))
    elseif choice:match('Search Highlight') then
      vim.opt.hlsearch = not vim.opt.hlsearch:get()
      print('Search highlight: ' .. (vim.opt.hlsearch:get() and 'ON' or 'OFF'))
    elseif choice:match('Sign Column') then
      if vim.opt.signcolumn:get() == 'yes' then
        vim.opt.signcolumn = 'no'
        print('Sign column: OFF')
      else
        vim.opt.signcolumn = 'yes'
        print('Sign column: ON')
      end
    elseif choice:match('Save') then
      vim.cmd('write')
      print('Settings saved!')
    end
  end)
end

return M
