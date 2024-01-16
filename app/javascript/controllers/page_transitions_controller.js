import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="page-transitions"
export default class extends Controller {
  connect() {
    document.addEventListener('turbo:load', this.fadeIn);
    document.addEventListener('turbo:before-visit', this.fadeOut);
  }

  disconnect() {
    document.removeEventListener('turbo:load', this.fadeIn);
    document.removeEventListener('turbo:before-visit', this.fadeOut);
  }

  fadeIn = () => {
    this.element.classList.remove('fade-out');
    this.element.classList.add('fade-in');
  }

  fadeOut = () => {
    this.element.classList.remove('fade-in');
    this.element.classList.add('fade-out');
  }
}
