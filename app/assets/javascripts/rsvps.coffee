# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#rsvp_no_of_guests').on 'change', (e) ->
    number = e.target.value
    $(".rsvp__guests  .field").hide()
    $(".rsvp__guests  .field:lt(#{number})").show()