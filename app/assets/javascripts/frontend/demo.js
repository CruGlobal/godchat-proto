var demo = new function() {
  var self = this;
  self.tag = document.createElement('script');
  self.title = document.title;
  self.tag.src = "https://www.youtube.com/iframe_api";
  self.firstScriptTag = document.getElementsByTagName('script')[0];
  self.firstScriptTag.parentNode.insertBefore(self.tag, self.firstScriptTag);
  self.done = false;



  window.onYouTubeIframeAPIReady = function() {
      self.player = new YT.Player('player', {
        height: '390',
        width: '640',
        videoId: 'KGlx11BxF24',
        playerVars: {
          autoplay: 1,
          modestbranding: 1,
          rel: 0,
          showinfo: 0,
          iv_load_policy: 3
        },
        events: {
          'onReady': self.onPlayerReady,
          'onStateChange': self.onPlayerStateChange
        }
      });
    };
    self.onPlayerReady = function(evt) {
        evt.target.playVideo();
    };
    self.onPlayerStateChange = function(evt) {
        switch(evt.data) {
          case YT.PlayerState.PLAYING:
            document.title = "▶ " + self.title;
            self.hideChat();
            break;
          case YT.PlayerState.ENDED:
          case YT.PlayerState.PAUSED:
            document.title = self.title;
            self.showChat();
            break;
        }
    };
    self.showChat = function() {
      $('.box, #chat').addClass('paused');
    };
    self.hideChat = function() {
      $('.box, #chat').removeClass('paused');
    };

  self.init = function() {
    //Load player api asynchronously.

    self.tour = new Tour();

    self.tour.addSteps([
      {
          orphan: true,
          backdrop: true,
          title: "Title of my popover",
          content: "Content of my popover"
      },
      {
          element: "#my-other-element",
          title: "Title of my popover",
          content: "Content of my popover"
      }
    ]);

    self.tour.start();
  };
};