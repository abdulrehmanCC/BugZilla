import { Application } from "@hotwired/stimulus"

//= require jquery
//= require jquery_ujs
//= require bootstrap.min
const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
//= require jquery
//= require jquery_ujs
//= require bootstrap.min


//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap