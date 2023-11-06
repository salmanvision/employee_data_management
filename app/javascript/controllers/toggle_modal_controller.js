import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["modal"]

  connect() {
    alert('In toggle-modal')
  }
  hideModal() {
    debugger
    this.element.parentElement.parentElement.removeAttribute("src")
    this.modalTarget.remove()
  }

  closeWithKeyboard(e) {
    if (e.code == "Escape") {
      this.hideModal()
    }
  }

  closeBackground(e) {
    if (e && this.modalTarget.contains(e.target)) {
      return;
    }
    this.hideModal()
  }

  // toggle() {
  //   let modalContent = document.querySelector('.modal-content');
  //   modalContent.classList.toggle('hidden');

  //   let backgroundOverlay = document.getElementById('background-overlay');
  //   backgroundOverlay.classList.toggle('hidden');
  // }
}
