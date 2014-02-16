# Exports a function which returns an object that overrides the default &
# *   plugin grunt configuration object.
# *
# * You can familiarize yourself with Lineman's defaults by checking out:
# *
# *   - https://github.com/linemanjs/lineman/blob/master/config/application.coffee
# *   - https://github.com/linemanjs/lineman/blob/master/config/plugins
# *
# * You can also ask Lineman's about config from the command line:
# *
# *   $ lineman config #=> to print the entire config
# *   $ lineman config concat.js #=> to see the JS config for the concat task.
# 
module.exports = (lineman) ->

  #Override application configuration here. Common examples follow in the comments.

  # grunt-angular-templates assumes your module is named "app", but
  # you can override it like so:
  #
  # ngtemplates: {
  #   options: {
  #     module: "myModuleName"
  #   }
  # }

  # API Proxying
  #
  # During development, you'll likely want to make XHR (AJAX) requests to an API on the same
  # port as your lineman development server. By enabling the API proxy and setting the port, all
  # requests for paths that don't match a static asset in ./generated will be forwarded to
  # whatever service might be running on the specified port.
  #
  server:
    web:
      port: 3001

    pushState: true
    apiProxy:
      enabled: true
      host: "localhost"
      port: 3000
      prefix: "api"

  # Sass
  #
  # Lineman supports Sass via grunt-contrib-sass, which requires you first
  # have Ruby installed as well as the `sass` gem. To enable it, comment out the
  # following line:
  enableSass: true

  # Asset Fingerprints
  #
  # Lineman can fingerprint your static assets by appending a hash to the filename
  # and logging a manifest of logical-to-hashed filenames in dist/assets.json
  # via grunt-asset-fingerprint
  enableAssetFingerprint: true

  assetFingerprint:
    dist:
      files: [
        expand: true
        cwd: "dist"
        src: [
          "<%= files.img.root %>/**/*",
          "<%= files.webfonts.root %>/**/*",
          "<%= files.js.minifiedWebRelativeLib %>",
          "<%= files.js.minifiedWebRelative %>",
          "<%= files.css.minifiedWebRelativeLib %>"
          "<%= files.css.minifiedWebRelative %>"
        ]
        dest: "dist"
      ]

  concat_sourcemap:
    vendor:
      src: [
        "<%= files.js.vendor %>"
      ]
      dest: "<%= files.js.concatenatedLib %>"

    js:
      src: [
        "<%= files.js.app %>"
        "<%= files.coffee.generated %>"
        "<%= files.template.generated %>"
      ]
      dest: "<%= files.js.concatenated %>"

    cssVendor:
      src: [
        "<%= files.less.generatedVendor %>"
        "<%= files.sass.generatedVendor %>"
        "<%= files.css.vendor %>"
      ]
      dest: "<%= files.css.concatenatedLib %>"

    css:
      src: [
        "<%= files.less.generatedApp %>"
        "<%= files.sass.generatedApp %>"
        "<%= files.css.app %>"
      ]
      dest: "<%= files.css.concatenated %>"

  uglify:
    js:
      files:
        "<%= files.js.minified %>": "<%= files.js.concatenated %>"
        "<%= files.js.minifiedLib %>": "<%= files.js.concatenatedLib %>"

  cssmin:
    compress:
      files:
        "<%= files.css.minified %>": "<%= files.css.concatenated %>"
        "<%= files.css.minifiedLib %>": "<%= files.css.concatenatedLib %>"

  clean:
    js:
      src: ["<%= files.js.concatenated %>", "<%= files.js.concatenatedLib %>"]

    css:
      src: ["<%= files.css.concatenated %>", "<%= files.css.concatenatedLib %>"]

  webfonts:
    files:
      "vendor/webfonts/": "<%= files.webfonts.vendor %>"
      "vendor/bower/bootstrap/dist/fonts/": "<%= files.webfonts.bootstrap %>"
