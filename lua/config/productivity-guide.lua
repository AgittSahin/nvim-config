-- Productivity Guide Module
-- Accessible via <leader>f?

local M = {}

local guide_text = [[
╔═══════════════════════════════════════════════════════════════════════╗
║               ⚡ VIM PRODUCTIVITY GUIDE - EN KULLANIŞLI ÖZELLİKLER     ║
║                Macros, Marks, Text Objects ve Daha Fazlası            ║
╚═══════════════════════════════════════════════════════════════════════╝

┌─────────────────────────────────────────────────────────────────────┐
│ 📹 MACROS - Tekrarlayan İşleri Otomatikleştir                        │
└─────────────────────────────────────────────────────────────────────┘

Macro kaydet ve çalıştır:
  qq          → q registerına kayıt BAŞLAT
  [komutlar]  → Yapmak istediğin işlemi yap
  q           → Kaydı DURDUR
  @q          → Macroyu çalıştır
  @@          → Son macroyu tekrar çalıştır
  5@q         → 5 kez çalıştır
  999@q       → Hata verene kadar çalıştır

Örnek: Her satıra tırnak ekle
  Önce:     name
  qq        → kayıt başlat
  I"<Esc>   → satır başına "
  A"<Esc>   → satır sonuna "
  j         → alt satır
  q         → kayıt durdur
  3@q       → 3 satır daha
  Sonuç:    "name"

Farklı registerlar: qa, qb, qc (aynı anda 26 macro)

┌─────────────────────────────────────────────────────────────────────┐
│ 🔖 MARKS - Dosya İçinde Hızlı Sıçrama                                │
└─────────────────────────────────────────────────────────────────────┘

Mark koy ve git:
  ma          → a markını koy (satırda)
  mA          → A markını koy (global, dosyalar arası)
  'a          → a markına git (satır başı)
  `a          → a markına git (tam konum)
  :marks      → Tüm markları göster
  :delmarks a → a markını sil

Örnek kullanım:
  1. Fonksiyonun başındayken: ma
  2. Dosyada başka yere git
  3. 'a → anında fonksiyon başına dön

Built-in marklar:
  '.          → Son düzenlenen satır
  '^          → Son insert moddan çıkılan yer
  ''          → Önceki konum
  '[  ']      → Son değişiklik başı/sonu

┌─────────────────────────────────────────────────────────────────────┐
│ 📋 REGISTERS - Çoklu Clipboard                                       │
└─────────────────────────────────────────────────────────────────────┘

Kullanım:
  "ayy        → a registerına kopyala
  "ap         → a registerından yapıştır
  "by3w       → 3 kelimeyi b registerına yank
  :reg        → Tüm registerları göster
  :reg a b c  → Belirli registerları göster

Özel registerlar:
  "+y         → Sistem clipboard'a kopyala
  "+p         → Sistem clipboard'dan yapıştır
  "0          → Son yank (delete etse bile)
  "1-"9       → Delete geçmişi
  "%          → Dosya adı
  "/          → Son arama

Örnek: 3 farklı snippet tutma
  "ayy  → satır 1'i a'ya
  "byy  → satır 2'yi b'ye
  "cyy  → satır 3'ü c'ye
  Sonra istediğin yere: "ap, "bp, "cp

┌─────────────────────────────────────────────────────────────────────┐
│ 🎯 TEXT OBJECTS - Akıllı Seçim/Düzenleme                            │
└─────────────────────────────────────────────────────────────────────┘

i (inner) / a (around) + nesne:
  ciw         → Kelimeyi değiştir (change inner word)
  diw         → Kelimeyi sil
  yiw         → Kelimeyi kopyala
  ci"         → "içindeki"ni değiştir
  ci'         → 'içindeki'ni değiştir
  ci(  ci)    → (içindeki)ni değiştir
  ci[  ci]    → [içindeki]ni değiştir
  ci{  ci}    → {içindeki}ni değiştir
  cit         → <tag>içindeki</tag>ni değiştir
  cis         → Cümleyi değiştir
  cip         → Paragrafı değiştir

a (around) farkı: parantez/tırnakları da içerir
  da"         → "tırnaklarla birlikte" sil
  ca{         → {süslü parantezle birlikte} değiştir

Örnek: function(x, y, z) içinde
  ci)  → x, y, z değiştir
  di)  → x, y, z sil
  da)  → (x, y, z) sil (parantezle birlikte)

┌─────────────────────────────────────────────────────────────────────┐
│ • DOT COMMAND - Son Değişikliği Tekrarla                            │
└─────────────────────────────────────────────────────────────────────┘

.           → Son değişikliği tekrarla

Örnek 1: Kelime silme
  dw          → kelime sil
  .           → tekrar sil
  .           → tekrar sil

Örnek 2: Macro gibi kullan
  ciw"test"<Esc>  → kelimeyi "test" yap
  w               → sonraki kelime
  .               → tekrar "test" yap
  w.              → sonraki "test"

Güçlü kombinasyon:
  /pattern    → ara
  cw<new><Esc> → değiştir
  n.          → sonrakini bul ve değiştir
  n.          → sonrakini bul ve değiştir

┌─────────────────────────────────────────────────────────────────────┐
│ ▋ VISUAL BLOCK MODE - Çoklu Satır Düzenleme                         │
└─────────────────────────────────────────────────────────────────────┘

Ctrl+v      → Visual block başlat
j/k         → Yukarı/aşağı genişlet
I           → Başa ekle (Esc ile tümüne uygulanır)
A           → Sona ekle
c           → Değiştir
d           → Sil

Örnek 1: Yorum ekle
  Ctrl+v    → block başlat
  jjj       → 4 satır seç
  I# <Esc>  → hepsine "# " ekle

Örnek 2: Sütun sil
  name   = "John"
  age    = 30
  city   = "NYC"

  Ctrl+v → = üstünde
  jj     → 3 satır
  d      → sütunu sil

Örnek 3: Sayı artır
  item1
  item1
  item1

  Ctrl+v → 1 üstünde
  jj
  g Ctrl+a  → sıralı artır (item1, item2, item3)

┌─────────────────────────────────────────────────────────────────────┐
│ 🧭 NAVIGATION - Hızlı Hareket                                        │
└─────────────────────────────────────────────────────────────────────┘

Karakter bazlı:
  f{char}     → {char}'a git (forward)
  F{char}     → Geriye git
  t{char}     → {char} öncesine git (till)
  ;           → Tekrarla
  ,           → Ters yönde tekrarla

Örnek: const name = "John";
  f"          → ilk "'ya git
  ;           → ikinci "'ya git
  dt;         → ; karakterine kadar sil

Arama:
  /pattern    → İleri ara
  ?pattern    → Geri ara
  n           → Sonraki
  N           → Önceki
  *           → İmlecin altındaki kelimeyi ara (ileri)
  #           → Geri ara
  gd          → Definition'a git (LSP)
  gD          → Declaration'a git

Jump list:
  Ctrl+o      → Önceki konum
  Ctrl+i      → Sonraki konum
  g;          → Önceki değişiklik
  g,          → Sonraki değişiklik

Satır içi:
  0           → Satır başı
  ^           → İlk karakter
  $           → Satır sonu
  g_          → Son karakter
  %           → Eşleşen paranteze git

┌─────────────────────────────────────────────────────────────────────┐
│ 🔄 SEARCH & REPLACE - Bul ve Değiştir                               │
└─────────────────────────────────────────────────────────────────────┘

Temel kullanım:
  :s/old/new/         → Satırda ilk eşleşmeyi değiştir
  :s/old/new/g        → Satırda tümünü değiştir
  :%s/old/new/g       → Dosyada tümünü değiştir
  :%s/old/new/gc      → Onay isteyerek değiştir
  :5,10s/old/new/g    → 5-10 satırlar arası

Visual mode ile:
  V               → Satırları seç
  :s/old/new/g    → Seçimde değiştir

Regex kullanımı:
  :%s/\d\+/NUM/g      → Tüm sayıları NUM yap
  :%s/\s\+$//g        → Satır sonlarındaki boşlukları sil
  :%s/\w\+/\u&/g      → İlk harfi büyük yap

Case sensitivity:
  :%s/old/new/gi      → Case-insensitive
  :%s/old/new/I       → Case-sensitive

Örnek: email değiştir
  :%s/@old\.com/@new.com/g

┌─────────────────────────────────────────────────────────────────────┐
│ ⚡ ADVANCED COMBINATIONS - Güç Kullanıcı İpuçları                    │
└─────────────────────────────────────────────────────────────────────┘

1. Macro + Visual Block:
   Ctrl+v → satırları seç
   :norm @q → seçili satırlara macro uygula

2. Global komut:
   :g/pattern/d     → Pattern içeren satırları sil
   :g/TODO/normal A!  → TODO satırlarına ! ekle
   :v/pattern/d     → Pattern OLMAYAN satırları sil

3. Increment/Decrement:
   Ctrl+a          → Sayıyı artır
   Ctrl+x          → Sayıyı azalt
   g Ctrl+a        → Visual block'ta sıralı artır

4. Çoklu dosya düzenleme:
   :args *.py      → Tüm .py dosyalarını yükle
   :argdo %s/old/new/ge | update  → Hepsinde değiştir

5. Register ile macro düzenle:
   :let @q='yiw'   → q registerına komut yaz
   :let @q='0i# '  → Satır başına # ekle macro

┌─────────────────────────────────────────────────────────────────────┐
│ 🎓 PRODUCTIVITY WORKFLOW                                             │
└─────────────────────────────────────────────────────────────────────┘

Sabah rutini:
  <leader>sr  → Session restore (önceki çalışmayı geri yükle)

Hızlı gezinme:
  <leader>ff  → Dosya ara
  <leader>fw  → Kelime ara (grep)
  <leader>fb  → Buffer'da ara
  gd          → Definition'a git
  gr          → References göster
  Ctrl+o      → Geri dön

Refactoring:
  ciw         → Kelimeyi değiştir
  .           → Tekrarla
  n.          → Sonrakini değiştir
  <leader>rn  → LSP rename (tüm dosyalarda)

Debugging:
  <leader>db  → Breakpoint
  F5          → Debug başlat
  F10         → Step over

Format ve fix:
  <leader>cf  → Format file
  <leader>ca  → Code action
  ]d / [d     → Next/prev diagnostic

Harpoon (hızlı dosya):
  <leader>ha  → Dosyayı ekle
  <leader>h1  → 1. dosya
  <leader>h2  → 2. dosya

┌─────────────────────────────────────────────────────────────────────┐
│ 💡 PROTİP: GÜN İÇİNDE NASIL KULLAN?                                 │
└─────────────────────────────────────────────────────────────────────┘

Senaryo 1: API response'larda tırnak değiştir
  Önce:  {name: 'John', age: 30}
  qq → f' → r" → ; → r" → q → 10@q
  Sonra: {name: "John", age: 30}

Senaryo 2: Import ekle
  ma → Import bölümüne git → o<type> → 'a
  (Neredeysen mark koy, git, dön)

Senaryo 3: Çoklu edit
  * → kelimeyi ara → cgn<yeni><Esc> → . → . → .
  (Sonrakini n ile atla, . ile değiştir)

Senaryo 4: Log cleanup
  :g/console\.log/d → Tüm log'ları sil

╔═══════════════════════════════════════════════════════════════════════╗
║  Bu özellikleri öğrendikçe 10x daha hızlı kod yazacaksın!            ║
║  Kapatmak için: q, <Esc>, veya <CR>                                  ║
╚═══════════════════════════════════════════════════════════════════════╝
]]

function M.show()
    -- Create a new buffer
    local buf = vim.api.nvim_create_buf(false, true)

    -- Split the guide text into lines
    local lines = {}
    for line in guide_text:gmatch("[^\n]+") do
        table.insert(lines, line)
    end

    -- Set buffer content
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

    -- Buffer settings
    vim.api.nvim_buf_set_option(buf, 'modifiable', false)
    vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
    vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
    vim.api.nvim_buf_set_option(buf, 'filetype', 'productivity-guide')

    -- Calculate window size (80% of screen)
    local width = math.floor(vim.o.columns * 0.85)
    local height = math.floor(vim.o.lines * 0.85)

    -- Calculate window position (centered)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    -- Window options
    local opts = {
        relative = 'editor',
        width = width,
        height = height,
        row = row,
        col = col,
        style = 'minimal',
        border = 'rounded',
        title = ' ⚡ Productivity Guide ',
        title_pos = 'center',
    }

    -- Open the window
    local win = vim.api.nvim_open_win(buf, true, opts)

    -- Window settings
    vim.api.nvim_win_set_option(win, 'wrap', false)
    vim.api.nvim_win_set_option(win, 'cursorline', true)

    -- Keymaps to close the window
    local close_keys = { 'q', '<Esc>', '<CR>' }
    for _, key in ipairs(close_keys) do
        vim.api.nvim_buf_set_keymap(buf, 'n', key, '<cmd>close<cr>',
            { noremap = true, silent = true })
    end

    -- Syntax highlighting
    vim.cmd([[
        syntax match ProductivityTitle /^╔.*╗$/
        syntax match ProductivityTitle /^╚.*╝$/
        syntax match ProductivitySection /^┌.*┐$/
        syntax match ProductivitySection /^└.*┘$/
        syntax match ProductivityKey /\<qq\>\|@[a-z]\|'[a-z]\|`[a-z]\|"[a-z]\|ci[wt"'([{]\|di[wt"'([{]\|yi[wt"'([{]\|ca[wt"'([{]\|da[wt"'([{]\|<leader>[^ ]*/
        syntax match ProductivityKey /Ctrl+[ovia]/
        syntax match ProductivityKey /g Ctrl+a/
        syntax match ProductivityCommand /:[a-z%]\+/
        syntax match ProductivityEmoji /[📹🔖📋🎯•▋🧭🔄⚡🎓💡]/

        highlight default link ProductivityTitle Title
        highlight default link ProductivitySection Special
        highlight default link ProductivityKey Identifier
        highlight default link ProductivityCommand Function
        highlight default ProductivityEmoji guifg=#f7768e
    ]])
end

return M
