// require([
    // 'js/jquery-1.8.3.min',
    // 'js/jquery.autosize'
    // 'js/ace.min',
    // 'js/doT',
    // 'js/list/list.min',
    // 'js/list/plugin/list.fuzzySearch.min'
// ], function(jq, jqAutosize, ace, dot, list, listFuzzySearch) {
    // console.log(jq)
    // window.doT = dot;
// })

// require([
//     'js/jquery-1.8.3.min', 
//     'js/jquery.autosize',
//     'js/ace.min',
//     'js/doT',
//     'js/list/list.min',
//     'js/list/plugin/list.fuzzySearch.min'
// ], function(jq, jqAutosize, ace, dot, list, listFuzzySearch) {
//     window.doT = dot;
// })


requirejs.config({
    "shim": {
        // "spine/spine": {exports: "Spine"},
        "spine/local": ['spine/spine'],
        "spine/route": ['spine/spine']
    }
});

require([
    'spine/spine',
    'spine/local',
    'spine/route'
])

requirejs.config({
    "shim": {
        // "spine/spine": {exports: "Spine"},
        "app/models/snippet": ['spine/spine']
    }
});

require([
    'app/models/snippet',
    'app/controllers/snippets',
    'app/controllers/snippet_create',
    'app/controllers/snippet_list',
    'app/controllers/snippetapp'
])