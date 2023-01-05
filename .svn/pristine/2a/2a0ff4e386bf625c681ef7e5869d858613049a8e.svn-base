var jstreeExtend = {};
/** * jstree 제어 * elem : jstree dom 객체 */
jstreeExtend.jstree = function(elem) { // jstree 객체
    $tree = elem; // jstree 생성
    //$tree.jstree({
        // core 제어
    //    'core' : {
    //    'data' : data,
    //    "check_callback" : true
        // plugins 'dnd'와 같이 사용 이동하고싶을때
   //     },
   //     "plugins" : [ "dnd", "types" ],
   //     "types" : {
   //         "valid_children" : [ "default" ],
   //         "default" : {
   //             "max_depth" : 2
            // 하위 depth 제한
   //         }
   //    }
   // });
    // 트리 구조 로딩 완료 시
    $tree.bind("loaded.jstree", function(e) {
         // ...
    }.bind(this));
    // 트리 구조 새로고침 시
    $tree.bind("refresh.jstree", function(e, d) {
        // ...
    }.bind(this));
    /** * 해당 ID 값의 데이터를 리턴 * id : node.id * */
    this.findCoreData = function(id) {
        var coreData = $tree.jstree(true).settings.core.data;
        for (var i = 0; i < coreData.length; i++) {
            var data = coreData[i];
            if (data.id == id) {
                return data;
            }
        }
        return null;
    };
    /** * root node get * */
    this.getRootNode = function() {
        return $tree.jstree(true).get_node('#');
    };
    /** * 노드의 원시 데이터 set * data : arry * */
    this.setCoreData = function(data) {
        $tree.jstree(true).settings.core.data = data;
    };
    /** * 노드의 원시 데이터 get * */
    this.getCoreData = function() {
        return $tree.jstree(true).settings.core.data;
    };
    /** * 현재 트리구조 + 원본 데이터를 Merge 하여 데이터를 리턴 * */
    this.getData = function() {
        var newData = [];
        var jdata = $tree.jstree(true).get_json("#", {
            flat : true
        });
        for (var i = 0; i < jdata.length; i++) {
            var current = jdata[i];
            var id = current.id;
            var data = this.findCoreData(id);
            if (data) {
                // current.text = $("<div>"+current.text+"</div>").text();
                newData.push($.extend(data, current));
            }
        }
        return newData;
    };
    /** * 새로고침 * */
    this.refresh = function() {
        $tree.jstree(true).refresh();
    }
    /** * 데이터 추가 * d : obj * */
    this.addData = function(d) {
        var data = this.getData();
        data.splice(data.length, 0, d);
        this.setCoreData(data);
        this.refresh(data);
    }
    /** * 노드 이름 수정 폼 * id * */
    this.edit = function(id) {
        $tree.jstree(true).edit(id);
    };
    /** * 노드 가져오기 * id * */
    this.getNode = function(id) {
        return $tree.jstree(true).get_node(id);
    };
    /** * 자식노드 가져오기 * id * */
    this.childrenNode = function(id) {
        var ids = this.getNode(id).children;
        if (!ids)
            return [];
        var children = [];
        for (var i = 0; i < ids.length; i++) {
            children.push(this.getNode(ids[i]));
        }
        return children;
    };
    /** * 부모노드 가져오기 * id * */
    this.parentNode = function(id) {
        return this.getNode(this.getNode(id).parent);
    };
    /** * 전체열기 * */
    this.openAll = function() {
        $tree.jstree("open_all");
    };
    /** * 전체 닫기 * */
    this.closeAll = function() {
        $tree.jstree("close_all");
    };
    /** * 특정 노드 열기 * id * */
    this.openNode = function(id) {
        $tree.jstree("open_node", id)
    };
    /** * 특정 노드 닫기 * id * */
    this.closeNode = function(id) {
        $tree.jstree("close_node", id)
    };
    /** * 특정노드 삭제 * id * */
    this.removeNode = function(id) {
        $tree.jstree(true).delete_node(id);
    };
    /** * 특정노드 이름변경 * node : 변경할 대상 node * text : 변경할 이름 string * */
    this.renameNode = function(node, text) {
        $tree.jstree("rename_node", node, text);
    };
}
