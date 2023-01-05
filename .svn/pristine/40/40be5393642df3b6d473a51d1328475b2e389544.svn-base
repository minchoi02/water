<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>

<script type="text/javaScript">
<!--
var selectId;
$(document).ready(function(){
    //그리드 시작
	const gridData = getTreeData(${list_menulist});
	grid = new tui.Grid({
	  el: document.getElementById('grid'),
	  data: gridData,
	  draggable: true,
	  scrollX: false,
	  scrollY: false,
	  rowHeaders: [ "rowNum"],
	  	treeColumnOptions: {
	        name: 'value',
	        useCascadingCheckbox: false
	      },
	  columns: [
	    {
	      header: '메뉴번호',
	      name: 'id',
	      sortingType: 'desc',
	      sortable: true,
	      align: 'center'

	    },
	    {
	      header: '메뉴명',
	      name: 'value',
	      sortingType: 'desc',
		  sortable: true
	    },
	    {
	      header: '상위 메뉴아이디',
	      name: 'upperMenuId',
	      sortingType: 'desc',
		  sortable: true,
		  align: 'center'
	    },
	    {
		      header: '상위 메뉴이름',
		      name: 'upperMenuNm',
		      sortingType: 'desc',
			  sortable: true,
			  align: 'center'

		},
		{
		      header: '사용 여부',
		      name: 'useYn',
		      sortingType: 'desc',
			  sortable: true,
			  align: 'center'

		},
		{
		      header: '메뉴순서',
		      name: 'menuOrdr',
		      sortingType: 'desc',
			  sortable: true,
			  align: 'center'
		}

	  ]
	});
	grid.on('click', function(object){
	    selectId = object.rowKey;
	  })
	grid.on('dblclick', function(object){
	    if(object.rowKey!=undefined){
			fnSelectMenu(grid.getValue(object.rowKey,"id"));
	    }
	  })
	grid.on('drop', function(object){
	    if(object.appended){
	        alert('메뉴는 순서만 변경가능합니다.');
	        location.reload();
	    }

	  })
});
function getTreeData(array){

    var map = {};
    for(var i = 0; i < array.length; i++){

      var obj = {"id" : array[i]['menuNo'], "value" : array[i]['menuNm'] , "upperMenuId" : array[i]['upperMenuId'],
                 "upperMenuNm" : array[i]['upperMenuNm'],"useYn" : array[i]['useYn'],"chkYeoBu":array[i]['chkYeoBu'],"menuOrdr":array[i]['menuOrdr']};
      obj._children = [];
      map[obj.id] = obj;
      var parent = array[i]['upperMenuId'] || '-';

      if(!map[parent]){

        map[parent] = {

         _children: []

        };

      }

      map[parent]._children.push(obj);

    }

  return map['-']._children;

}
function fnSelectMenu(selectMenuId){
    document.listForm.selectMenuId.value = selectMenuId;
    document.listForm.action = "<c:url value='/sys/menu/mlm/MenuManageListDetailSelect.do'/>";
    document.listForm.submit();
}
function fnMenuRegist(){
    if(selectId==undefined){
    	document.listForm.selectMenuId.value = 0;
    	document.listForm.selectMenuNm.value = "없음";
    }else{
    	document.listForm.selectMenuId.value = grid.getValue(selectId,"id");
    	document.listForm.selectMenuNm.value = grid.getValue(selectId,"value");
    }
    document.listForm.action = "<c:url value='/sys/menu/mlm/MenuRegistInsertView.do'/>";
    document.listForm.submit();

}
function fnMenuDelete(){

    if(selectId==undefined){
    	alert('삭제할 메뉴를 선택해주세요');
    	return false;
    }

    if(confirm('선택한 메뉴를 삭제하시겠습니까?')){

	    document.listForm.selectMenuId.value = grid.getValue(selectId,"id");
	    document.listForm.selectMenuNm.value = grid.getValue(selectId,"value");
	    document.listForm.action = "<c:url value='/sys/menu/mlm/MenuManageDelete.do'/>";
	    document.listForm.submit();
    }else{
        return false;
    }
}
function fnUpdateMenuOrder(){

    var gridData = grid.getData();

    $.ajax({
        url:'<c:url value='/sys/menu/mlm/updateMenuOrder.do'/>',
        type:'POST',
        dataType:'json',
        contentType:"application/json; charset=UTF-8",
        data:JSON.stringify(gridData),
        success:function(data){
			alert('저장되었습니다.');
			location.reload();
        }
    });


}
/* 검색 function */
function fnSearch(){
    document.listForm.pageIndex.value = "1";
    document.listForm.action = "<c:url value='/sys/menu/mlm/MenuManage.do'/>";
    document.listForm.submit();
}
//-->
</script>
<h2 class="hidden">컨텐츠영역</h2>
<!-- panel -->
<section class="panel-wrap">
    <div class="panel-header">
        <h3>메뉴 관리 목록</h3>
    </div>
    <form name="listForm" action="<c:url value='/sys/menu/mlm/MenuMange.do'/>" method="post">
        <input name="selectMenuId" type="hidden">
        <input name="selectMenuNm" type="hidden">
        <input name="menuNm" type="hidden" />
        <input name="url" type="hidden" />
        <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

	    <div class="panel-body">
	        <div class="y-scroll content-height-3">
	            <table>
	                <caption>메뉴 관리 목록</caption>
	                <tbody>
	                    <div id="grid"></div>
	                    <div id="fl"></div>
	                </tbody>
	            </table>
	        </div>
	    </div>
    </form>
    <div class="panel-footer">
        <div class="btn-area">
            <button type="button" class="btn btn-primary btn-lg" onclick="javascript:fnUpdateMenuOrder(); return false;">메뉴순서저장</button>
            <button type="button" class="btn btn-primary btn-lg" onclick="javascript:fnMenuRegist(); return false;">신규메뉴등록</button>
            <button type="button" class="btn btn-gray btn-lg" onclick="javascript:fnMenuDelete(); return false;">삭제</button>
        </div>
    </div>
</section>
<!-- panel -->