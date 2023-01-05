<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<script src="/js/jsTreeMain.js"></script>
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>

<c:set var="registerFlag" value="${empty authorManageVO.authorCode ? 'INSERT' : 'UPDATE'}"/>

<validator:javascript formName="authorManage" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript">
<!--
var id = "";
var idMaxValue = 0;
$(document).ready(function(){
    const treeData =${tree};
    $('#tree').jstree({ 'core' : { 'data' : treeData, "check_callback" : true }, "plugins" : ["dnd"] });
    $("#tree").jstree("open_all");
    $('#tree').bind('select_node.jstree', function(event, data){
        id = data.instance.get_node(data.selected).id;        //id 가져오기
        var type = data.instance.get_node(data.selected).type;    //type 가져오기
        var path = data.instance.get_node(data.selected).path;    //paht 가져오기

    });
    var JSON = ${tree};
    var idData = JSON.map(function(v){
       return v.id;
    });
    idMaxValue = Math.max.apply(null,idData);

    $('#tree').on("select_node.jstree", function (e, data) {
        var id = data.instance.get_node(data.selected).id;
		selectNode(id);
    });
    $('#tree').bind("loaded.jstree", function(e) {
        $('#tree').jstree('open_all');
    }.bind(this));


    //그리드 시작
    const gridData =${resultList};
	grid = new tui.Grid({
	  el: document.getElementById('grid'),
	  data: gridData,
	  scrollX: false,
	  scrollY: false,
	  rowHeaders : ["rowNum"],
	  columns: [
	    {
	      header: '유니크아이디',
	      name: 'uniqId',
	      sortingType: 'desc',
	      sortable: true,
	      hidden :true
	    },
	    {
	      header: '아이디',
	      name: 'userId',
	      sortingType: 'desc',
		  sortable: true
	    },
	    {
	      header: '이름',
	      name: 'userNm',
	      filter: 'select',
		  align: 'center'
	    },
	    {
	      header: '소속기관',
	      name: 'pstInst',
		  align: 'center'
	    },
	    {
	      header: '등록일자',
	      name: 'joinDt',
		  align: 'center'
		},
		{header: '권한(선택)',
		    name: 'authorCd',
		    formatter: 'listItemText',
		    align: 'center',
		    editor: {
		      type: 'select',
		      options: {
		        listItems:${authorList}
		      }
		    }
		  },
	    {
	      header: '가입상태',
	      name: 'sttus',
		  align: 'center'
		}

	  ]
	});
	tui.Grid.applyTheme('striped', {
	    grid: {
	        border: '#aaa',
	        text: '#333'
	    },
	    cell: {
	        disabled: {
	            text: '#999'
	        }
	    }
	});
	grid.on('click', function(object){
	    if(object.rowKey!=undefined){
	    	//fnSelectUser(grid.getValue(object.rowKey,"userTy")+":"+grid.getValue(object.rowKey,"uniqId"));
	    }
	  })
    grid.on('afterChange', function(object){
      var rowData = grid.getRow(object.changes[0].rowKey);
      var authorCode = object.changes[0].value;
	  updateUserAuthor(rowData.uniqId,authorCode);
    })

});
function updateUserAuthor(uniqId,authorCode){

    var param = JSON.stringify({"uniqId":uniqId,"authorCode":authorCode});
    if(confirm("수정하시겠습니까?")){
	      $.ajax({
	          url:'<c:url value='/sys/author/arm/UpdateUserAuthor.do'/>',
	          type:'POST',
	          dataType:'json',
	          async: false,
	          contentType:"application/json; charset=UTF-8",
	          data:param,
	          success:function(data){
	  			alert('저장되었습니다.');
	  			location.reload();
	          }
	      });
	  }
}
function fnSelectUser(id) {
    document.listForm.selectedId.value = id;
    array = id.split(":");
    if(array[0] == "") {
    } else {
        userTy = array[0];
        userId = array[1];
    }
    document.listForm.selectedId.value = userId;
    document.listForm.action = "<c:url value='/sys/user/urm/UserSelectUpdtView.do'/>";
    document.listForm.submit();

}
function fncSelectAuthorList() {
    var varFrom = document.getElementById("authorManage");
    varFrom.action = "<c:url value='/sys/author/arm/AuthorManage.do'/>";
    varFrom.submit();
}

function fncAuthorInsert() {

    var varFrom = document.getElementById("authorManage");
    varFrom.action = "<c:url value='/sys/author/arm/AuthorInsert.do'/>";

    if(confirm("저장 하시겠습니까?")){
        if(!validateAuthorManage(varFrom)){
            return;
        }else{
            varFrom.submit();
        }
    }
}

function fncAuthorUpdate() {
    var varFrom = document.getElementById("authorManage");
    varFrom.action = "<c:url value='/sys/author/arm/AuthorUpdate.do'/>";

    if(confirm("저장 하시겠습니까?")){
        if(!validateAuthorManage(varFrom)){
            return;
        }else{
            varFrom.submit();
        }
    }
}

function fncAuthorDelete() {
    var varFrom = document.getElementById("authorManage");
    varFrom.action = "<c:url value='/sys/author/arm/AuthorDelete.do'/>";
    if(confirm("삭제 하시겠습니까?")){
        varFrom.submit();
    }
}
function saveTree(){


    var treeData = new Array() ;
    var jdata = $('#tree').jstree(true).get_json("#", {
        flat : true
    });
    for (var i = 0; i < jdata.length; i++) {
        var current = jdata[i];
        var id = current.id;
        var parent = current.parent;
        var data = this.findCoreData(id);
        treeData.push({"id":current.id,"parent":current.parent,"text":current.text,"odr":i+1,"codeHead":"ROL","codeId":"COM058" });
    }
    $.ajax({
        url:'<c:url value='/sys/author/arm/UpdateTreeCode.do'/>',
        type:'POST',
        dataType:'json',
        contentType:"application/json; charset=UTF-8",
        data:JSON.stringify(treeData),
        success:function(data){
			alert('저장되었습니다.');
			location.reload();
        }
    });


}
function findCoreData(id) {
    var coreData = $('#tree').jstree(true).settings.core.data;
    for (var i = 0; i < coreData.length; i++) {
        var data = coreData[i];
        if (data.id == id) {
            return data;
        }
    }
    return null;
};
function addNode(){
   /*  var currentNode = $('#tree').jstree(true).get_node(id);
    var allNode = $('#tree').jstree(true);

    var ids = currentNode.children;
    if (!ids)
        return [];
    var children = [];
    for (var i = 0; i < ids.length; i++) {
        children.push(allNode.get_node(ids[i]));
    }

    idMaxValue = idMaxValue+1

    allNode.create_node(currentNode, {"id":idMaxValue,"text":"부서명"}, "last");
    allNode.edit(idMaxValue); */

    location.href = '/sys/author/arm/TotAuthorInsertView.do';
}
function selectNode(id){

    var param = {id:id};
    $.ajax({
        url:'<c:url value='/sys/author/arm/selectAuthorUser.do'/>',
        type:'POST',
        dataType:'json',
        contentType:"application/json; charset=UTF-8",
        data:JSON.stringify(param),
        success:function(data){
    		grid.resetData(data);
    		$("#totalPage").text(data.length);
        }
    });
}
function deleteNode(){
   /*  var tree = $('#tree').jstree(true);
    tree.delete_node(id); */
    if(id==''){
        alert('삭제할 권한을 선택해주세요');
       	return false;
    }else{
        if(confirm('삭제하시겠습니까?')){
    		location.href = '/sys/author/arm/TotAuthorDelete.do?treeCode='+id;
        }
    }
}
function updateNode(){
   /*  var tree = $('#tree').jstree(true);
    tree.edit(id); */
    if(id==''){
        alert('수정할 권한을 선택해주세요');
       	return false;
    }else{
    	location.href = '/sys/author/arm/TotAuthorUpdateView.do?treeCode='+id;
    }
}

function fnSearch(){
	var param = {
			authorCode : id,
			searchCondition : $("#searchCondition").val(),
			searchKeyword : $("#SearchKeyword").val(),
	}
	$.ajax({
		url : "<c:url value='/sys/user/urm/searchAuthorUserList.do'/>",
		type : "POST",
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		data : JSON.stringify(param),
		success : function(data){
			grid.resetData(data);
			$("#totalPage").text(data.length);
		}
	})
}
//-->
</script>

<h2 class="hidden">컨텐츠영역</h2>
    <!-- panel -->
<section class="panel-wrap">
        <div class="panel-header">
            <h3>권한 관리 목록</h3>
        </div>
        <div class="panel-body">
            <div class="row">
                <form:form commandName="authorManage" method="post" class="col-3">
                     <input type="hidden" name="selectedId">
               <input type="hidden" name="rolCode">
                     <div class="tree-area" id="deptTree">
                        <div id="tree"></div>
                     </div>
                     <div class="btn-area">
                        <button type="button" class="btn btn-secondary btn-md btn-block"onclick="javascript:addNode();">권한등록</button>
<!--                                 <button type="button" class="btn btn-default btn-md btn-block"onclick="javascript:updateNode();">수정</button> -->
<!--                                 <button type="button" class="btn btn-default btn-md btn-block"onclick="javascript:deleteNode();">삭제</button> -->
<!--                                 <button type="button" class="btn btn-default btn-md btn-block"onclick="javascript:;">권한이동</button> -->
                        <button type="button" class="btn btn-default btn-md btn-block"onclick="javascript:updateNode();">권한수정</button>
                        <button type="button" class="btn btn-default btn-md btn-block"onclick="javascript:deleteNode();">권한삭제</button>
                     </div>
                </form:form>
                <form name="listForm" action="<c:url value='/sys/author/arm/TotAuthorManage.do'/>" method="post" class="col-9">
                    <div class="search-area">
                        <input type="hidden" name="selectedId">
                        <input type="hidden" name="rolCode">

                        <label for="searchCondition" class="hidden">검색조건</label>
                        <select id="searchCondition" name="searchCondition" title="검색조건 선택" class="select_style1">
                            <option value="0">아이디</option>
                            <option value="1">이름</option>
                        </select>
                        <input type="text" id="SearchKeyword" name="SearchKeyword" size="35" maxlength="35" title="검색어 입력" placeholder="검색어를 입력하세요."/>
                        <button type="button" class="btn btn-primary" onclick="javascript:fnSearch(); return false;">검색</button>
                    </div>

                    <div class="table-header">
                        <div>총 <strong class="secondary" id="totalPage">${paginationInfo.totalRecordCount}</strong>건이 검색 되었습니다.</div>
                    </div>

                    <div class="y-scroll content-height-4" id="userGrid">
                       <table>
                           <div id="grid"></div>
                           <div id="fl"></div>
                       </table>
                    </div>
                </form>
            </div>
        </div>
</section>