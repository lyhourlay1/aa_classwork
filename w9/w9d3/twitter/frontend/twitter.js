const FollowToggle = require("./follow_toggle");


// jfollow.ready(new FollowToggle(jfollow));
$(() => {
  const $follow = $('.follow-toggle');
  $follow.each(function(index, el) {
    new FollowToggle(el);
  });
})