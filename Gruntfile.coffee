module.exports = (grunt) ->
  grunt.initConfig
    stylus:
      light:
        files:
          "build/solarized-light.css": "src/solarized-css/solarized-light.styl"
      dark:
        files:
          "build/solarized-dark.css": "src/solarized-css/solarized-dark.styl"
    coffee:
      main:
        # options:
          # sourceMap: true
          # sourceMapDir: ""
        files:
          "build/org-info-extensions.js": [
            'src/script/*.coffee'
            ]
    coffeelint:
      all: [
        'src/script/*.coffee'
        ]
    # uglify:

    concurrent:
      compile: ['stylus:dark', 'stylus:light', 'coffee:main']
      lint: ['coffeelint:all']

    watch:
      stylus:
        files: [
          "src/solarized-css/**/*.styl"
          "!src/solarized-css/_fly*"
          ]
        tasks: "stylus"
        options:
          spawn: false
          livereload: true
      coffee:
        files: [
          'src/script/*.coffee'
          '!src/script/_fly*'
          ]
        tasks: "coffee"
        options:
          spawn: false
          livereload: true

  grunt.loadNpmTasks "grunt-contrib-watch" # register contrib tasks
  grunt.loadNpmTasks "grunt-contrib-stylus"
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-concurrent'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.registerTask "default", [
    'concurrent:compile'
    # 'concurrent:minify'
    # 'concurrent:lint'
  ]
