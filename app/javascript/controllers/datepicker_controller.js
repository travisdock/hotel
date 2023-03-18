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
      console.log(`Start date: ${this.startDate}`);
      event.target.classList.add("bg-blue-500");
      var startDateEl = document.getElementById("booking_start_date");
      startDateEl.setAttribute("value", this.startDate);
      this.clicks++
    } else {
      if (this.startDate === event.target.dataset.date || this.startDate > event.target.dataset.date) {
        this.clicks = 0
        this.endDate = null
      } else {
        this.endDate = event.target.dataset.date
        var startDateEl = document.getElementById("booking_end_date");
        startDateEl.setAttribute("value", this.endDate);
        this.clicks = 0
        document.getElementById("refresh").click();
      }
    }
  }
}
