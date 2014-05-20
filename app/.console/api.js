// Generated by CoffeeScript 1.7.1
var APIQuery, http;

http = require('http');

module.exports = APIQuery = (function() {
  function APIQuery(args, opts) {
    this.args = args;
    this.opts = opts;
  }

  APIQuery.prototype.execute = function() {
    var option, post, req, reqParams, value, _ref;
    post = {
      entity: this.args.shift(),
      action: this.args.shift()
    };
    if (post.entity === void 0 || post.action === void 0) {
      console.log("Usage: app/console api <entity> <action>");
      return 0;
    }
    _ref = this.opts;
    for (option in _ref) {
      value = _ref[option];
      post[option] = value;
    }
    post = JSON.stringify(post);
    reqParams = {
      host: config.host,
      port: config.port,
      path: '/',
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Content-Length': post.length
      }
    };
    req = http.request(reqParams, function(response) {
      return response.on('data', function(chunk) {
        return console.log('' + chunk);
      });
    });
    req.write(post);
    return req.end();
  };

  return APIQuery;

})();