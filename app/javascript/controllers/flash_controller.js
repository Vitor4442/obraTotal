import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // Esconde automaticamente após 5 segundos
    setTimeout(() => {
      this.close()
    }, 3000)
  }

  close() {
    this.element.classList.add("opacity-0", "translate-y-[-20px]")
    setTimeout(() => {
      this.element.remove()
    }, 500)
  }
}