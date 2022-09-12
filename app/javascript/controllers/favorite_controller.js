import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorite"
export default class extends Controller {
  static targets = ["likeable"]
  static classes = ["favorited"]

  connect() {
    console.log("favorite");
  }

  favorite() {
    console.log("toggle");
    this.element.classList.remove("favorite");
    this.element.classList.add(this.favoritedClass);

    //fetch(this.likeableTarget, {
    //  method: "POST",
    //  headers: { "Accept": "application/json" },
    //  body: JSON.stringify(this.likeableTarget)
    //})
  }
}
