import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form", "input", "list"]

  connect() {
    const listHtml = document.getElementById("homepage-list")
    console.log(listHtml)
  }


  update(event) {
    event.preventDefault()
    const listHtml = document.getElementById("homepage-list")
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    console.log(url)
    fetch(url, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        console.log(listHtml)
        listHtml.outerHTML = data
      })
  }
}
