var tour = new function() {
  var self = this;

  self.facebook_user_id;
  window.fbAsyncInit = function() {
    $('.name_box, .facebook').hide();
    // init the FB JS SDK
    FB.init({
      appId      : '245335962168737', // App ID from the App Dashboard
      status     : false, // check the login status upon init?
      cookie     : true, // set sessions cookies to allow your server to access the session?
      xfbml      : true  // parse XFBML tags on this page?
    });
   
    // Additional initialization code such as adding Event Listeners goes here
    FB.getLoginStatus(function(response){
      tour.facebook_user_id = FB.getUserID();
      FB.api('/me', function(response) {
        tour.fb_response = response;
        if (tour.fb_response != undefined) {
          $('.name').text(tour.fb_response.first_name);
          $('.name_box, .facebook').show();
        }
      });
    });
  };
  

  (function(d, debug){
     var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement('script'); js.id = id; js.async = true;
     js.src = "//connect.facebook.net/en_US/all" + (debug ? "/debug" : "") + ".js";
     ref.parentNode.insertBefore(js, ref);
   }(document, false));

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
      self.bt.restart(true);
    };
    self.onPlayerStateChange = function(evt) {
        switch(evt.data) {
          case YT.PlayerState.PLAYING:
            document.title = "▶ " + self.title;
            if (self.bt.getState("current_step") != "0")
              self.bt.hideStep( self.bt.getState("current_step") );
            self.hideChat();
            break;
          case YT.PlayerState.ENDED:
          case YT.PlayerState.PAUSED:
            document.title = self.title;
            self.bt.showStep( self.bt.getState("current_step") );
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

  self.showNextStep = function(objectHide, objectShow, current, next) {
    tour.bt.hideStep( current );
    $(objectHide).fadeOut(function() {
      $(objectShow).fadeIn(function() {
        tour.bt.goto(next);
      });
    });
  }

  self.init = function() {
    self.bt = new Tour();

    self.bt.addSteps([
      {
          orphan: true,
          backdrop: true,
          title: "Welcome to the Godchat Tour",
          content: "<p class='lead'>So your keen to check out Godchat? Well this tour is a great place to start.</p><p>Behind me there is a video playing called <a href='http://www.fallingplates.com'>#FallingPlates</a>. This can be anything, your articles, videos, websites etc.</p><div class='alert alert-info text-center'>We'll start by pausing the video.</div>",
          onNext: function(bt) {
            tour.player.pauseVideo();
          },
          onShown: function(bt) {
            tour.player.seekTo(0);
            tour.player.playVideo();
          },
      },
      {
          placement: "left",
          element: "#willyoufollow",
          title: "Chat Priming",
          container: "#chat",
          content: "<p class='lead'>We can encourage visitors to interact with content.</p><p>Here is a example of a simple question that you can ask your visitor to engage them with your content.</p><div class='alert alert-info text-center'>Go on, click <strong>I want to start</strong></div>",
          next: -1
      },
      {
          placement: "bottom",
          element: "#myfriends",
          title: "Invite a Friend",
          container: "#chat",
          content: "<p class='lead'>Isn't everything's more fun with friends?</p><p>Finding Christ is no exception to that rule. <span class='facebook'>Your signed into Facebook so we've grabbed your public data and made use of it here!</span></p><div class='alert alert-info text-center'>Click an answer</div>",
          onShow: function(bt) {

          }
      }
    ]);

    self.tag = document.createElement('script');
    self.title = document.title;
    self.tag.src = "https://www.youtube.com/iframe_api";
    self.firstScriptTag = document.getElementsByTagName('script')[0];
    self.firstScriptTag.parentNode.insertBefore(self.tag, self.firstScriptTag);
    self.done = false;
  };
};