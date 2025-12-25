-- Debug Guide Module
-- Accessible via <leader>d?

local M = {}

local guide_text = [[
╔═══════════════════════════════════════════════════════════════════════╗
║                    🎓 DEBUG NEDIR? NASIL KULLANILIR?                  ║
║                  Başlangıçtan İleri Seviyeye Debug                    ║
╚═══════════════════════════════════════════════════════════════════════╝

┌─────────────────────────────────────────────────────────────────────┐
│ 📖 DEBUG NEDİR?                                                      │
└─────────────────────────────────────────────────────────────────────┘

Debug (hata ayıklama), kodunun çalışırken ADIM ADIM nasıl çalıştığını
izlemek ve sorunları bulmak için kullanılan bir tekniktir.

Normal çalıştırma:
  ┌──────┐
  │ Kod  │ ───→ Program baştan sona çalışır, biter
  └──────┘      (Ne olduğunu göremezsin)

Debug ile çalıştırma:
  ┌──────┐
  │ Kod  │ ───→ İstediğin yerde DUR
  └──────┘      Değişkenlere BAK
                Satır satır İLERLE
                Ne olduğunu GÖR

┌─────────────────────────────────────────────────────────────────────┐
│ 🤔 NE ZAMAN KULLANILIR?                                              │
└─────────────────────────────────────────────────────────────────────┘

✅ Kodum hata veriyor ama neden anlamıyorum
✅ Bir değişken yanlış değer alıyor, nereden geliyor?
✅ Kod beklenmedik şekilde davranıyor
✅ Loop'ta bir yerde yanlış gidiyor
✅ Fonksiyon yanlış değer döndürüyor
✅ API'den gelen data'yı incelemek istiyorum

❌ Kod çalışıyor ve sorun yok (gereksiz!)
❌ Syntax hatası var (LSP zaten gösterir)

┌─────────────────────────────────────────────────────────────────────┐
│ 🎯 TEMEL KONSEPTLER                                                  │
└─────────────────────────────────────────────────────────────────────┘

1. BREAKPOINT (Durak Noktası)
   ─────────────────────────────
   Kodun DURmasını istediğin satır. Program o satıra gelince durur.

   Örnek:
     10: def calculate(x, y):
     11:     result = x + y      ← BREAKPOINT BURAYA
     12:     return result

   Program satır 11'e gelince durur, sen bakmadan devam etmez.

2. STEP OVER (Atla)
   ─────────────────
   Sonraki satıra geç, ama fonksiyonun içine girme.

   Örnek:
     15: x = 5
     16: y = calculate(x, 3)  ← Buradan
     17: print(y)             ← Buraya atlar (calculate'e girmez)

3. STEP INTO (İçine Gir)
   ───────────────────────
   Sonraki satırdaki fonksiyonun İÇİNE gir.

   Örnek:
     16: y = calculate(x, 3)  ← Buradan
     10: def calculate(x, y): ← Fonksiyonun içine girer
     11:     result = x + y

4. STEP OUT (Çık)
   ────────────────
   Mevcut fonksiyondan çık, çağrıldığı yere dön.

   Örnek:
     11:     result = x + y   ← Buradan
     12:     return result
     17: print(y)             ← Buraya gider

5. CONTINUE (Devam Et)
   ─────────────────────
   Bir sonraki breakpoint'e kadar çalışmaya devam et.

┌─────────────────────────────────────────────────────────────────────┐
│ 🚀 PRATİK ÖRNEK: HATA BULMA                                          │
└─────────────────────────────────────────────────────────────────────┘

Diyelim bu kodun hata veriyor:

    1: def toplam_hesapla(sayilar):
    2:     sonuc = 0
    3:     for sayi in sayilar:
    4:         sonuc = sonuc + sayi
    5:     return sonuc
    6:
    7: liste = [1, 2, 3, 4, 5]
    8: print(toplam_hesapla(liste))

Debug Adımları:
═══════════════

1️⃣ BREAKPOINT KOY
   Satır 3'e breakpoint koy → <leader>db
   (Loop'un başına bakmak istiyoruz)

2️⃣ DEBUG BAŞLAT
   F5 veya <leader>dc
   → Program satır 3'te duracak

3️⃣ DEĞİŞKENLERE BAK
   Sol panelde (Scopes) göreceksin:
     sayilar = [1, 2, 3, 4, 5]
     sonuc = 0
     sayi = undefined (henüz atanmadı)

4️⃣ BİR ADIM İLERLE
   F10 (step over)
   → Satır 4'e geçer
   → sayi = 1 olur (sol panelde gör)

5️⃣ TEKRAR İLERLE
   F10 tekrar
   → sonuc = 1 olur (0 + 1)
   → Tekrar F10 → loop tekrar döner
   → sayi = 2 olur

Bu şekilde loop'un her adımında değişkenleri izleyebilirsin!

┌─────────────────────────────────────────────────────────────────────┐
│ 💡 GERÇEKÇİ SENARYO: API HATASI                                      │
└─────────────────────────────────────────────────────────────────────┘

Sorun:
  API'den data çekiyorsun ama hata alıyorsun. Neden?

Kod:
    1: def fetch_user_data(user_id):
    2:     response = api.get(f"/users/{user_id}")
    3:     data = response.json()
    4:     return data["name"]  ← Burada hata: KeyError

Debug ile çözüm:
═══════════════

1. Satır 3'e breakpoint koy (data geldiğinde bak)
2. F5 ile başlat
3. Sol panelde data'yı incele:
   data = {
     "username": "john",  ← "name" yok, "username" var!
     "email": "..."
   }
4. Hatayı buldun! "name" değil "username" kullanmalısın.

┌─────────────────────────────────────────────────────────────────────┐
│ 🔥 İLERİ SEVİYE: KOŞULLU BREAKPOINT                                 │
└─────────────────────────────────────────────────────────────────────┘

Durum: 1000 elemanlı loop var, sadece 500. elemanda hata oluyor.

Normal breakpoint: 1-499 arası da duracak (çok yavaş!)

Koşullu breakpoint kullan:
═══════════════════════════

1. Satıra git
2. <leader>dB (koşullu breakpoint)
3. Yaz: i == 500
4. F5 ile başlat
5. → Sadece i=500 olduğunda duracak!

Başka örnekler:
  • user_id == 42
  • len(data) > 100
  • response.status_code != 200

┌─────────────────────────────────────────────────────────────────────┐
│ 🧪 REPL İLE DENEY YAPMA                                             │
└─────────────────────────────────────────────────────────────────────┘

Debug dururken, REPL'de (alt panel) kod çalıştırabilirsin!

Örnek: Satır 5'te durdun, sonuc = 10

REPL'de yaz:
  >>> sonuc * 2
  20
  >>> type(sonuc)
  <class 'int'>
  >>> len(sayilar)
  5

Bu sayede değişkenlerle etkileşime geçebilirsin!

┌─────────────────────────────────────────────────────────────────────┐
│ ⚡ HIZLI BAŞLANGIÇ (İLK DEBUG DENEYİMİN)                             │
└─────────────────────────────────────────────────────────────────────┘

1. Bir Python dosyası aç (örnek: test.py)
2. İçine yaz:
     def test():
         x = 5
         y = 10
         return x + y

     print(test())

3. "x = 5" satırına git
4. <leader>db (breakpoint koy - satırda ● işareti görünür)
5. F5 (debug başlat)
6. Sol panel açılır → x, y değişkenlerini göreceksin
7. F10 (step over) → bir satır ilerle
8. Tekrar F10 → y = 10 atanır
9. F10 → return'e gelir
10. F5 → debug biter

Tebrikler! İlk debug deneyimini tamamladın! 🎉

┌─────────────────────────────────────────────────────────────────────┐
│ 🎮 ÖZET: HANGİ TUŞLAR NE İŞE YARAR?                                 │
└─────────────────────────────────────────────────────────────────────┘

  <leader>db   → Breakpoint koy/kaldır (● işareti)
  F5           → Debug başlat / Devam et
  F10          → Sonraki satır (fonksiyona girme)
  F11          → Fonksiyonun içine gir
  F12          → Fonksiyondan çık
  <leader>dtt  → UI aç/kapat
  <leader>dx   → Debug'ı bitir

Paneller:
  Sol Panel    → Değişkenler (scopes, watches)
  Alt Panel    → Console (output) + REPL (komut çalıştır)

┌─────────────────────────────────────────────────────────────────────┐
│ 🎯 DEBUG MINDSET                                                     │
└─────────────────────────────────────────────────────────────────────┘

Debug yaparken şunu sor:
1. Bu satırda değişkenler ne değerde?
2. Beklediğim gibi mi?
3. Değilse, bir önceki satırda ne oldu?

print() yerine debug kullan çünkü:
  ✅ Tüm değişkenleri otomatik gösterir
  ✅ Kodda gezinebilirsin
  ✅ REPL'de deney yapabilirsin
  ✅ Kodu değiştirip tekrar çalıştırmana gerek yok

┌─────────────────────────────────────────────────────────────────────┐
│ 📚 SIRA SENDE!                                                       │
└─────────────────────────────────────────────────────────────────────┘

Şimdi git, kendi kodunda bir breakpoint koy ve F5'e bas!
Debug yapmadan önce korkutucu görünür, yaptıktan sonra vazgeçemezsin.

Takıldığın yer olursa: :help dap

╔═══════════════════════════════════════════════════════════════════════╗
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
    vim.api.nvim_buf_set_option(buf, 'filetype', 'debug-guide')

    -- Calculate window size (80% of screen)
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)

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
        title = ' Debug Guide ',
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
        syntax match DebugGuideTitle /^╔.*╗$/
        syntax match DebugGuideTitle /^╚.*╝$/
        syntax match DebugGuideSection /^┌.*┐$/
        syntax match DebugGuideSection /^└.*┘$/
        syntax match DebugGuideKey /<leader>[^ ]*\|F[0-9]\+/
        syntax match DebugGuideEmoji /[🔍🎯🔧🚶🐍💡⚙️🎓📚]/

        highlight default link DebugGuideTitle Title
        highlight default link DebugGuideSection Special
        highlight default link DebugGuideKey Identifier
        highlight default DebugGuideEmoji guifg=#f7768e
    ]])
end

return M
