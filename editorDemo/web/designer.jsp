<%--
  Created by IntelliJ IDEA.
  User: clove
  Date: 2017/11/2
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>Designer</title>
    <%@include file="WEB-INF/head.jsp" %>
    <script type="text/javascript" src="statics/js/uuid.js"></script>
    <script type="text/javascript" src="statics/js/xmlToJson.js"></script>
    <script type="text/javascript" src="statics/js/getBpmn.js"></script>
    <script type="text/javascript" src="statics/js/designer.js"></script>
    <script type="text/javascript" src="statics/js/freetable.js"></script>
</head>
<body>
    <div class="easyui-layout" style="width:auto;height: 100%;">

        <div data-options="region:'west'" style="width:300px;height: 100%">
            <div class="easyui-layout"  data-options="fit:true">
                <div class="easyui-accordion" data-options="region:'north',title:'Items',collapsible:false" height="auto">
                    <div title="Events" style="width: 100%">
                        <ul>
                            <li id="bpmn-event-start" class="easyui-draggable bpmn-list">
                                <img class="bpmn-icon" src="./statics/images/icons/startevent/none.png">
                                Start Event
                            </li>
                            <li id="bpmn-event-end" class="easyui-draggable bpmn-list">
                                <img class="bpmn-icon" src="./statics/images/icons/endevent/none.png">
                                End Event
                            </li>
                        </ul>
                    </div>
                    <div title="Activities" style="width: 100%">
                        <ul>
                            <li id="bpmn-task-user" class="easyui-draggable bpmn-list">
                                <img class="bpmn-icon" src="./statics/images/icons/activity/list/type.user.png">
                                User Task
                            </li>
                            <li></li>
                        </ul>
                    </div>
                    <div title="Gateways" style="width: 100%">
                        <ul>
                            <li id="bpmn-gateway-exclusive" class="easyui-draggable bpmn-list">
                                <img class="bpmn-icon" src="./statics/images/icons/gateway/exclusive.databased.png">
                                Exclusive Gateway
                            </li>
                            <li></li>
                        </ul>
                    </div>
                </div>
                <div id="bpmn-properties" height="auto" region="center"
                     data-options="collapsible:false,title:'Properties',tools:[{iconCls:'icon-save',handler:getTableFile}]">
                    <table id="default-table" class="bpmn-properties-table">
                        <tr><th width="120px">KEY</th><th>VALUE</th></tr>
                        <tr><td>id</td><td> </td></tr>
                        <tr><td>name</td><td> </td></tr>
                    </table>
                </div>
            </div>
        </div>
        <div data-options="region:'center'">
            <div id="inner-pannel" class="easyui-layout" fit="true">
                <div id="bpmn-canvas" class="easyui-droppable" data-options=
                        "region:'center',title:'Canvas',accept:'.bpmn-list',tools:[{iconCls:'icon-save',handler:getSvgFile}]">
                    <div style="position:relative;width: 100%;height: 100%">
                        <div id="svg-container" style="width: 100%;height: 100%">
                            <svg id="bpmn-svg" style="width:100%;height:100%" xmlns="http://www.w3.org/2000/svg" version="1.1">
                            </svg>
                        </div>
                        <div id="bpmn-menu-area">
                            <div id="bpmn-menu-arrow" class="bpmn-menu easyui-draggable">
                                <img src="statics/images/icons/connector/sequenceflow.png">
                            </div>
                            <div id="bpmn-menu-delete" class="bpmn-menu" onclick="deleteItem()">
                                <img src="statics/images/icons/delete.png">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

<script type="text/javascript">
    $(document).ready(function () {
        initDesigner();
        initFreeTable();
    });
</script>