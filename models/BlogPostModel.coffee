module 'Models'

Models.BlogPostModel = class extends Backbone.Model
  url: -> 
    baseUrl = Config.Options.getApiUrl 'posts'
    baseUrl + "&id=#{@id}"
  parse: (response, xhr) ->
    # Only need to dig into nested properties when dealing with JSON returned from Tumblr
    _.first(response.response.posts) if @id? else response