module 'Collections'

Collections.BlogPostCollection = class extends Backbone.Collection
  url: -> Config.Options.getApiUrl 'posts'
  model: Models.BlogPostModel
  parse: (response, xhr) -> response.response.posts