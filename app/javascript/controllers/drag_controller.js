import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"
import { patch } from "@rails/request.js"

export default class extends Controller {
  static values = {
    url: String,
    id: String
  }

  connect() {
    this.sortable = Sortable.create(this.element, {
      onEnd: this.end.bind(this),
      animation: 150,
      handle: ".handle",
    })
  }

  async end(event) {
    let id = event.item.dataset.id
    var data = new FormData()
    data.append("position", event.newIndex + 1)

    const response = await patch(this.urlValue.replace(":id", id), {
      body: data,
      responseKind: "turbo-stream"
    })

    if (response.ok) {
      console.log("Sorted")
    } else {
      console.error("Error")
    }
  }
}
