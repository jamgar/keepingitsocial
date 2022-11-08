import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="twitter"
export default class extends Controller {
  static targets = ["link"]

  connect() {
    const handle = this.element.dataset.handle
    this.linkTarget.innerHTML = `<a class="twitter-timeline"
        data-height="320"
        data-tweet-limit="3"
        href="https://twitter.com/${handle}"
       > 
      Tweets by @${handle}</a>`
  }
}
