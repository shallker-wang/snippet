Spine = require('spine')

class Snippet extends Spine.Model
  @configure 'Snippet', 'name', 'code', 'description', 'annotation', 'timestamp'
  
  @extend Spine.Model.Local
  
  @filter: (query) ->
    return @all() unless query
    query = query.toLowerCase()
    @select (item) ->
      item.name?.toLowerCase().indexOf(query) isnt -1 or
        item.email?.toLowerCase().indexOf(query) isnt -1
        
module.exports = Snippet