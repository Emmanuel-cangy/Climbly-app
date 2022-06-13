import { Controller } from "stimulus"
let [milliseconds,second,minute,] = [0,0,0];
let int = null;


export default class extends Controller {
  static targets = ["input", "mainminute", "mainsecond", "milliseconds"]

  start() {
    this.inputTarget.value = Date.now()
    setInterval(() => {
      milliseconds+=10;
      if(milliseconds == 1000) {
        milliseconds = 0;
        second++;
        if(second == 60){
          second = 0;
          minute++;
          if(minute == 60){
            minute = 0;
          }
        }
      }
      let m = minute < 10 ? "0" + minute : minute;
      let s = second < 10 ? "0" + second : second;
      let ms = milliseconds < 10 ? "00" + milliseconds : milliseconds < 100 ? "0" + milliseconds : milliseconds;
      this.mainminuteTarget.innerHTML = ` ${m} : `;
      this.mainsecondTarget.innerHTML = `${s} : `;
      this.millisecondsTarget.innerHTML = `${ms}`;
    }, 9);
  }

}
