import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = [ "date" ]

  initialize() {
    this.clicks = 0
    this.startDate = null
    this.endDate = null
  }

  selectDate(event) {
    if (this.clicks === 0) {
      this.startDate = event.target.dataset.date;
      event.target.classList.add("bg-blue-500");
      var startDateEl = document.getElementById("reservation_check_in");
      startDateEl.setAttribute("value", this.startDate);
      this.clicks++
    } else {
      if (this.startDate === event.target.dataset.date || this.startDate > event.target.dataset.date) {
        event.target.classList.add("bg-red-500");
        setTimeout(() => { event.target.classList.remove("bg-red-500"); }, 1000);
        this.endDate = null
      } else {
        this.endDate = event.target.dataset.date
        var startDateEl = document.getElementById("reservation_check_out");
        startDateEl.setAttribute("value", this.endDate);
        this.clicks = 0
        var form = document.getElementById("new_reservation")
        form.action = "/reservations/refresh"
        form.requestSubmit()
      }
    }
  }
}

