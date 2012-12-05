// Generated by CoffeeScript 1.4.0
(function() {
  var SnippetEdit,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  SnippetEdit = (function(_super) {

    __extends(SnippetEdit, _super);

    SnippetEdit.prototype.id = '';

    SnippetEdit.prototype.tag = 'div';

    SnippetEdit.prototype.className = 'snippet-edit';

    SnippetEdit.prototype.view = 'snippet_edit.view';

    SnippetEdit.prototype.tpl = '#tpl-snippet-edit';

    function SnippetEdit(id) {
      SnippetEdit.__super__.constructor.apply(this, arguments);
      this.id = id;
      Snippet.fetch();
      this.el.append(this.render());
      this.refreshElements();
    }

    SnippetEdit.prototype.render = function() {
      this.tpl = this.loadView();
      this.snippet = Snippet.find(this.id);
      return this.dot(this.tpl, this.snippet);
    };

    SnippetEdit.prototype.dot = function(tpl, data) {
      var render;
      render = doT.template(tpl);
      return render(data);
    };

    SnippetEdit.prototype.afterDOM = function() {
      var editor, eleEditor;
      editor = ace.edit("ace-editor");
      editor.getSession().setMode("ace/mode/typescript");
      eleEditor = document.getElementById('ace-editor');
      eleEditor.style.height = editor.getSession().getDocument().getLength() * editor.renderer.lineHeight + editor.renderer.scrollBar.getWidth() + 'px';
      return $('#snippet-annotation').autosize();
    };

    SnippetEdit.prototype.loadView = function() {
      return this.xhr({
        url: "scripts/app/views/" + this.view,
        async: false
      });
    };

    return SnippetEdit;

  })(Spine.Controller);

  this.SnippetEdit = SnippetEdit;

}).call(this);
