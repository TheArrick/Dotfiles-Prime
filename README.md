# 🛠️ Dotfiles — Arrick

Configuraciones personales para un entorno de desarrollo en **macOS**, optimizadas para productividad con Neovim, Sketchybar y Flutter.

---

## 📁 Estructura del Repositorio

```
Dotfiles/
├── nvim/           # Configuración de Neovim (Lua)
├── sketchybar/     # Barra de estado personalizada para macOS
└── flutter/        # Estado de herramientas de Flutter
```

---

## 🧠 Neovim

Configuración moderna de Neovim completamente escrita en **Lua**, gestionada con [lazy.nvim](https://github.com/folke/lazy.nvim).

### Estructura

```
nvim/
├── init.lua
├── lazy-lock.json
└── lua/
    └── arrick/
        ├── lazy.lua
        ├── core/
        │   ├── init.lua
        │   └── options.lua          # Opciones, keymaps base, fixes de compatibilidad
        └── plugins/
            ├── colorscheme.lua      # Temas: Everforest + Gruvbox Material
            ├── editor.lua           # Comment, Surround, Harpoon, Trouble, Which-key, Todo-comments, ts-autotag
            ├── flutter.lua          # Flutter Tools
            ├── formatting.lua       # conform.nvim (formato al guardar)
            ├── git.lua              # Gitsigns + LazyGit
            ├── latex.lua            # VimTeX
            ├── markdown.lua         # Markdown Preview (navegador)
            ├── nvim-cmp.lua         # Autocompletado + LuaSnip
            ├── telescope.lua        # Búsqueda + Tmux Manager
            ├── treesitter.lua       # Resaltado sintáctico (20 parsers)
            ├── ui.lua               # Lualine, NvimTree, Autopairs, Colorizer, etc.
            └── lsp/
                ├── mason.lua        # Instalador automático de LSPs/linters/formatters
                └── lspconfig.lua    # Configuración LSP (nueva API vim.lsp.config)
```

---

### ⚙️ Configuración Principal

| Opción              | Valor                   |
| ------------------- | ----------------------- |
| `mapleader`         | `Espacio`               |
| Números de línea    | Relativos               |
| Tab size            | 4 espacios              |
| Clipboard           | Sistema (`unnamedplus`) |
| Background          | Dark                    |
| Splits              | Derecha y abajo         |
| Tema predeterminado | Everforest              |

---

### 🎨 Temas de Color

| Plugin                     | Descripción                                         |
| -------------------------- | --------------------------------------------------- |
| `neanias/everforest-nvim`  | Tema principal (fondo transparente, contraste alto) |
| `sainnhe/gruvbox-material` | Tema alternativo con itálicas                       |

Cambia el tema en cualquier momento con `<leader>ths` (Telescope themes con preview en vivo).

---

### 🔌 Plugins

#### 🔍 Búsqueda y Navegación

| Plugin                                     | Descripción                                  |
| ------------------------------------------ | -------------------------------------------- |
| `nvim-telescope/telescope.nvim`            | Buscador difuso de archivos, texto, buffers  |
| `nvim-telescope/telescope-fzf-native.nvim` | Motor FZF nativo para Telescope              |
| `andrew-george/telescope-themes`           | Cambio de temas con preview en vivo          |
| `nvim-tree/nvim-tree.lua`                  | Explorador de archivos tipo árbol            |
| `ThePrimeagen/harpoon` (v2)                | Marcadores rápidos entre archivos frecuentes |
| `nvim-lua/plenary.nvim`                    | Librería de utilidades Lua                   |
| `nvim-tree/nvim-web-devicons`              | Iconos de archivos                           |

#### 📝 Autocompletado

| Plugin                         | Descripción                       |
| ------------------------------ | --------------------------------- |
| `hrsh7th/nvim-cmp`             | Motor de autocompletado           |
| `hrsh7th/cmp-nvim-lsp`         | Fuente de completado desde LSP    |
| `hrsh7th/cmp-buffer`           | Completado desde el buffer actual |
| `hrsh7th/cmp-path`             | Completado de rutas del sistema   |
| `L3MON4D3/LuaSnip`             | Motor de snippets                 |
| `saadparwaiz1/cmp_luasnip`     | Integración LuaSnip → nvim-cmp    |
| `rafamadriz/friendly-snippets` | Snippets estilo VSCode            |
| `onsails/lspkind.nvim`         | Iconos en el menú de completado   |

#### 🩺 LSP

| Plugin                                      | Descripción                                           |
| ------------------------------------------- | ----------------------------------------------------- |
| `neovim/nvim-lspconfig`                     | Definiciones de servidores LSP (API `vim.lsp.config`) |
| `williamboman/mason.nvim`                   | Gestor de instalación de LSPs                         |
| `williamboman/mason-lspconfig.nvim`         | Integración Mason ↔ lspconfig                        |
| `WhoIsSethDaniel/mason-tool-installer.nvim` | Instalación automática de herramientas                |

**Servidores LSP instalados automáticamente:**

| Servidor      | Lenguaje                |
| ------------- | ----------------------- |
| `ts_ls`       | TypeScript / JavaScript |
| `html`        | HTML                    |
| `cssls`       | CSS                     |
| `tailwindcss` | Tailwind CSS            |
| `svelte`      | Svelte                  |
| `lua_ls`      | Lua                     |
| `graphql`     | GraphQL                 |
| `emmet_ls`    | Emmet                   |
| `prismals`    | Prisma ORM              |
| `pyright`     | Python                  |
| `clangd`      | C / C++                 |
| `hls`         | Haskell                 |
| `csharp_ls`   | C#                      |

#### 🧹 Formateo — conform.nvim (auto al guardar)

| Herramienta       | Lenguajes                                                          |
| ----------------- | ------------------------------------------------------------------ |
| `prettier`        | JS, TS, JSX, TSX, Svelte, CSS, HTML, JSON, YAML, Markdown, GraphQL |
| `stylua`          | Lua                                                                |
| `isort` + `black` | Python                                                             |
| `clang-format`    | C, C++                                                             |
| `eslint_d`        | JavaScript (linter)                                                |
| `pylint`          | Python (linter)                                                    |

#### 🌿 Git

| Plugin                    | Descripción                                         |
| ------------------------- | --------------------------------------------------- |
| `lewis6991/gitsigns.nvim` | Signos en gutter, blame inline, navegación de hunks |
| `kdheepak/lazygit.nvim`   | LazyGit integrado en Neovim                         |

#### ✍️ Edición

| Plugin                   | Descripción                                         |
| ------------------------ | --------------------------------------------------- |
| `numToStr/Comment.nvim`  | Comentar/descomentar con `gcc` / `gc`               |
| `kylechui/nvim-surround` | Editar comillas, paréntesis, tags: `ys`, `cs`, `ds` |
| `windwp/nvim-ts-autotag` | Cierre automático de tags HTML/JSX/Svelte           |
| `windwp/nvim-autopairs`  | Cierre automático de paréntesis y corchetes         |

#### 🔴 Diagnósticos y TODOs

| Plugin                     | Descripción                                       |
| -------------------------- | ------------------------------------------------- |
| `folke/trouble.nvim`       | Panel de diagnósticos LSP mejorado                |
| `folke/todo-comments.nvim` | Resaltar y listar `TODO`, `FIXME`, `HACK`, `NOTE` |

#### 🗺️ Which-key

| Plugin                 | Descripción                             |
| ---------------------- | --------------------------------------- |
| `folke/which-key.nvim` | Popup de atajos al presionar `<leader>` |

#### 🖥️ Interfaz de Usuario

| Plugin                                | Descripción                         |
| ------------------------------------- | ----------------------------------- |
| `nvim-lualine/lualine.nvim`           | Barra de estado (tema Everforest)   |
| `lukas-reineke/indent-blankline.nvim` | Guías de indentación                |
| `catgoose/nvim-colorizer.lua`         | Preview de colores hex en el editor |
| `stevearc/dressing.nvim`              | Inputs y selects mejorados          |

#### 🌳 Syntax Highlighting

| Plugin                            | Descripción                        |
| --------------------------------- | ---------------------------------- |
| `nvim-treesitter/nvim-treesitter` | Resaltado sintáctico basado en AST |

**Parsers instalados:** `lua`, `vim`, `vimdoc`, `html`, `css`, `javascript`, `typescript`, `tsx`, `svelte`, `graphql`, `python`, `c`, `cpp`, `java`, `json`, `yaml`, `toml`, `bash`, `dart`, `prisma`

> ⚠️ `markdown` y `markdown_inline` están deshabilitados por incompatibilidad con Neovim 0.12.5. Usar `markdown-preview.nvim` para visualizar `.md`.

#### 📝 Markdown

| Plugin                         | Descripción                                        |
| ------------------------------ | -------------------------------------------------- |
| `iamcco/markdown-preview.nvim` | Preview de Markdown en el navegador con hot-reload |

**Uso:**

- Abre un archivo `.md`
- Presiona `<leader>mp` para abrir el preview en el navegador
- El preview se actualiza en tiempo real mientras editas

#### 🔗 Tmux

| Plugin                                     | Descripción                         |
| ------------------------------------------ | ----------------------------------- |
| `christoomey/vim-tmux-navigator`           | Navegación entre paneles Nvim/Tmux  |
| `otavioschwanck/tmux-awesome-manager.nvim` | Gestión de comandos Tmux desde Nvim |

#### 📱 Flutter / Java

| Plugin                       | Descripción                    |
| ---------------------------- | ------------------------------ |
| `akinsho/flutter-tools.nvim` | Herramientas para Flutter/Dart |
| `mfussenegger/nvim-jdtls`    | Soporte Java                   |

#### 📄 LaTeX

| Plugin          | Descripción                                |
| --------------- | ------------------------------------------ |
| `lervag/vimtex` | Soporte completo para LaTeX (viewer: Skim) |

---

### ⌨️ Keymaps Completos

> `<leader>` = `Espacio`

#### 📁 Explorador de Archivos

| Atajo        | Acción                              |
| ------------ | ----------------------------------- |
| `<leader>ee` | Abrir/cerrar explorador             |
| `<leader>ef` | Buscar archivo activo en explorador |
| `<leader>ec` | Colapsar todo                       |
| `<leader>er` | Refrescar                           |

#### 🔍 Telescope

| Atajo         | Acción                   |
| ------------- | ------------------------ |
| `<leader>pr`  | Buscar archivos          |
| `<leader>pt`  | Buscar texto (live grep) |
| `<leader>fb`  | Listar buffers           |
| `<leader>fh`  | Buscar en ayuda          |
| `<leader>ths` | Cambiar tema de color    |

#### 🪝 Harpoon

| Atajo          | Acción                |
| -------------- | --------------------- |
| `<leader>ha`   | Marcar archivo        |
| `<leader>hh`   | Abrir menú            |
| `<leader>h1-4` | Saltar al archivo 1-4 |

#### 🩺 LSP

| Atajo        | Acción                  |
| ------------ | ----------------------- |
| `gd`         | Ir a definición         |
| `gD`         | Ir a declaración        |
| `gR`         | Ver referencias         |
| `gi`         | Ver implementaciones    |
| `gt`         | Ver tipo                |
| `K`          | Documentación hover     |
| `<leader>ca` | Acciones de código      |
| `<leader>rn` | Renombrar símbolo       |
| `<leader>d`  | Diagnóstico de línea    |
| `<leader>D`  | Diagnósticos del buffer |
| `<leader>rs` | Reiniciar LSP           |

#### 🔴 Trouble

| Atajo        | Acción                     |
| ------------ | -------------------------- |
| `<leader>xx` | Diagnósticos del workspace |
| `<leader>xd` | Diagnósticos del buffer    |
| `<leader>xs` | Símbolos                   |
| `<leader>xl` | Panel LSP                  |
| `<leader>xq` | Quickfix                   |

#### 🌿 Git

| Atajo        | Acción                  |
| ------------ | ----------------------- |
| `<leader>gg` | Abrir LazyGit           |
| `]h` / `[h`  | Siguiente/anterior hunk |
| `<leader>gs` | Stage hunk              |
| `<leader>gr` | Reset hunk              |
| `<leader>gS` | Stage buffer            |
| `<leader>gb` | Toggle blame inline     |
| `<leader>gd` | Diff con HEAD           |

#### 💬 Comentarios

| Atajo         | Acción                     |
| ------------- | -------------------------- |
| `gcc`         | Comentar/descomentar línea |
| `gc` (visual) | Comentar selección         |

#### 🔗 Surround

| Atajo   | Ejemplo          | Resultado |
| ------- | ---------------- | --------- |
| `ysiw"` | cursor en `hola` | `"hola"`  |
| `cs"'`  | `"hola"`         | `'hola'`  |
| `ds"`   | `"hola"`         | `hola`    |

#### ✅ TODOs

| Atajo        | Acción                  |
| ------------ | ----------------------- |
| `]t` / `[t`  | Siguiente/anterior TODO |
| `<leader>ts` | Buscar con Telescope    |
| `<leader>td` | Ver en Trouble          |

#### 📝 Markdown

| Atajo        | Acción                               |
| ------------ | ------------------------------------ |
| `<leader>mp` | Preview en navegador (solo en `.md`) |

#### 🧹 Formateo

| Atajo        | Acción                        |
| ------------ | ----------------------------- |
| `<leader>fm` | Formatear archivo o selección |
| (auto)       | Se formatea al guardar        |

#### 📋 General

| Atajo         | Acción                                 |
| ------------- | -------------------------------------- |
| `<leader>cp`  | Copiar todo el archivo al portapapeles |
| `<leader>?`   | Ver atajos del buffer (Which-key)      |
| `<C-h/j/k/l>` | Navegar entre paneles Nvim/Tmux        |

---

## 📊 Sketchybar

Barra de estado personalizada para **macOS** con [SketchyBar](https://github.com/FelixKratz/SketchyBar) + [AeroSpace](https://github.com/nikitabobko/AeroSpace).

### Estructura

```
sketchybar/
├── sketchybarrc          # Config principal
├── colors.sh             # Paleta Everforest
├── icons.sh              # Iconos
├── icon_map.sh           # Mapa de iconos por app
├── items/                # Definición de items
│   ├── apple.sh
│   ├── aerospace_spaces.sh
│   ├── front_app.sh
│   ├── clock.sh, calendar.sh, battery.sh
│   ├── cpu.sh, ram.sh, wifi.sh
│   ├── volume.sh, spotify.sh
│   ├── github.sh, brew.sh
│   └── spaces.sh
└── plugins/              # Scripts de actualización
```

### Layout de la Barra

```
[  Spaces]  [Front App]          [wifi  cpu  ram]  [clock  cal  battery]
 Izquierda                        SysInfo (azul)     Status (verde)
```

### Paleta de Colores (Everforest)

| Color | Hex       | Uso           |
| ----- | --------- | ------------- |
| BLACK | `#2d353b` | Fondo popups  |
| WHITE | `#d3c6aa` | Texto/iconos  |
| GREEN | `#a7c080` | Borde Status  |
| BLUE  | `#7fbbb3` | Borde SysInfo |
| RED   | `#e67e80` | Alertas       |

---

## 🔧 Dependencias del Sistema

### Neovim

| Dependencia | Versión    | Instalación            |
| ----------- | ---------- | ---------------------- |
| Neovim      | ≥ 0.11     | `brew install neovim`  |
| Git         | Cualquiera | Preinstalado           |
| `make`      | Cualquiera | Xcode CLT              |
| `ripgrep`   | Cualquiera | `brew install ripgrep` |
| `fd`        | Cualquiera | `brew install fd`      |
| Node.js     | LTS        | `brew install node`    |
| Python 3    | ≥ 3.8      | `brew install python`  |
| Clang/LLVM  | Cualquiera | Xcode CLT              |
| Tmux        | Cualquiera | `brew install tmux`    |
| LazyGit     | Cualquiera | `brew install lazygit` |

### Sketchybar

| Dependencia    | Instalación                               |
| -------------- | ----------------------------------------- |
| SketchyBar     | `brew install sketchybar`                 |
| AeroSpace      | `brew install --cask aerospace`           |
| Hack Nerd Font | `brew install --cask font-hack-nerd-font` |

---

## 🚀 Instalación

```bash
# 1. Clonar
git clone https://github.com/<tu-usuario>/Dotfiles.git ~/Workspace/Dotfiles

# 2. Enlazar configuraciones
ln -sf ~/Workspace/Dotfiles/nvim ~/.config/nvim
ln -sf ~/Workspace/Dotfiles/sketchybar ~/.config/sketchybar

# 3. Instalar dependencias
brew install neovim ripgrep fd node python tmux lazygit
brew install sketchybar
brew install --cask aerospace font-hack-nerd-font

# 4. Abrir Neovim (lazy.nvim se instala automáticamente)
nvim
# Dentro de Neovim: :Lazy sync
# Luego: :MasonUpdate para instalar LSPs

# 5. Iniciar Sketchybar
brew services start sketchybar
```

---

## 📝 Notas

- El template de C++ se busca en `~/Workspace/Competitiva/Template/template.cpp`
- La integración Tmux renombra ventanas con el nombre del archivo activo
- `nvim-treesitter` está pineado al commit `0e21ee8` por compatibilidad con Neovim 0.12.5
- Los parsers `markdown`/`markdown_inline` están deshabilitados (bug de injecciones en Neovim 0.12.5). Usar `:TSUninstall markdown markdown_inline` si ya estaban instalados
- Para actualizar plugins: `:Lazy update` (treesitter no se actualizará por el pin)
- Para actualizar LSPs: `:MasonUpdate`
- Para actualizar parsers: `:TSUpdate`

---

## 🪪 Licencia

Uso personal. Siéntete libre de tomar lo que necesites.
