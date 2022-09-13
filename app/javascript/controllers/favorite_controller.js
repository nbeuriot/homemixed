// import { Controller } from "@hotwired/stimulus"
//import { ConcatenationScope } from "webpack";

// Connects to data-controller="favorite"
// export default class extends Controller {
//   static targets = ["likeable"]
//   static classes = ["favorited"]
//   static values = { cocktail: Number }

//   connect() {
//     console.log("favorite");
//   }

//   createFavorite(event) {
//     console.log("toggle");
//     console.log(this.cocktailValue);
//      this.element.classList.remove("favorite");
//      this.element.classList.add(this.favoritedClass);
//      event.preventDefault()

//      let data = { cocktail: this.cocktailValue }
//      fetch('http://127.0.0.1:3000/favorites', {
//        method: "POST",
//        credentials: 'same-origin',
//        headers: { "Accept": "text/plain" },
//        body: JSON.stringify(data)
//      })
//        .then(response => response.text())
//        .then((data) => {
//          console.log(data)
//        })
//    }
// }
