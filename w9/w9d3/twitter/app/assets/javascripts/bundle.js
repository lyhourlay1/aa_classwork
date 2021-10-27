/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/***/ ((module) => {

function FollowToggle(el) {
  //not completely sure, checking data.userid functionality
  this.$el = $(el);
  this.userId = this.$el.data("userid");
  this.followState = this.$el.data("initial-follow-state");
  this.render();
  this.$el.on("click", this.handleClick.bind(this));
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
      url: `/users/${this.userid}/follow`
    })
  } else {
    return $.ajax({
      method: 'POST',
      url: `/users/${this.userid}/follow`
    })
  }
}

module.exports = FollowToggle;


/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
var __webpack_exports__ = {};
// This entry need to be wrapped in an IIFE because it need to be isolated against other modules in the chunk.
(() => {
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
const FollowToggle = __webpack_require__(/*! ./follow_toggle */ "./frontend/follow_toggle.js");


// jfollow.ready(new FollowToggle(jfollow));
$(() => {
  const $follow = $('.follow-toggle');
  $follow.each(function(index, el) {
    new FollowToggle(el);
  });
})
})();

/******/ })()
;
//# sourceMappingURL=bundle.js.map