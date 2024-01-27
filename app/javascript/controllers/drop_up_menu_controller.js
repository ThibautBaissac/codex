import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="drop-up-menu"
export default class extends Controller {
  static targets = ["dropUpMenu"];

  connect() {
    // Add a global click listener for hiding the hideMenu
    window.addEventListener('click', (event) => {
      if (!this.element.contains(event.target)) {
        this.hideMenu();
      }
    });
  }

  toggleMenu(event) {
    event.stopPropagation();
    this.dropUpMenuTarget.classList.toggle('hidden');
  }

  hideMenu() {
    if (!this.dropUpMenuTarget.classList.contains('hidden')) {
      this.dropUpMenuTarget.classList.add('hidden');
    }
  }

  disconnect() {
    // Clean up the global click listener when the controller is removed
    window.removeEventListener('click', this.hideMenu);
  }
}
