// app/javascript/controllers/form_submit_by_tag_controller.js
import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  submitForm() {
    this.element.submit();
  }
}
