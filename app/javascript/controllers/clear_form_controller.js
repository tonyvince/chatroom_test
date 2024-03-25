import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  clear() {
    this.element.reset()
  }

  submitOnEnter(event) {
    if (event.key === "Enter" && !event.shiftKey) { // Added !event.shiftKey to allow Shift+Enter for line breaks if needed
      event.preventDefault();
      this.element.requestSubmit();
    }
  }
}
