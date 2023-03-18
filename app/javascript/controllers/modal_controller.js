import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = [ "modal", "content" ]

  on(event) {
    event.preventDefault()
    this.modalTarget.classList.toggle("hidden")
  }

  off(event) {
    if (event.target != this.modalTarget) {
      return
    }
    this.modalTarget.classList.toggle("hidden")
  }
}
