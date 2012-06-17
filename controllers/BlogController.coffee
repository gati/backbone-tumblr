module 'Controllers'

BlogController = class
  blogHome: ->
    @blogPostCollection = new Collections.BlogPostCollection()
    postListView = new Views.PostListView(collection: blogPostCollection)
    @blogPostCollection.fetch()
  
  blogDetail: (id) ->
    if @blogPostCollection?
      blogPostModel = @blogPostCollection.get(id)
    else
      blogPostModel = new Models.BlogPostModel(id: id)
      blogPostModel.fetch()
    postDetailView = new Views.PostDetailView(model: blogPostModel)
  
  blogListReady: (params) ->
    postListItem = new Views.PostListItem(model: params.model)
    $(params.el).append(postListItem.render())


# Listen for events on a BlogController instance so @blogPostCollection persists. This way we avoid unnecessary requests to Tumblr
# for post detail views.

blogController = new BlogController()

Utils.EventBus.on "blog:home", blogController.blogHome
Utils.EventBus.on "blog:detail", blogController.blogDetail
Utils.EventBus.on "blog:listReady", blogController.blogListReady