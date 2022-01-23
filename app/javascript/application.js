// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "./controllers"
import "@hotwired/turbo-rails"
import jquery from "jquery"

window.jQuery = jquery
window.$ = jquery

$(function(){
  console.log("hello World")
});