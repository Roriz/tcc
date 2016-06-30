angular.module('licagro').directive("audioPlay", ['$timeout',
  function($timeout) {
    return {
      restrict: 'A',
      scope: true,
      link: function($scope, elem, attrs) {
        var playing = false;
        var audio = document.createElement('audio');
        $timeout(function() {
          audio.src = elem.attr('data-url');
          elem.on('click', function() {
            var stopPlay = function() {
              playing = false;
              audio.pause();
              elem.html('').removeClass('galleryAudio-playing');
            };
            if (playing) {
              stopPlay();
            } else {
              var audioWaves = $('<div>').addClass('audioWaves')
                .append('<span></span>')
                .append('<span></span>')
                .append('<span></span>')
                .append('<span></span>')
                .append('<span></span>');
              elem.html(audioWaves).addClass('galleryAudio-playing');
              playing = true;
              audio.play();
              $(audio).on('ended', function() {
                stopPlay();
              });
            }
          });
        }, 0);
      }
    };
  }
])