Spine   = require('spine')
Snippet = require('models/snippet')
Manager = require('spine/lib/manager')
$       = Spine.$

class Snippets extends Spine.Controller
  elements:  # 定义对象内元素
    '.snippet-name': 'snippetName'
    '.snippet-code textarea': 'snippetCode'
    '.snippet-description': 'snippetDescription'
  
  events:  # 定义对象内事件
    'click #action-add-snippet': 'add'
    'click #action-reset-snippet': 'reset'
  
  constructor: ->  # 构造函数
    super

  add: ->
    @log 'add'

  reset: ->
    @snippetCode.val('')
    @log 'reset'

    
module.exports = Snippets