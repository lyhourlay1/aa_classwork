class Clock {
  constructor() {
    // 1. Create a Date object.
    let today = new Date();
    // 2. Store the hours, minutes, and seconds.
    this.hours = today.getHours();
    this.minutes = today.getMinutes();
    this.seconds= today.getSeconds();

    // 3. Call printTime.
    this.printTime();
    // 4. Schedule the tick at 1 second intervals.
    setInterval(() => {this._tick()}, 1000);
  }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    console.log(`${this.hours}:${this.minutes}:${this.seconds}`);

  }

  _tick() {
    // 1. Increment the time by one second.
    // 2. Call printTime.
    let today = new Date();
    // 2. Store the hours, minutes, and seconds.
    this.hours = today.getHours();
    this.minutes = today.getMinutes();
    this.seconds= today.getSeconds();
    
    this.printTime();
  }
}

const clock = new Clock();