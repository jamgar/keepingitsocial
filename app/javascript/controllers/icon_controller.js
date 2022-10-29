import { Controller } from "@hotwired/stimulus"
const feather = require("feather-icons")

// Connects to data-controller="icon"
export default class extends Controller {
  static targets = ["icon"]
  static values = {
    name: String
  }

  connect() {
    this.iconTarget.innerHTML = feather.icons[this.nameValue].toSvg()
  }
}
