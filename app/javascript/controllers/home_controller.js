import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="home"
export default class extends Controller {
  connect() {
    //console.log('Yes! Papa');
    const element = document.querySelector(".landing");
    let tempo = 500;
    for (let i = 1.0; i > 0.01; i = i - 0.01) {
      //console.log(i)
      setTimeout(() => {  element.style.opacity = i; }, tempo);
      tempo = tempo + 20
    }
    setTimeout(() => {  element.style.display = "none"; }, tempo);
  }
}
