Spine = require('spine')

class Snippet extends Spine.Model
  @configure 'Snippet', 'name', 'code', 'description'
  
  @extend Spine.Model.Local
  
module.exports = Snippet