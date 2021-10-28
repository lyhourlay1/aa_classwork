function FollowToggle(el) {
  //not completely sure, checking data.userid functionality
  this.$el = $(el);
  this.userId = this.$el.data("userid");
  this.followState = this.$el.data("initial-follow-state");
  this.render();
  this.$el.on("click",this.handleClick.bind(this));
  //this.$el.on("click", this.render.bind(this))
}

FollowToggle.prototype.render = function() {
  if (this.followState === "followed") {
    this.$el.text("Unfollow!");
  } else {
    this.$el.text("Follow!");
  }
}

FollowToggle.prototype.handleClick = function(e) {
  // const setEventLister = () => {
  //   $()
  // }
  e.preventDefault();
  if (this.followState === "followed") {
    return $.ajax({
      method: 'DELETE',
      url: `/users/${this.userId}/follow`,
      dataType: 'json'

    })
  } else {
    console.log(this.$el)
    this.$el.data("initial-follow-state", "followed")
    return $.ajax({
      method: 'POST',
      url: `/users/${this.userId}/follow`,
      dataType: 'json'
    })
  }
  this.render();
}

module.exports = FollowToggle;
