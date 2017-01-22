module.exports = {
  config: {
    // hyperclean makes the window borderless and we want to hide tabs
    // hyperclean: {
        // hideTabs: true
    // },

    // default font size in pixels for all tabs
    fontSize: 9,

    // font family with optional fallbacks
    fontFamily: '"Input Mono", Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: 'rgba(192,177,139,0.60)',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'BLOCK',

    // color of the text
    foregroundColor: '#c0b18b',

    // terminal background color
    backgroundColor: '#1b1b1b',

    // border color (window, tabs)
    borderColor: 'rgba(0,0,0,0)',

    // custom css to embed in the main window
    css: '',

    // custom css to embed in the terminal window
    termCSS: `
      x-screen {
        -webkit-font-smoothing: subpixel-antialiased !important;
      }
    `,

    // set to `true` if you're using a Linux set up
    // that doesn't shows native menus
    // default: `false` on Linux, `true` on Windows (ignored on macOS)
    showHamburgerMenu: '',

    // set to `false` if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` on windows and Linux (ignored on macOS)
    showWindowControls: '',

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '15px 15px',

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    /*
    */
    colors: {
      black: '#1b1b1b',
      red: '#d75f5f',
      green: '#b8bb26',
      yellow: '#af865a',
      blue: '#535c5c',
      magenta: '#775759',
      cyan: '#6d715e',
      white: '#c0b18b',
      lightBlack: '#4a3637',
      lightRed: '#d75f5f',
      lightGreen: '#7b8748',
      lightYellow: '#af865a',
      lightBlue: '#535c5c',
      lightMagenta: '#775759',
      lightCyan: '#6d715e',
      lightWhite: '#c0b18b',
    },
    /*
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
     */

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    shell: '/bin/zsh',

    // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
    // by default ['--login'] will be used
    shellArgs: ['--login'],

    // for environment variables
    env: {},

    // set to false for no bell
    bell: 'SOUND',

    // if true, selected text will automatically be copied to the clipboard
    copyOnSelect: false

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // for advanced config flags please refer to https://hyper.is/#cfg
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    "hyperminimal",
    /*"hyper-simple-vibrancy",*/
  ],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: []
};
