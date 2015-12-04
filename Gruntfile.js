module.exports = function (grunt) {
  grunt.initConfig({
    watch:{
      files: ['*.elm'],
      tasks: ['elm']
    },
    elm: {
      compile: {
        files: {
          'bingo.js': '*.elm'
        }
      }
    }
  });
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-elm');
}


