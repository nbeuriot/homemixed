import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorite"
export default class extends Controller {
  static classes = [ "favorited" ]
  static targets = [ "likeable" ]

  connect() {
    console.log("favorite");
  }

  favorite() {
    console.log("toggle");
    this.element.classList.remove("favorite");
    this.element.classList.add(this.favoritedClass);

    fetch(this.likeableTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.likeableTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          this.itemsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
        }
        this.formTarget.outerHTML = data.form
      })
  }
}
