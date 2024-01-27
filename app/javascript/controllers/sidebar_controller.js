import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sidebar"
export default class extends Controller {
  static targets = ["sidebar", "hamburgerIcon", "crossIcon", "main"];

  toggleSidebar() {
    if (this.sidebarTarget.classList.contains('-translate-x-full')) {
      this.sidebarTarget.classList.remove('-translate-x-full');
      this.hamburgerIconTarget.classList.add('hidden');
      this.crossIconTarget.classList.remove('hidden');
      this.mainTarget.classList.add('overlay');
    } else {
      this.sidebarTarget.classList.add('-translate-x-full');
      this.hamburgerIconTarget.classList.remove('hidden');
      this.crossIconTarget.classList.add('hidden');
      this.mainTarget.classList.remove('overlay');
    }
  }

  closeSidebar() {
    this.sidebarTarget.classList.add('-translate-x-full');
    this.hamburgerIconTarget.classList.remove('hidden');
    this.crossIconTarget.classList.add('hidden');
    this.mainTarget.classList.remove('overlay');
  }
}
