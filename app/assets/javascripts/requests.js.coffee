# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('div[data-link]').click ->
    document.location = $(this).attr('data-link')

  $('button[data-link]').click ->
    document.location = $(this).attr('data-link')

  $('.toggle-collapse').click(
    -> $(this).parent().parent().children('.description').toggleClass('shorten'))

