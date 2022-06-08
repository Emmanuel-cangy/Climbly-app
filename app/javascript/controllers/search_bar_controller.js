import { event } from "jquery"
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["content", "bar", "profile", "climbly"]

  // connect() {
  //   console.log(this.contentTarget)
  // }

  revealBar(event) {
    event.preventDefault()
    console.log(this.element)
    this.contentTarget.classList.toggle("d-none")
    this.barTarget.classList.toggle("d-none")
    this.profileTarget.classList.toggle("d-none")
    this.climblyTarget.classList.toggle("d-none")
  }
}
