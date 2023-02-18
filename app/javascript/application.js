// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

import Prism from 'prismjs'

document.addEventListener("turbo:load", function() {
     Prism.highlightAll();
});

// let popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))  
// let popoverList = popoverTriggerList.map(function (popoverTriggerEl) {  
//   return new bootstrap.Popover(popoverTriggerEl)  
// })  
