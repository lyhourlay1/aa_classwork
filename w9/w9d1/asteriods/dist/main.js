/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Util = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst DEFAULTS = { COLOR: \"#5F9EA0\", RADIUS: 5}\n\nfunction Asteroid(object) {\n  object.color = DEFAULTS.COLOR;\n  object.radius = DEFAULTS.RADIUS;\n  object.pos ||= [30,30];\n  object.vel = Util.randomVec(norm(object.pos));\n\n\n  // this = instance of Asteroid\n  MovingObject.call(this, object) \n\n  function dist([x_1, y_1], [x_2, y_2]) {\n    return Math.sqrt((x_1 - x_2) ** 2 + (y_1 - y_2) ** 2)\n  }\n\n  function norm([x_1, y_1]) {\n    return dist([0, 0], [x_1, y_1])\n  }\n}\n\nUtil.inherits(Asteroid, MovingObject);\n\nmodule.exports = Asteroid;\n\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\")\n\nconst DEFAULTS = { DIM_X: 100, DIM_Y: 100, NUM_ASTEROIDS: 20}\n\nfunction Game(ctx, canvas) {\n  this.dim_x = DEFAULTS.DIM_X;\n  this.dim_y = DEFAULTS.DIM_Y;\n  this.num_asteroids = DEFAULTS.NUM_ASTEROIDS;\n  this.asteroidArr = [];\n  this.addAsteroids(ctx, canvas);\n}\n\nGame.prototype.addAsteroids = function(ctx, canvas) {\n  for (let i = 0; i < this.num_asteroids; i++) {\n    let position = this.randomPos()\n    let asteroid = new Asteroid({pos: position});\n    this.asteroidArr.push(asteroid);\n  }\n  this.draw(ctx, canvas)\n}\n\nGame.prototype.randomPos = function() {\n  let x = Math.floor(Math.random() * this.dim_x)\n  let y = Math.floor(Math.random() * this.dim_y)\n  return [x,y]\n}\n\nGame.prototype.draw = function(ctx, canvas) {\n  ctx.clearRect(0, 0, canvas.width, canvas.height);\n  for (let i = 0; i < this.asteroidArr.length; i++) {\n    this.asteroidArr[i].draw(ctx);\n  }\n}\n\nGame.prototype.moveObjects = function(ctx) {\n  ctx.clearRect(0, 0, canvas.width, canvas.height);\n  for (let i = 0; i < this.asteroidArr.length; i++) {\n    this.asteroidArr[i].move();\n  }\n}\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\nwindow.MovingObject = MovingObject;\nwindow.Asteroid = Asteroid;\nwindow.Game = Game;\n\nwindow.addEventListener('DOMContentLoaded', function() {\n    const canvas = document.getElementById(\"game-canvas\");\n    const ctx = canvas.getContext('2d');\n    // const a1 = new Asteroid({pos: [50,50]});\n    // console.log(a1);\n    // a1.draw(ctx);\n    new Game(ctx, canvas);\n})\n\nconsole.log(\"webpack is working!\")\nconsole.log(\"test is working!\")\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/***/ ((module) => {

eval("\nfunction MovingObject(object) {\n  this.pos = object[\"pos\"];\n  this.vel = object[\"vel\"];\n  this.radius = object[\"radius\"];\n  this.color = object[\"color\"];\n};\n\nMovingObject.prototype.draw = function(ctx){\n  ctx.fillStyle = this.color;\n  ctx.beginPath();\n\n  ctx.arc(\n    this.pos[0],\n    this.pos[1],\n    this.radius,\n    0,\n    2 * Math.PI,\n    false\n  );\n\n  ctx.fill();\n}\n\nMovingObject.prototype.move = function(){\n  this.pos =[this.pos[0]+ this.vel[0], this.pos[1]+ this.vel[1] ]\n  this.draw(document.getElementById(\"game-canvas\").getContext(\"2d\"))\n}\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/***/ ((module) => {

eval("const Util = {\n  inherits(childClass, parentClass) {\n    function Surrogate() {};\n    Surrogate.prototype = parentClass.prototype;\n\n    childClass.prototype = new Surrogate();\n    childClass.prototype.constructor = childClass;\n  },\n\n  randomVec(length) {\n    const deg = 2 * Math.PI * Math.random();\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n  },\n\n  // Scale the length of a vector by the given amount.\n  scale(vec, m) {\n    return [vec[0] * m, vec[1] * m];\n  }\n};\n\n\n\nmodule.exports = Util;\n\n\n//# sourceURL=webpack:///./src/utils.js?");

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
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;