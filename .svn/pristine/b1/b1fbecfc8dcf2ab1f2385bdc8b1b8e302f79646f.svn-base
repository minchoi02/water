<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="custld" uri="/WEB-INF/tld/custld.tld"%>
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>

<c:set var="registerFlag" value="${empty authorManageVO.authorCode ? 'INSERT' : 'UPDATE'}"/>

<validator:javascript formName="authorManage" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript">
$(document).ready(function(){
    //그리드 시작
	const gridData = getTreeData(${list_menulist});
	var TextInputRenderer = function(props) {
		  var el = document.createElement('input');
		  el.type = 'checkbox';
		  el.style.margin = 'auto 50%';

		  if(props.value==1){
		      el.checked = true;
		  };
		  this.el = el;
		  this.render(props);
		}

		TextInputRenderer.prototype.getElement = function () {
			return this.el;
		}

		TextInputRenderer.prototype.render = function (props) {
			this.el.value = props.value;
		}

	grid = new tui.Grid({
	  el: document.getElementById('grid'),
	  data: gridData,
	  scrollX: false,
	  scrollY: false,
	  rowHeaders: [ "checkbox"],
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
		      hidden :true
		    },
		    {
		      header: '메뉴이름',
		      name: 'value',
		      sortingType: 'desc',
			  sortable: true
		    },
		    {
		      header: '조회권한',
		      name: 'readAuthor',
		      renderer: {
		      	type: TextInputRenderer
		      }
		    }
		    ,
		    {
		      header: '생성권한',
		      name: 'creatAuthor',
		      renderer: {
		      	type: TextInputRenderer
		      }
		    }
		    ,
		    {
		      header: '수정권한',
		      name: 'updtAuthor',
		      renderer: {
		      	type: TextInputRenderer
		      }
		    }
		    ,
		    {
		      header: '삭제권한',
		      name: 'deleteAuthor',
		      renderer: {
		      	type: TextInputRenderer
		      }
		    }
		  ]
	});
	grid.on('click', function(object){

	    var headerEl = grid.getElement(object.rowKey,"_checked");
	    var readAuthorEl = grid.getElement(object.rowKey,"readAuthor");
        var creatAuthorEl = grid.getElement(object.rowKey,"creatAuthor");
        var updtAuthorEl = grid.getElement(object.rowKey,"updtAuthor");
        var deleteAuthorEl = grid.getElement(object.rowKey,"deleteAuthor");

		if(object.columnName=="_checked"){
		    if($(headerEl).find('input:checkbox').is(":checked")){
		        $(readAuthorEl).find('input:checkbox').prop("checked", true);
		        $(creatAuthorEl).find('input:checkbox').prop("checked", true);
		        $(updtAuthorEl).find('input:checkbox').prop("checked", true);
		        $(deleteAuthorEl).find('input:checkbox').prop("checked", true);
		    }else{
		        $(readAuthorEl).find('input:checkbox').prop("checked", false);
		        $(creatAuthorEl).find('input:checkbox').prop("checked", false);
		        $(updtAuthorEl).find('input:checkbox').prop("checked", false);
		        $(deleteAuthorEl).find('input:checkbox').prop("checked", false);
		    }
		}
	  });
	grid.expandAll();
});


function fnSelectAuthorList() {
    var varFrom = document.getElementById("authorManage");
    varFrom.action = "<c:url value='/sys/author/arm/TotAuthorManage.do'/>";
    varFrom.submit();
}

function fnAuthorInsert() {
    var checkedRow = grid.getCheckedRowKeys();
    var param = [];
    for(var i=0;i<checkedRow.length;i++){
        var readAuthorEl = grid.getElement(checkedRow[i],"readAuthor");
        var creatAuthorEl = grid.getElement(checkedRow[i],"creatAuthor");
        var updtAuthorEl = grid.getElement(checkedRow[i],"updtAuthor");
        var deleteAuthorEl = grid.getElement(checkedRow[i],"deleteAuthor");
        var readAuthorVal = 0;
        var creatAuthorVal = 0;
        var updtAuthorVal = 0;
        var deleteAuthorVal = 0;
        if($(readAuthorEl).find('input:checkbox').is(":checked")){readAuthorVal = 1};
        if($(creatAuthorEl).find('input:checkbox').is(":checked")){creatAuthorVal = 1};
        if($(updtAuthorEl).find('input:checkbox').is(":checked")){updtAuthorVal = 1};
        if($(deleteAuthorEl).find('input:checkbox').is(":checked")){deleteAuthorVal = 1};

        param.push({"authorNm":$("#authorNm").val(),"menuId":grid.getRow(checkedRow[i])["id"],"progrmFileNm":grid.getRow(checkedRow[i])["progrmFileNm"],
                "readAuthor":readAuthorVal,"creatAuthor":creatAuthorVal,"updtAuthor":updtAuthorVal,"deleteAuthor":deleteAuthorVal});
    }

    $.ajax({
        url:'<c:url value='/sys/author/arm/AuthorInsert.do'/>',
        type:'POST',
        dataType:'json',
        contentType:"application/json; charset=UTF-8",
        data:JSON.stringify(param),
        success:function(data){
			alert('저장되었습니다.');
			location.reload();
        }
    });
}

function fnAuthorUpdate() {
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

function fnAuthorDelete() {
    var varFrom = document.getElementById("authorManage");
    varFrom.action = "<c:url value='/sys/author/arm/AuthorDelete.do'/>";
    if(confirm("삭제 하시겠습니까?")){
        varFrom.submit();
    }
}
function getTreeData(array){

    var map = {};
    for(var i = 0; i < array.length; i++){

      var obj = {"id" : array[i]['menuNo'], "value" : array[i]['menuNm'] , "upperMenuId" : array[i]['upperMenuId'],
                 "upperMenuNm" : array[i]['upperMenuNm'],"progrmFileNm" : array[i]['progrmFileNm'],"chkYeoBu":array[i]['chkYeoBu']};
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
</script>

<h2 class="hidden">컨텐츠영역</h2>
<!-- panel -->
<section class="panel-wrap">
    <div class="panel-header">
        <h3>권한 그룹 등록</h3>
    </div>
    <div class="panel-body">
        <form:form commandName="authorManage" method="post">
		<h4>기본정보</h4>
        	<div class="table-box table-row">
            	<table>
                	<caption>권한 그룹 기본정보</caption>
                    <colgroup>
                    	<col style="width:200px;">
                        <col style="width:auto;">
                    </colgroup>
                    <tbody>
                    	<tr>
                        	<th scope="row">권한 그룹명</th>
                            <td>
                            	<div>
                                	<input type="text" id="authorNm" placeholder="입력하세요." />
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="mt30">
                <h4>접근 권한 설정</h4>
                <div class="label-input float-right pt5">
	            	<label><input type="radio" />전체</label>
	                <label><input type="radio" />숨김 제외</label>
	            </div>
	            <div class="y-scroll content-height-5">
	                <div id="grid"></div>
			       	<div id="fl"></div>
                </div>
            </div>
        </form:form>

    </div>
    <div class="panel-footer">
        <div class="btn-area">
            <button type="button" class="btn btn-primary btn-lg" onclick="javascript:fnAuthorInsert(); return false;">등록</button>
            <button type="button" class="btn btn-default btn-lg" onclick="javascript:fnSelectAuthorList(); return false;">목록</button>
        </div>
    </div>
</section>
<!-- panel -->
