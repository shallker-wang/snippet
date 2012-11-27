class Snippet extends Spine.Model
  @configure 'Snippet', 'name', 'code', 'description', 'timestamp'
  
  @extend Spine.Model.Local

this.Snippet = Snippet