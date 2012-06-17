module "Config"

# Make sure to set the apiKey with the one you obtained from Tumblr, and update contentContainer to whatever
# you're using.

Config.Options = class
  apiUrl: "http://api.tumblr.com/v2/blog/gatiblog.tumblr.com/"
  apiKey: "YOUR KEY HERE"
  getApiUrl: (endpoint) => @apiUrl + endpoint + "/text?jsonp=?" + @apiKey
  contentContainer: "#content" 