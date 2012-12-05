// Generated by CoffeeScript 1.4.0
(function() {
  var SnippetApp,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  SnippetApp = (function(_super) {

    __extends(SnippetApp, _super);

    function SnippetApp() {
      SnippetApp.__super__.constructor.apply(this, arguments);
      this.el = $('#snippet-app');
      this.routes({
        "/add": function() {
          return this.html(new SnippetCreate());
        },
        "/list": function() {
          var list;
          list = new SnippetList();
          this.html(list);
          return list.index();
        },
        "/edit/:id": function(para) {
          var edit;
          edit = new SnippetEdit(para.id);
          this.html(edit.el[0].innerHTML);
          return edit.afterDOM();
        }
      });
      Spine.Route.setup();
      this.log('SnippetApp_controller init');
    }

    SnippetApp.prototype.refreshList = function() {
      var options, snippetList, values;
      this.log('refreshList');
      options = {
        item: '<li><a class="name"></a></li>'
      };
      values = [
        {
          name: 'python'
        }, {
          name: 'ruby'
        }
      ];
      return snippetList = new List('snippet-list', options, values);
    };

    return SnippetApp;

  })(Spine.Controller);

  $(function() {
    return new SnippetApp();
  });

}).call(this);
