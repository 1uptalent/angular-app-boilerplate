# Exports a function which returns an object that overrides the default &
# *   plugin file patterns (used widely through the app configuration)
# *
# * To see the default definitions for Lineman's file paths and globs, see:
# *
# *   - https://github.com/linemanjs/lineman/blob/master/config/files.coffee
# 
module.exports = (lineman) ->

  #Override file patterns here
  js:
    vendor: [
      "vendor/bower/angular/angular.js"
      "vendor/bower/angular-resource/angular-resource.js"
      "vendor/bower/angular-route/angular-route.js"
      "vendor/bower/jquery/dist/jquery.js"
      "vendor/bower/bootstrap/dist/js/bootstrap.js"
      "vendor/js/**/*.js"
    ]
    app: [
      "app/js/app.js"
      "app/js/**/*.js"
    ]

    concatenatedLib: "generated/js/lib.js"
    minifiedLib: "dist/js/lib.js"
    minifiedWebRelativeLib: "js/lib.js"

  css:
    vendor: ["vendor/css/**/*.css", "vendor/bower/bootstrap/dist/css/bootstrap.css"]
    app: "app/css/**/*.css"
    concatenated: "generated/css/app.css"
    concatenatedLib: "generated/css/lib.css"
    minified: "dist/css/app.css"
    minifiedLib: "dist/css/lib.css"
    minifiedWebRelative: "css/app.css"
    minifiedWebRelativeLib: "css/lib.css"

  webfonts:
    bootstrap: "vendor/bower/bootstrap/dist/fonts/**/*.*"
    root: "fonts"
