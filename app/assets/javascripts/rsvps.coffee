# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#rsvp_no_of_guests').on 'change', (e) ->
    number = e.target.value
    $(".rsvp__guests .guest-fields").hide()
      .find('input').prop('disabled', true)
    $(".rsvp__guests .guest-fields:lt(#{number})").show()
      .find('input').removeAttr('disabled')
