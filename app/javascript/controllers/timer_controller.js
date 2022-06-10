import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["input"]

  connect() {
    console.log('hello');
    console.log(this.inputTarget)
  }

  start() {
    this.input = Date.now()
  }
}
