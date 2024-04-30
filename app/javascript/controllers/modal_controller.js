import { Controller } from "@hotwired/stimulus"
import { Modal } from "bootstrap"


// Connects to data-controller="modal"
export default class extends Controller {
  connect() {
    this.modal = new Modal(this.element)
    this.modal.show()
  }

  close(event) {
    if (event.detail.success) {
      // モーダルを閉じる
      this.modal.hide()
    }
  }

}


  

