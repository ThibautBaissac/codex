import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  connect() {
    console.log("modal controller initialized")
    this.element.classList.remove('hidden');
  }

  disconnect() {
    this.element.classList.add('hidden');
  }

  close() {
    this.element.classList.add('hidden');
  }
}
