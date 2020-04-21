import "bootstrap";
import "../stylesheets/application"  // <- Add this line

document.addEventListener("turbolinks:load", function() {
    $('[data-toggle="tooltip"]').tooltip()
    $('[data-toggle="popover"]').popover()
});