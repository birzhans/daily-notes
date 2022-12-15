import { Controller } from "@hotwired/stimulus"
import { Calendar } from "@fullcalendar/core"
import dayGridPlugin from "@fullcalendar/daygrid"

// Connects to data-controller="calendar"
export default class extends Controller {
  static targets = [ "calendar" ]

  connect() {
    this.calendar = new Calendar(this.calendarTarget, {
      plugins: [ dayGridPlugin ],
      initialView: "dayGridMonth",
      eventSources: [
        {
          url: "/notes.json"
        }
      ],
      eventContent: function(info) {
        return {
          html: `<div class="fc-day-content">
                    ${info.event.extendedProps.body}
                  </div>
                `
        }
      },
      eventColor: "white",
      eventTextColor: "black",
    })
    this.calendar.render()
  }
}
