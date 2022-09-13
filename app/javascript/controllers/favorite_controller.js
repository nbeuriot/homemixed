import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorite"
export default class extends Controller {
  static targets = ["likeable"]
  static classes = ["favorited"]

  connect() {
    console.log("favorite");
  }

  createFavorite(event) {
    console.log("toggle");
    this.element.classList.remove("favorite");
    this.element.classList.add(this.favoritedClass);
    event.preventDefault()

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })
  }
}
