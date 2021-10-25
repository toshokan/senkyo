module.exports = {
  mode: 'jit',
  purge: [
    './app/views/**/*.html.erb'
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
  corePlugins: {
    preflight: true
  }
}
