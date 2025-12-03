# Contributing to Neovim Configuration

Thank you for your interest in contributing! This document provides guidelines for contributing to this Neovim configuration.

## How to Contribute

### Reporting Issues

If you encounter bugs or have feature requests:

1. Check if the issue already exists in the [Issues](../../issues) section
2. Create a new issue with:
   - Clear description of the problem/feature
   - Steps to reproduce (for bugs)
   - Your Neovim version (`:version`)
   - Your OS and terminal

### Submitting Changes

1. Fork the repository
2. Create a new branch: `git checkout -b feature/your-feature-name`
3. Make your changes
4. Test thoroughly
5. Commit with clear messages
6. Push to your fork
7. Open a Pull Request

### Code Style

- Use 4 spaces for indentation (Lua standard)
- Keep lines under 120 characters when possible
- Add comments for complex logic
- Follow existing code structure

### Plugin Guidelines

When adding new plugins:

1. Place plugin configuration in the appropriate file:
   - LSP-related: `lua/plugins/lsp.lua`
   - Editor enhancements: `lua/plugins/editor.lua`
   - Navigation: `lua/plugins/navigation.lua`
   - UI/Theme: `lua/plugins/theme.lua`
   - Utilities: `lua/plugins/utilities.lua`
   - Create new file if it doesn't fit existing categories

2. Use lazy loading when possible
3. Add keybindings to `lua/plugins/which-key.lua` if applicable
4. Update README.md with new features

### Keybinding Guidelines

- Use descriptive names
- Follow existing patterns (leader key groups)
- Avoid overriding default Vim keybindings unless necessary
- Add descriptions for which-key

### Testing

Before submitting:

1. Test your changes in a clean Neovim install
2. Run `:checkhealth` to ensure no issues
3. Test with multiple file types if applicable
4. Verify keybindings don't conflict

## Questions?

Feel free to open an issue for any questions!
