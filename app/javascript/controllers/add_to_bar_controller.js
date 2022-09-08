import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-to-bar"
export default class extends Controller {
  static values = {
    id: Number
  }

  connect() {
    console.log("hello")
  }

  create() {
    console.log(this.idValue)
    fetch(`/add_ingredient/${this.idValue}`)
      .then(response => response.json())
      .then((data) => {
        console.log(data.response)
        if (data.response) {
          this.element.classList.add("selected-ingredient")
        }
      })
  }
}
