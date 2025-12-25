# Neovim Konfigürasyon Değişiklikleri

## 🎯 Özet
Neovim konfigürasyonu PyCharm seviyesinde git, LSP ve debug yetenekleri için optimize edildi. Gereksiz pluginler kaldırıldı, sadece gerekli ve kullanışlı olanlar bırakıldı.

## ✅ Yapılan Değişiklikler

### 1. 🔧 Git - Lazygit ile Minimize
**Öncesi:**
- vim-fugitive (ağır, çok komut)
- gitsigns.nvim (birçok keymap)

**Sonrası:**
- ✨ **Sadece lazygit.nvim** - Tüm git işlemleri tek TUI'da
- Keymap: `<leader>gg` → LazyGit açar
- Tüm git işlemleri (commit, push, pull, branch, stash, vb.) lazygit içinde

### 2. 🧠 LSP - PyCharm Seviyesi
**Optimize Edilen Özellikler:**
- ✅ **Python (basedpyright)**:
  - Type checking açık
  - Auto-import completions
  - Inlay hints (tip önerileri)
  - Method extraction ve refactoring için code actions
  - Workspace-wide analysis

- ✅ **C/C++ (clangd)**:
  - Full refactoring support
  - C++23 standard

- ✅ **Rust (rust-analyzer)**:
  - Clippy integration
  - Inlay hints

- ✅ **Lua (lua_ls)**:
  - Neovim API completion
  - Inlay hints

**Yeni Kütüphane Açıklamaları:**
- LSP'ler yeni kütüphane indirdiğinizde otomatik dokümantasyon sağlar
- `K` ile hover → detaylı açıklama
- `<leader>ca` → code actions (import ekle, method extract, vb.)

### 3. 🐛 Debugger - Modern DAP Setup
**Öncesi:**
- Basit nvim-dap kurulumu
- dap-view (eski UI)
- Manuel konfigürasyon

**Sonrası:**
- ✨ **nvim-dap + nvim-dap-ui** (modern, güçlü UI)
- ✨ **nvim-dap-python** (Python için özel)
- ✅ Otomatik virtual environment detection
- ✅ Virtual text (değişken değerleri inline gösterilir)
- ✅ Pytest integration

**Debugger Özellikleri:**
- Breakpoint'ler (normal + koşullu)
- Step into/over/out
- Variable inspection (scopes, watches)
- REPL (debug sırasında kod çalıştır)
- Python test debugging (`<leader>dtm` - test method debug)

### 4. 📚 Debug Guide - `<leader>d?`
**Yeni Özellik:**
- Kapsamlı Türkçe debug rehberi
- Tüm debug komutları ve örnekler
- PyCharm workflow benzeri
- `<leader>d?` ile aç

### 5. 🗑️ Temizlenen Pluginler
- ❌ vim-fugitive (lazygit kullanıyoruz)
- ❌ gitsigns.nvim (lazygit kullanıyoruz)
- ❌ smear-cursor.nvim (sadece görsel efekt, gereksiz)
- ❌ rainbow-delimiters.nvim (çok kullanışlı değil)
- ❌ indent-blankline.nvim (opsiyonel, gereksiz)

## 🎮 Önemli Keymaps

### Git
```
<leader>gg    LazyGit aç (tüm git işlemleri burada)
```

### Debug
```
<leader>d?    Debug guide'ı aç (yeni!)
<leader>db    Toggle breakpoint
<leader>dB    Conditional breakpoint
<leader>dc    Continue / Start debug (F5)
<leader>di    Step into (F11)
<leader>do    Step over (F10)
<leader>dO    Step out (F12)
<leader>dtt   Toggle DAP UI
<leader>dh    Hover variable values
<leader>dtm   Test method debug (Python)
<leader>dtc   Test class debug (Python)
<leader>dx    Terminate debug
```

### LSP (Code Actions)
```
<leader>ca    Code action (method extraction, import, refactor)
<leader>cr    Rename
<leader>cf    Format
K             Hover documentation
gd            Go to definition
gr            References
<leader>ci    LSP info
```

## 📦 Kurulum Adımları

1. **Neovim'i Başlat:**
```bash
nvim
```

2. **Pluginleri Yükle:**
   - Lazy.nvim otomatik pluginleri yükleyecek
   - Eksik olanları `:Lazy sync` ile yükle

3. **LSP ve Debug Toollarını Kur:**
```vim
:Mason
```
   Açılan pencerede şunları kur:
   - `basedpyright` (Python LSP)
   - `debugpy` (Python debugger)
   - `ruff` (Python formatter/linter)
   - `lua-language-server` (Lua LSP)
   - `clangd` (C/C++ LSP)
   - `rust-analyzer` (Rust LSP)

4. **Python için debugpy Kur:**
```bash
pip install debugpy
```

## 🎓 Debug Kullanımı (Hızlı Başlangıç)

1. Python dosyasını aç
2. Hata aldığın satıra git
3. `<leader>db` → breakpoint koy
4. `<leader>dc` veya `F5` → debug başlat
5. UI otomatik açılır:
   - Sol: değişkenler (scopes, watches)
   - Alt: console ve REPL
6. `F10` (step over) ile ilerle
7. `F11` (step into) ile fonksiyona gir
8. `<leader>dh` ile değişkenleri incele
9. `<leader>dx` ile bitir

**Daha fazla bilgi için:** `<leader>d?` (debug guide)

## 🚀 PyCharm Karşılaştırması

| Özellik | PyCharm | Bu Neovim Config |
|---------|---------|------------------|
| Git GUI | ✅ | ✅ (LazyGit) |
| Debugger | ✅ | ✅ (nvim-dap) |
| Breakpoints | ✅ | ✅ |
| Step debugging | ✅ | ✅ |
| Variable inspection | ✅ | ✅ |
| REPL | ✅ | ✅ |
| Method extraction | ✅ | ✅ (code actions) |
| Auto-import | ✅ | ✅ |
| Type hints | ✅ | ✅ (inlay hints) |
| Refactoring | ✅ | ✅ |
| Test debugging | ✅ | ✅ |
| Lightweight | ❌ | ✅ |

## 📝 Notlar

- Virtual environment otomatik tespit edilir (venv/.venv)
- Inlay hints `<leader>th` ile açılıp kapatılabilir
- Debug UI otomatik açılır/kapanır
- Breakpoint'ler dosya kaydedildiğinde korunur
- LazyGit içinde tüm git komutları mevcuttur (öğrenmesi kolay)

## 🆘 Yardım

- `:help dap` → Debug dokümantasyonu
- `<leader>d?` → Debug guide
- `:Mason` → LSP/formatter/linter yönetimi
- `:Lazy` → Plugin yönetimi
