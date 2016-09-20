module.exports = {
  config: {

    // hyperclean makes the window borderless and we want to hide tabs
    hyperclean: {
        hideTabs: true
    },

    // default font size in pixels for all tabs
    fontSize: 10,

    // font family with optional fallbacks
    fontFamily: 'Input Mono, Courier New',

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: 'rgba(127,127,127,0.60)',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'BLOCK',

    // color of the text
    foregroundColor: '#d5c4a1',

    // terminal background color
    backgroundColor: '#1b1b1b',

    // border color (window, tabs)
    borderColor: 'rgba(0,0,0,0)',

    // custom css to embed in the main window
    css: ' ',

    // custom css to embed in the terminal window
    termCSS: `
      x-screen {
        -webkit-font-smoothing: subpixel-antialiased !important;
      }
    `,

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '15px 15px',

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      black: '#1b1b1b',
      red: '#d75f5f',
      green: '#b8bb26',
      yellow: '#cd950c',
      blue: '#458588',
      magenta: '#cc80a6',
      cyan: '#00ffff',
      white: '#d5c4a1',
      lightBlack: '#505050',
      lightRed: '#cc241d',
      lightGreen: '#7aab7d',
      lightYellow: '#cd950c',
      lightBlue: '#83a598',
      lightMagenta: '#cc80a6',
      lightCyan: '#00ffff',
      lightWhite: '#504945',
    },

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    shell: ''

    // for advanced config flags please refer to https://hyperterm.org/#cfg
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
               "hyperclean",
           ],

  // in development, you can create a directory under
  // `~/.hyperterm_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: []
};

