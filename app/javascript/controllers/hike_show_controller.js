import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["card", "cardShow"]

  displayShow() {
    console.log(this.cardTarget)
    this.cardShowTarget.classList.toggle("d-none")
  }
}
