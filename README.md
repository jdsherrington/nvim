# jds-nvim

My personal Neovim config. Based on Kickstart, but has since been spun off into it's own flavor.

- numToStr/Comment.nvim: Quickly toggle comments on lines or selections using gc (or other configured keys), saving me from manually adding/removing comment syntax.

- lewis6991/gitsigns.nvim: Displays git changes (added, modified, deleted lines) directly in the sign column (gutter) for immediate visual feedback on my work relative to the repository state.

- folke/which-key.nvim: Helps me track and remember keybindings by showing available mappings in a popup window after I type my leader key.

- neovim/nvim-lspconfig: The core plugin for configuring and managing Language Server Protocol (LSP) clients, enabling IDE-like features (diagnostics, completion, navigation) for various languages.

- williamboman/mason.nvim & mason-lspconfig.nvim & mason-tool-installer.nvim: Simplifies installing and managing the actual LSP servers, formatters, linters, and other external tools that nvim-lspconfig and other plugins rely on.

- j-hui/fidget.nvim: Provides unobtrusive notifications in the corner of my screen about ongoing LSP progress (e.g., "Initializing workspace", "Indexing").

- stevearc/conform.nvim: Automatically formats my code (e.g., on save) using external tools (like prettierd, stylua) to ensure consistent code style across projects.

- hrsh7th/nvim-cmp: An extensible autocompletion engine that provides suggestions as I type, integrating various sources.

- L3MON4D3/LuaSnip: A snippet engine that allows me to define and expand reusable code templates (snippets) for faster typing of common code patterns.

- saadparwaiz1/cmp_luasnip & hrsh7th/cmp-nvim-lsp & hrsh7th/cmp-path: Sources for nvim-cmp, enabling it to get completion suggestions specifically from LuaSnip snippets, my configured Language Servers, and file system paths, respectively.

- chriskempson/base16-vim: Provides the specific Base16 Default Dark colorscheme (and others in the family) that defines the visual appearance (colors) of my editor UI and code. I've configured this to use my terminal's color palette exclusively.

- folke/todo-comments.nvim: Highlights special keywords like TODO, FIXME, NOTE within my comments, making them stand out visually and allowing me to easily find/list them.

- echasnovski/mini.nvim: A collection of focused, independent Lua modules providing useful enhancements. For my purposes, I'm only using mini.ai (improved text objects) and mini.statusline (a minimal status line).

- sphamba/smear-cursor.nvim: Adds a purely cosmetic "smearing" trail effect to the cursor as it moves across the screen; helps me effortlessly track rapid cursor movements.

- nvim-treesitter/nvim-treesitter: Provides advanced code parsing based on language grammars, enabling more accurate syntax highlighting, indentation, text objects, and potentially other code-aware features.

- goolord/alpha-nvim: Displays my custom splash screen when opening Neovim.

- echasnovski/mini.icons (as dependency): Provides a set of icons used by other plugins (like Alpha, Snacks) to display file type or UI element icons.

- folke/snacks.nvim: An "all-in-one" plugin aiming to provide a cohesive user experience with a fuzzy finder (picker), file explorer, improved UI components (notifications, input, select), smooth scrolling, LSP integration (words), and more.

- windwp/nvim-autopairs: Automatically inserts the closing part of pairs (like (), [], {}, "", '') when I type the opening one, and can optionally add parentheses () after selecting a function/method during autocompletion.

- xiyaowong/transparent.nvim: Makes the Neovim editor background transparent, allowing my terminal emulator's background or desktop wallpaper to show through for theming purposes.

- custom.plugins (via import): Acts as a placeholder entry point for loading any additional plugin configurations I might want to trial.
