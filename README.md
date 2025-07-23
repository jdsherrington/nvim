# NEOVIM-JDS

My personal Neovim config. Originally based on Kickstart, but has since been heavily customised to fit my needs.

- [jdsherrington/sequence](https://github.com/jdsherrington/sequence/tree/main/nvim) A low-contrast, cozy, focused colorscheme created by me.

- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim): Quickly toggle comments on lines or selections using gc (or other configured keys), saving me from manually adding/removing comment syntax.

- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim): Displays git changes (added, modified, deleted lines) directly in the sign column (gutter) for immediate visual feedback on my work relative to the repository state.

- [folke/which-key.nvim](https://github.com/folke/which-key.nvim): Helps me track and remember keybindings by showing available mappings in a popup window after I type my leader key.

- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): The core plugin for configuring and managing Language Server Protocol (LSP) clients, enabling IDE-like features (diagnostics, completion, navigation) for various languages.

- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) & mason-lspconfig.nvim & mason-tool-installer.nvim: Simplifies installing and managing the actual LSP servers, formatters, linters, and other external tools that nvim-lspconfig and other plugins rely on.

- [j-hui/fidget.nvim](https://github.com/j-hui/fidget.nvim): Provides unobtrusive notifications in the corner of my screen about ongoing LSP progress (e.g., "Initializing workspace", "Indexing").

- [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim): Automatically formats my code (e.g., on save) using external tools (like prettierd, stylua) to ensure consistent code style across projects.

- [saghen/blink.cmp](https://github.com/saghen/blink.cmp): An extensible autocompletion engine that provides suggestions as I type, integrating various sources.

- [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip): A snippet engine that allows me to define and expand reusable code templates (snippets) for faster typing of common code patterns.

- [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim): Highlights special keywords like TODO, FIXME, NOTE within my comments, making them stand out visually and allowing me to easily find/list them.

- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Provides advanced code parsing based on language grammars, enabling more accurate syntax highlighting, indentation, text objects, and potentially other code-aware features.

- [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim): Displays my custom splash screen when opening Neovim.

- [ibhagwan/fzf-lua](https://github.com/ibhagwan/fzf-lua): An implmentation of fzf into Neovim, allowing quick switching and selection of various different things.

- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs): Automatically inserts the closing part of pairs (like (), [], {}, "", '') when I type the opening one, and can optionally add parentheses () after selecting a function/method during autocompletion.

- [xiyaowong/transparent.nvim](https://github.com/xiyaowong/transparent.nvim): Makes the Neovim editor background transparent, allowing my terminal emulator's background or desktop wallpaper to show through for theming purposes.

- [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator): Allows seamless navigation between vim and tmux splits using a consistent set of hotkeys.

- custom.plugins (via import): Acts as a placeholder entry point for loading any additional plugin configurations I might want to trial.
