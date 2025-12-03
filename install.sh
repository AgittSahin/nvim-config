#!/bin/bash
# Neovim Configuration Installation Script

set -e

echo "🚀 Installing Neovim Configuration..."

# Check if Neovim is installed
if ! command -v nvim &> /dev/null; then
    echo "❌ Neovim is not installed. Please install Neovim first."
    exit 1
fi

# Backup existing config if it exists
if [ -d "$HOME/.config/nvim" ]; then
    echo "📦 Backing up existing Neovim configuration..."
    mv "$HOME/.config/nvim" "$HOME/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)"
fi

# Clone the repository
echo "📥 Cloning configuration..."
git clone https://github.com/AgittSahin/nvim-config.git "$HOME/.config/nvim"

# Create undo directory
echo "📁 Creating undo directory..."
mkdir -p "$HOME/.vim/undodir"

echo "✅ Installation complete!"
echo ""
echo "Next steps:"
echo "1. Open Neovim with 'nvim'"
echo "2. Lazy.nvim will automatically install all plugins"
echo "3. Run :checkhealth to verify everything is working"
echo "4. Install language servers with :Mason"
echo ""
echo "Recommended tools to install:"
echo "  - ripgrep (for live_grep)"
echo "  - fd (for file search)"
echo "  - git (for git integration)"
echo "  - a Nerd Font (for icons)"
