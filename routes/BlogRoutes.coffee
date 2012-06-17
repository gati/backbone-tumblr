module 'Routes'

Routes.BlogRoutes =
  routes:
    "": "blogHome"
    "post/:id": "blogPost"

  initialize: ->

  blogHome: ->
    SPUtils.EventBus.trigger "blog:home"

  blogPost: (id) ->
    SPUtils.EventBus.trigger "blog:detail", id