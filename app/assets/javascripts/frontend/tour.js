var tour = new function() {
  var self = this;

  self.facebook_user_id;
  window.fbAsyncInit = function() {
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
        if (tour.fb_response.error == undefined) {
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
            if (parseInt(self.bt.getState("current_step")) > 1)
              self.bt.hideStep( self.bt.getState("current_step") );
            self.hideChat();
            break;
          case YT.PlayerState.ENDED:
          case YT.PlayerState.PAUSED:
            document.title = self.title;
            if (parseInt(self.bt.getState("current_step")) > 1)
              self.bt.showStep( self.bt.getState("current_step") );
            self.showChat();
            break;
        }
    };
    self.showChat = function() {
      $('.box, #chat, .invite').addClass('paused');
      if (parseInt(self.bt.getState("current_step")) == 1)
        tour.bt.goto(2);
    };
    self.hideChat = function() {
      $('.box, #chat, .invite').removeClass('paused');
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
    $('.name_box, .facebook, .new-article, .old-article').hide();

    self.bt = new Tour({
      template: "<div class='popover tour'><div class='arrow'></div><h3 class='popover-title'></h3><div class='popover-content'></div><nav class='popover-navigation'><button class='btn btn-default btn-sm' data-role='prev'>« Prev</button><button class='btn btn-primary btn-sm pull-right' data-role='next'>Next »</button></nav></div>",
      debug: true,
    });

    self.bt.addSteps([
      {
        orphan: true,
        backdrop: true,
        content: "<p class='lead'><strong>So you're here to find out about Godchat?</strong> This is the place to start.</p><p>Behind me there is a video playing called <a href='http://www.fallingplates.com'>#FallingPlates</a>. This can be swapped for anything: articles, videos, websites etc.</p>",
        onNext: function(bt) {
          //tour.player.pauseVideo();
        },
        onShown: function(bt) {
          tour.player.seekTo(0);
          tour.player.playVideo();
        },
      },
      {
        orphan: true,
        title: "Invitation to Chat",
        content: "<p class='lead'>The first step is to inform visitors that chat is ready.</p><p>See our bot buddy down the bottom? We've used a persona to invite visitors to chat.</p><a href='#' onclick='tour.player.pauseVideo();'><div class='alert alert-info text-center'>Pause the video</div></a>",
        //next: -1,
        onNext: function(bt) {
          tour.player.pauseVideo();
        },
        onShow: function(bt) {
          tour.player.playVideo();
        }
      },
      {
        placement: "left",
        element: "#willyoufollow",
        title: "Chat Priming",
        container: "#chat",
        content: "<p class='lead'>We can encourage visitors to interact with content.</p><p>Here is an example of a simple question that you can ask your visitors to engage them with your content.</p><a href='#' onclick='$(\"#start-btn\").click()'><div class='alert alert-info text-center'>Click the \"I want to start\" button</div></a>",
        //next: -1,
        onNext: function(bt) {
          $("#start-btn").click();
        },
        onPrev: function(bt) {
          self.hideChat();
          tour.player.playVideo();
        }
      },
      {
        placement: "left",
        element: "#myfriends",
        title: "Invite a Friend",
        container: "#chat",
        content: "<p class='lead'>Isn't everything more fun with friends?</p><p>Finding Christ is no exception to that rule. <span class='facebook'>If your visitors are signed into Facebook, we can make use of that connection.</span></p><a href='#' onclick='$(\"#invite-btn\").click()'><div class='alert alert-info text-center'>Click an answer</div></a>",
        next: -1,
        onPrev: function(bt) {
          $('#myfriends').hide();
          $('#willyoufollow').fadeIn();
        }
      },
      {
        placement: "left",
        element: "#linkafriend",
        title: "Connect to a Christian Friend",
        container: "#chat",
        content: "<p class='lead'>The next step is to get your visitors connected with their friends.</p><p>They can share this link and wait for their friend to come online or reconnect at a time that suits then both.<a href='#'onclick='$(\"#findsomeone-btn \").click()'><div class='alert alert-info text-center'>Click the \"Find someone for me instead\" button</div></a>",
        //next: -1,
        onNext: function(bt) {
          $("#findsomeone-btn").click();
        },
        onShow: function(bt) {
          if ( $('#player').prop('src') != 'http://www.startingwithgod.com/') {
            //$('#player').prop('src', 'http://www.startingwithgod.com/');
            $('#webpage').show();
            $('#player').hide();
            $('#linkafriend .new-article').fadeIn();
            $('#linkafriend .old-article').hide();
          } else {
            $('#linkafriend .new-article').hide();
            $('#linkafriend .old-article').fadeIn();
          }
        },
        onPrev: function(bt) {
          $('#webpage').hide();
          $('#player').show();
          $('#linkafriend').hide();
          $('#myfriends').fadeIn();
        }
      },
      {
        placement: "left",
        element: "#opconnect",
        title: "Connect with a Godchat Operator",
        container: "#chat",
        prev: 3,
        content: "<p class='lead'>After a friend, a Godchat Operator is the next best option.</p><p>Godchat will go off and attempt to find someone who can connect and negotiate a connection between your visitors and available operators.<p>",
        onShow: function(bt) {
          if ( $('#player').prop('src') != 'http://www.startingwithgod.com/') {
            $('#player').prop('src', 'http://www.startingwithgod.com/');
            $('#opconnect .new-article').fadeIn();
            $('#opconnect .old-article').hide();
          } else {
            $('#opconnect .new-article').hide();
            $('#opconnect .old-article').fadeIn();
          }

        },
        onPrev: function(bt) {
          $('#opconnect').hide();
          $('#myfriends').fadeIn();
        },
        onNext: function(bt) {
          $('#chatbox').fadeIn();
        }
      },
      {
        placement: "left",
        element: "#chatbox",
        title: "Chat",
        container: "#chat",
        prev: 5,
        content: "<p class='lead'>This is chat in action.</p><p>Here is an example chat just getting started.<p>",

        onPrev: function(bt) {
          $('#chat').fadeOut();
        }
      },
      {
        orphan: true,
        backdrop: true,
        prev: 6,
        content: "<p class='lead'>That's all there is to it. Thanks for checking out Godchat. </p><p>Godchat is all about allowing crowd sourcing of missionaries. Because everyone is a missionary.<br><br><a class=\"btn-lg btn-success btn-block text-center\" href=\"/users/sign_up\">Sign up for free</a><p>",
        next: -1
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