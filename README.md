# FarsiVim

> A Persian-friendly distribution of **LazyVim** with proper RTL (Right-to-Left) editing support.

FarsiVim is a customized version of [LazyVim](https://github.com/LazyVim/LazyVim) that adds a much better editing experience for **Persian (فارسی)** while keeping everything that makes LazyVim fast, modern, and developer-friendly.

If you write code, documentation, Markdown, comments, or notes in Persian, FarsiVim makes Neovim much more comfortable to use.

---

## ✨ Features

- ✅ Full LazyVim experience
- 🇮🇷 Better Persian (RTL) editing support
- 🇮🇷 Persian text rendering improvements
- 🇮🇷 Persian punctuation compatibility
- 🇮🇷 Better cursor movement in Persian text
- 🇮🇷 Works alongside English editing
- 🇸🇦 Arabic characters are also supported

---

## 📸 Preview


# 📦 Requirements

Before installing FarsiVim, make sure you have:

- Neovim >= 0.11
- Git
- VazirCodeHack Nerd Font
- A terminal that supports Unicode

## ⚠️ Important

For the best Persian editing experience, **your terminal font must be:**

# VazirCodeHack Nerd Font

Without this font, Persian characters may not render correctly, cursor movement can become inaccurate, and alignment issues may occur.

You can download it from:

https://drive.google.com/file/d/1tTfew8c0Tg9-08uz6iNTf3pqwHepqy6Q/view?usp=sharing
After installing the font, set your terminal font to:

```text
VazirCodeHack Nerd Font
```

---

# 🚀 Installation

## 1. Backup your current Neovim configuration

Linux/macOS

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

Windows (PowerShell)

```powershell
Rename-Item $env:LOCALAPPDATA\nvim nvim.bak
Rename-Item $env:LOCALAPPDATA\nvim-data nvim-data.bak
```

---

## 2. Clone FarsiVim

```bash
git clone https://github.com/moeidkh/FarsiVim.git
```

## 3. Start Neovim

```bash
nvim
```

Lazy.nvim will automatically install all required plugins.

The first startup may take a few minutes.

---

# 🔄 Updating

Simply run:

```bash
cd ~/.config/nvim
git pull
```

Open Neovim and run:

```vim
:Lazy sync
```

---

# ❤️ Credits

This project is built on top of the amazing:

- [LazyVim](https://github.com/LazyVim/LazyVim)
- [lazy.nvim](https://github.com/folke/lazy.nvim)

Huge thanks to all their contributors.

---

# 🤝 Contributing

Pull requests, bug reports, and feature suggestions are always welcome.

If you find an issue with Persian editing, please open an issue on GitHub.

---

# ⭐ Support

If you like this project, consider giving it a ⭐ on GitHub.

It helps others discover FarsiVim and motivates future improvements.

---

Made with ❤️ for the Persian Neovim community.
