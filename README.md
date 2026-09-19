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

Configuración moderna de Neovim completamente escrita en **Lua**, gestionada con [lazy.nvim](https://github.com/folke/lazy.nvim) como gestor de plugins.

### Estructura

```
nvim/
├── init.lua                          # Punto de entrada principal
├── lazy-lock.json                    # Versiones bloqueadas de plugins
└── lua/
    └── arrick/
        ├── lazy.lua                  # Configuración del gestor lazy.nvim
        ├── core/
        │   ├── init.lua
        │   └── options.lua           # Opciones globales y keymaps base
        └── plugins/
            ├── colorscheme.lua       # Temas de color
            ├── flutter.lua           # Soporte para Flutter
            ├── formatting.lua        # Formateo automático (conform.nvim)
            ├── latex.lua             # Soporte para LaTeX (vimtex)
            ├── nvim-cmp.lua          # Autocompletado
            ├── telescope.lua         # Búsqueda difusa + tmux manager
            ├── treesitter.lua        # Resaltado sintáctico
            ├── ui.lua                # Plugins de interfaz (lualine, nvim-tree, etc.)
            └── lsp/
                ├── mason.lua         # Gestor de LSP/linters/formatters
                └── lspconfig.lua     # Configuración de servidores LSP
```

### ⚙️ Configuración Principal

| Opción | Valor |
|--------|-------|
| `mapleader` | `<Space>` |
| Números de línea | Relativos |
| Tab size | 4 espacios |
| Clipboard | Sistema (`unnamedplus`) |
| Background | Dark |
| Splits | Derecha y abajo |
| Tema | Everforest (predeterminado) |

### 🎨 Temas de Color

| Plugin | Descripción |
|--------|-------------|
| `neanias/everforest-nvim` | Tema principal (fondo transparente, contraste alto) |
| `sainnhe/gruvbox-material` | Tema alternativo con soporte de itálicas |

### 🔌 Plugins de Neovim

#### 🔍 Búsqueda y Navegación

| Plugin | Descripción |
|--------|-------------|
| `nvim-telescope/telescope.nvim` | Buscador difuso de archivos, texto, buffers |
| `nvim-telescope/telescope-fzf-native.nvim` | Extensión FZF nativa para mayor velocidad |
| `andrew-george/telescope-themes` | Cambio de temas con preview en vivo |
| `nvim-tree/nvim-tree.lua` | Explorador de archivos tipo árbol |
| `nvim-tree/nvim-web-devicons` | Iconos para archivos |
| `nvim-lua/plenary.nvim` | Librería de utilidades Lua (dependencia) |

#### 📝 Autocompletado

| Plugin | Descripción |
|--------|-------------|
| `hrsh7th/nvim-cmp` | Motor de autocompletado |
| `hrsh7th/cmp-nvim-lsp` | Fuente de completado desde LSP |
| `hrsh7th/cmp-buffer` | Completado desde el buffer actual |
| `hrsh7th/cmp-path` | Completado de rutas del sistema |
| `L3MON4D3/LuaSnip` | Motor de snippets |
| `saadparwaiz1/cmp_luasnip` | Integración de LuaSnip con nvim-cmp |
| `rafamadriz/friendly-snippets` | Colección de snippets estilo VSCode |
| `onsails/lspkind.nvim` | Iconos tipo VSCode en el menú de completado |

#### 🩺 LSP (Language Server Protocol)

| Plugin | Descripción |
|--------|-------------|
| `neovim/nvim-lspconfig` | Configuración de servidores LSP |
| `williamboman/mason.nvim` | Gestor de instalación de LSPs/linters/formatters |
| `williamboman/mason-lspconfig.nvim` | Integración Mason ↔ lspconfig |
| `WhoIsSethDaniel/mason-tool-installer.nvim` | Instalación automática de herramientas |

**Servidores LSP instalados automáticamente:**

| Servidor | Lenguaje |
|----------|----------|
| `tsserver` / `ts_ls` | TypeScript / JavaScript |
| `html` | HTML |
| `cssls` | CSS |
| `tailwindcss` | Tailwind CSS |
| `svelte` | Svelte |
| `lua_ls` | Lua |
| `graphql` | GraphQL |
| `emmet_ls` | Emmet (HTML/CSS) |
| `prismals` | Prisma ORM |
| `pyright` | Python |
| `clangd` | C / C++ |
| `hls` | Haskell |
| `csharp_ls` | C# |

#### 🧹 Formateo (conform.nvim)

| Herramienta | Lenguajes |
|-------------|-----------|
| `prettier` | JS, TS, JSX, TSX, Svelte, CSS, HTML, JSON, YAML, Markdown, GraphQL |
| `stylua` | Lua |
| `isort` + `black` | Python |
| `clang-format` | C, C++ |
| `eslint_d` | JavaScript (linter) |
| `pylint` | Python (linter) |

#### 🖥️ Interfaz de Usuario

| Plugin | Descripción |
|--------|-------------|
| `nvim-lualine/lualine.nvim` | Barra de estado elegante (tema Everforest) |
| `lukas-reineke/indent-blankline.nvim` | Guías de indentación |
| `windwp/nvim-autopairs` | Cierre automático de paréntesis/corchetes |
| `catgoose/nvim-colorizer.lua` | Preview de colores hex en el editor |
| `stevearvis/dressing.nvim` | Mejoras a los inputs y selects de Neovim |

#### 🌳 Syntax Highlighting

| Plugin | Descripción |
|--------|-------------|
| `nvim-treesitter/nvim-treesitter` | Resaltado sintáctico basado en AST |

#### 🔗 Integración con Tmux

| Plugin | Descripción |
|--------|-------------|
| `christoomey/vim-tmux-navigator` | Navegación entre paneles Neovim/Tmux con `<C-h/j/k/l>` |
| `otavioschwanck/tmux-awesome-manager.nvim` | Gestión de comandos Tmux desde Neovim |

#### 📱 Desarrollo Flutter

| Plugin | Descripción |
|--------|-------------|
| `akinsho/flutter-tools.nvim` | Herramientas para desarrollo Flutter/Dart |
| `mfussenegger/nvim-jdtls` | Soporte para Java (Android/JVM) |

#### 📄 LaTeX

| Plugin | Descripción |
|--------|-------------|
| `lervag/vimtex` | Soporte completo para LaTeX |

### ⌨️ Keymaps Principales

| Atajo | Acción |
|-------|--------|
| `<leader>pr` | Buscar archivos (Telescope) |
| `<leader>pt` | Buscar texto (Live Grep) |
| `<leader>fb` | Listar buffers |
| `<leader>ths` | Cambiar tema de color |
| `<leader>ee` | Alternar explorador de archivos |
| `<leader>ef` | Buscar archivo en explorador |
| `<leader>ca` | Ver acciones de código (LSP) |
| `<leader>rn` | Renombrar símbolo (LSP) |
| `<leader>d` | Ver diagnóstico de línea |
| `<leader>D` | Ver diagnósticos del buffer |
| `<leader>mp` | Formatear archivo/selección |
| `<leader>cp` | Copiar todo el archivo al portapapeles |
| `gd` | Ir a definición |
| `gD` | Ir a declaración |
| `gR` | Ver referencias |
| `K` | Ver documentación hover |

---

## 📊 Sketchybar

Barra de estado personalizada para **macOS** usando [SketchyBar](https://github.com/FelixKratz/SketchyBar), integrada con [AeroSpace](https://github.com/nikitabobko/AeroSpace) como gestor de ventanas.

### Estructura

```
sketchybar/
├── sketchybarrc          # Configuración principal de la barra
├── colors.sh             # Paleta de colores (estilo Everforest)
├── icons.sh              # Definición de iconos
├── icon_map.sh           # Mapa extenso de iconos por aplicación
├── items/                # Definición de cada item de la barra
│   ├── apple.sh          # Menú Apple (izquierda)
│   ├── aerospace_spaces.sh # Espacios de trabajo AeroSpace
│   ├── front_app.sh      # Aplicación en primer plano
│   ├── clock.sh          # Reloj
│   ├── calendar.sh       # Fecha
│   ├── battery.sh        # Batería
│   ├── cpu.sh            # Uso de CPU
│   ├── ram.sh            # Uso de RAM
│   ├── wifi.sh           # Estado de Wi-Fi
│   ├── volume.sh         # Control de volumen
│   ├── github.sh         # Notificaciones de GitHub
│   ├── spotify.sh        # Reproducción de Spotify
│   ├── brew.sh           # Actualizaciones de Homebrew
│   └── spaces.sh         # Espacios de misión
└── plugins/              # Scripts que actualizan los items
    ├── aerospace.sh
    ├── battery.sh
    ├── calendar.sh
    ├── clock.sh
    ├── cpu.sh
    ├── front_app.sh
    ├── ram.sh
    ├── space.sh
    ├── volume.sh
    ├── volume_click.sh
    └── wifi.sh
```

### 🎨 Paleta de Colores

Los colores siguen el esquema **Everforest** (tonos verdes/café cálidos):

| Variable | Hex | Uso |
|----------|-----|-----|
| `BLACK` | `#2d353b` | Fondo de popups |
| `WHITE` | `#d3c6aa` | Texto e iconos |
| `GREEN` | `#a7c080` | Borde del grupo Status |
| `BLUE` | `#7fbbb3` | Borde del grupo SysInfo |
| `RED` | `#e67e80` | Alertas |
| `YELLOW` | `#dbbc7f` | Avisos |
| `ORANGE` | `#e69875` | Advertencias |
| `SPOTIFY_GREEN` | `#1db954` | Integración Spotify |
| `BAR_COLOR` | Transparente | Fondo de la barra |

### 📦 Grupos de la Barra

```
[  Spaces]  [Front App]              [wifi  cpu  ram]  [clock  cal  battery]
 Izquierda                            SysInfo (azul)    Status (verde)
```

### 🖥️ Items de la Barra

| Item | Descripción |
|------|-------------|
| Apple | Menú de Apple con logo |
| Spaces (AeroSpace) | Espacios de trabajo con integración AeroSpace |
| Front App | Nombre de la app activa en primer plano |
| Battery | Nivel de batería con ícono dinámico |
| Calendar | Fecha actual |
| Clock | Hora en tiempo real |
| CPU | Porcentaje de uso de CPU |
| RAM | Uso de memoria RAM |
| Wi-Fi | Estado de conexión inalámbrica |

### 🔤 Fuente Requerida

`Hack Nerd Font` — Necesaria para renderizar los iconos correctamente.

---

## 📱 Flutter

El directorio `flutter/` contiene el estado de las herramientas de Flutter SDK, usado internamente para rastrear versiones activas del SDK.

---

## 🔧 Dependencias del Sistema

### Neovim

| Dependencia | Versión | Instalación |
|-------------|---------|-------------|
| Neovim | ≥ 0.10 | `brew install neovim` |
| Git | Cualquiera | Preinstalado en macOS |
| `make` | Cualquiera | Xcode Command Line Tools |
| `ripgrep` | Cualquiera | `brew install ripgrep` |
| `fd` | Cualquiera | `brew install fd` |
| Node.js + npm | LTS | `brew install node` |
| Python 3 | ≥ 3.8 | `brew install python` |
| Clang/LLVM | Cualquiera | Xcode CLT o `brew install llvm` |
| Tmux (opcional) | Cualquiera | `brew install tmux` |

### Sketchybar

| Dependencia | Descripción | Instalación |
|-------------|-------------|-------------|
| SketchyBar | Barra de estado | `brew install sketchybar` |
| AeroSpace | Gestor de ventanas | `brew install --cask aerospace` |
| Hack Nerd Font | Fuente con iconos | `brew install --cask font-hack-nerd-font` |
| jq (opcional) | Procesamiento JSON | `brew install jq` |

---

## 🚀 Instalación

### 1. Clonar el repositorio

```bash
git clone https://github.com/<tu-usuario>/Dotfiles.git ~/Workspace/Dotfiles
```

### 2. Enlazar Neovim

```bash
ln -sf ~/Workspace/Dotfiles/nvim ~/.config/nvim
```

### 3. Enlazar Sketchybar

```bash
ln -sf ~/Workspace/Dotfiles/sketchybar ~/.config/sketchybar
```

### 4. Instalar dependencias del sistema

```bash
# Homebrew (si no lo tienes)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Neovim y herramientas
brew install neovim ripgrep fd node python tmux

# Sketchybar y AeroSpace
brew install sketchybar
brew install --cask aerospace

# Fuente Nerd Font
brew install --cask font-hack-nerd-font
```

### 5. Abrir Neovim

Al abrir Neovim por primera vez, `lazy.nvim` se instalará automáticamente y descargará todos los plugins. Los servidores LSP y herramientas de formateo se instalarán mediante Mason.

```bash
nvim
```

### 6. Iniciar SketchyBar

```bash
brew services start sketchybar
# o para recargar la configuración:
sketchybar --reload
```

---

## 📝 Notas

- El template de C++ (`template.cpp`) se busca en `~/Workspace/Competitiva/Template/template.cpp`. Ajustar la ruta en `options.lua` si es necesario.
- La integración con Tmux renombrará automáticamente las ventanas con el nombre del archivo activo en Neovim.
- Los plugins se gestionan con `lazy.nvim` con actualizaciones automáticas deshabilitadas (`checker.enabled = false`). Para actualizar, usar `:Lazy update` dentro de Neovim.

---

## 🪪 Licencia

Uso personal. Siéntete libre de tomar lo que necesites.
