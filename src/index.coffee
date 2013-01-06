$ = require "jquery"

$.fn.ouija = ->
    self = this
    @hide()
    @each (i, select) ->
      $select = $ select
      $select.after $list = $("<ul />").addClass "ouijaBoard"
      $list.addClass $select.prop "class"
      selected = 0
      active = false
      $("option", $select).each (index) ->
          $option = $ this
          
          if $option.is ":selected"
              selected = index

          $list.append $("<li />")
            .addClass("ouija-#{$option.prop "value"}")
              .text($option.text())
              .on click: -> 
                  $select.val $option.prop "value"
                  $select.trigger "change"
                  $li = $ this
                  active.removeClass? "on"
                  active = $li
                  bw = (parseInt $planchette.css("border-width")) * 2
                  $planchette.prop "class", "planchette"
                  $planchette.animate {
                      top: $li.position().top
                      left: $li.position().left
                      width: $li.outerWidth() - bw
                      height: $li.outerHeight() - bw
                  }, 150, -> 
                    $("li", $list).removeClass "on"
                    $planchette.addClass "ouija-on-#{$option.prop "value"}"
                    $li.addClass "on"
  
      $list.append $planchette = $("<div />")
          .addClass("planchette")
          .css(height: $list.height())        
  
      $planchette.on click: ->
          next = active.nextAll("li").first()
          if next.length
            $(next).click()
          else
            first = active.prevAll("li").last()
            if first.length
              $(first).click()
              
      $("li", $list).eq(selected).click()
      

module.exports = (selector) -> $(selector).ouija()

