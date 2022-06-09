import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["card", "cardShow"]


  displayShow() {
    this.cardShowTarget.classList.toggle("d-none")
  }

  close() {
    this.cardShowTarget.classList.toggle("d-none")
  }

  closebtn() {
    this.cardShowTarget.classList.remove("d-none")
  }
}
