module.exports = function(grunt) {
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-compass');
  grunt.loadNpmTasks('grunt-express-server');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-wiredep');
  grunt.initConfig({
    jshint:{
        files: ['js/*.js'],
        pkg: grunt.file.readJSON('package.json'),
        options: {
            curly: true,
            eqeqeq: true,
            eqnull: true,
            browser: true,
            globals: {
                jQuery: true
            },
        }
    },
    uglify: {
      my_target: {
        options: {
          mangle: false
        },
        files: {
          'public/static/js/script.js': ['js/script.js'],
          'public/static/js/controllers.js': ['js/controllers.js']
        } //files
      } //my_target
    }, //uglify
    copy: {
      files: {
            expand : true,
            dest   : 'public/static/js',
            cwd    : 'js',
            src    : [
              '**/*.js'
            ]
      }
    },
    wiredep: {
      task: {
        src: [
          'public/index.html',
          'sass/styles.scss'
        ],
        options: {
        }
      }
    },
    compass: {
      dev: {
        options: {
          config: 'compass_config.rb'
        } //options
      }, //dev
      foundation: {
        options: {
          config: 'compass_foundation_config.rb'
        } //options
      } //foundation

    }, //compass
    watch: {
      options: { livereload: true },
      scripts: {
        files: ['js/*.js'],
        //tasks: ['uglify','jshint','wiredep'],
        tasks: ['copy','jshint','wiredep']
      }, //script
      sass: {
        files: ['sass/*.scss','sass/*.sass'],
        tasks: ['compass:dev','compass:foundation']
        //tasks: ['compass:dev']
      }, //sass
      sass_foundation: {
        files: ['public/lib/foundation/scss/foundation.scss','public/lib/foundation/scss/foundation/*.scss','public/lib/foundation/scss/foundation/components/*.scss'],
        tasks: ['compass:foundation']
      }, //sass_foundation
      html: {
        files: ['public/*.html']
      }
    }, //watch
    express: {
      options: {
        // Override defaults here
      },
      dev: {
        options: {
          script: 'app.js'
        }
      }
    }
  }) //initConfig
  grunt.registerTask('default', ['express:dev', 'watch']);
} //exports
