docReady = ->
  # In deployment you'd put all your templates in a single file
  Utils.loadTemplates(["post_detail", "post_list_item"], -> Backbone.History.start())

$ docReady