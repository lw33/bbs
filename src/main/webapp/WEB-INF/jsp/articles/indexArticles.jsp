<%@page isELIgnored="false"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div role="tabpanel" class="tab-pane active" id="sour">
    <%-- <div class="check-div form-inline">
         <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addSource" >&nbsp;&nbsp;登&nbsp;入&nbsp;&nbsp;</button>
        &lt;%&ndash; <form action="${pageContext.request.contextPath}/article/search" method="post" class="navbar-form navbar-left" role="search" style="float: right;">
             <input type="text"  name="key" class="form-control" placeholder="Search">
             <button type="submit" class="btn btn-default">
                 <span class="glyphicon glyphicon-search"></span> 搜索
             </button>
         </form>&ndash;%&gt;
     </div>--%>
    <div class="data-div">
        <div class="row tableHeader">

            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 ">
                序号
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                标题
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                创建时间
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                楼主
            </div>
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                最后修改时间
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                状态
            </div>
        </div>
        <div class="tablebody">

            <c:forEach var="u" items="${articles}" varStatus="status">
                <a href="${pageContext.request.contextPath}/article/detail/${u.aid}" style="color:#717592">
                <div class="row" style="position: relative;height: 75px;">
                    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                        <c:out value="${status.index+1}"/>
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            ${u.title}

                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                        <fmt:formatDate value="${u.cratetime }" pattern="yyyy-MM-dd HH:mm:ss" />
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            ${u.author.name}
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                        <fmt:formatDate value="${u.lastmodify }" pattern="yyyy-MM-dd HH:mm:ss" />
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            <%--<c:if test="${t.isExcellent ne 1 and t.status ne 3}">--%>
                                <c:if test="${u.istop eq 1}">
                                    <button class="btn btn-danger btn-xs" >置顶</button>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                </c:if>

                        <c:if test="${u.isexcellent eq 1}">
                            <button class="btn btn-success btn-xs">&nbsp;&nbsp;&nbsp;精&nbsp;&nbsp;&nbsp;</button>
                        </c:if>
                    </div>
                        <c:if test="${! empty u.lable}">

                            <span class="label label-success" style="position: absolute;top: 46px;left: 108px;">#${u.lable}#</span>

                        </c:if>
                </div>
                </a>
            </c:forEach>

        </div>
    </div>
    <!--页码块-->
    <footer class="footer">
        <ul class="pagination">

            <li>
                第${pageInfo.pageNum}页
            </li>
            <li class="gray">
                共${pageInfo.pages}页
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/article/getArticles/${pageInfo.pageNum==1?1:pageInfo.pageNum-1 }">
                    <i class="glyphicon glyphicon-menu-left">
                    </i>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/article/getArticles/${pageInfo.pageNum==pageInfo.pages?pageInfo.pages:pageInfo.pageNum+1 }">
                    <i class="glyphicon glyphicon-menu-right">
                    </i>
                </a>
            </li>
        </ul>
    </footer>
    <%--  <!--弹出窗口 添加资源-->
      <div class="modal fade" id="addSource" role="dialog" aria-labelledby="gridSystemModalLabel">
          <div class="modal-dialog" role="document">
              <div class="modal-content">
                  <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title" id="gridSystemModalLabel">添加资源</h4>
                  </div>
                  <div class="modal-body">
                      <div class="container-fluid">
                          <form class="form-horizontal">
                              <div class="form-group ">
                                  <label for="sName" class="col-xs-3 control-label">名称：</label>
                                  <div class="col-xs-8 ">
                                      <input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
                                  </div>
                              </div>
                              <div class="form-group">
                                  <label for="sLink" class="col-xs-3 control-label">链接：</label>
                                  <div class="col-xs-8 ">
                                      <input type="" class="form-control input-sm duiqi" id="sLink" placeholder="">
                                  </div>
                              </div>
                              <div class="form-group">
                                  <label for="sOrd" class="col-xs-3 control-label">排序：</label>
                                  <div class="col-xs-8">
                                      <input type="" class="form-control input-sm duiqi" id="sOrd" placeholder="">
                                  </div>
                              </div>
                              <div class="form-group">
                                  <label for="sKnot" class="col-xs-3 control-label">父节点：</label>
                                  <div class="col-xs-8">
                                      <input type="" class="form-control input-sm duiqi" id="sKnot" placeholder="">
                                  </div>
                              </div>
                              <div class="form-group">
                                  <label for="exampleInput1" class="col-xs-3 control-label">资源类型：</label>
                                  <div class="col-xs-8">
                                      <label class="control-label" for="anniu">
                                          <input type="radio" name="leixing" id="anniu">菜单</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                      <label class="control-label" for="meun">
                                          <input type="radio" name="leixing" id="meun"> 按钮</label>
                                  </div>
                              </div>
                          </form>
                      </div>
                  </div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-xs btn-xs btn-white" data-dismiss="modal">取 消</button>
                      <button type="button" class="btn btn-xs btn-xs btn-green">保 存</button>
                  </div>
              </div>
              <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->

      <!--修改资源弹出窗口-->
      <div class="modal fade" id="changeSource" role="dialog" aria-labelledby="gridSystemModalLabel">
          <div class="modal-dialog" role="document">
              <div class="modal-content">
                  <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title" id="gridSystemModalLabel">修改资源</h4>
                  </div>
                  <div class="modal-body">
                      <div class="container-fluid">
                          <form class="form-horizontal">
                              <div class="form-group ">
                                  <label for="sName" class="col-xs-3 control-label">名称：</label>
                                  <div class="col-xs-8 ">
                                      <input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
                                  </div>
                              </div>
                              <div class="form-group">
                                  <label for="sLink" class="col-xs-3 control-label">链接：</label>
                                  <div class="col-xs-8 ">
                                      <input type="" class="form-control input-sm duiqi" id="sLink" placeholder="">
                                  </div>
                              </div>
                              <div class="form-group">
                                  <label for="sOrd" class="col-xs-3 control-label">排序：</label>
                                  <div class="col-xs-8">
                                      <input type="" class="form-control input-sm duiqi" id="sOrd" placeholder="">
                                  </div>
                              </div>
                              <div class="form-group">
                                  <label for="sKnot" class="col-xs-3 control-label">父节点：</label>
                                  <div class="col-xs-8">
                                      <input type="" class="form-control input-sm duiqi" id="sKnot" placeholder="">
                                  </div>
                              </div>
                              <div class="form-group">
                                  <label for="exampleInput1" class="col-xs-3 control-label">资源类型：</label>
                                  <div class="col-xs-8">
                                      <label class="control-label" for="anniu">
                                          <input type="radio" name="leixing" id="anniu">菜单</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                      <label class="control-label" for="meun">
                                          <input type="radio" name="leixing" id="meun"> 按钮</label>
                                  </div>
                              </div>
                          </form>
                      </div>
                  </div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                      <button type="button" class="btn btn-xs btn-green">保 存</button>
                  </div>
              </div>
              <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      <!--弹出删除资源警告窗口-->
      <div class="modal fade" id="deleteSource" role="dialog" aria-labelledby="gridSystemModalLabel">
          <div class="modal-dialog" role="document">
              <div class="modal-content">
                  <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
                  </div>
                  <div class="modal-body">
                      <div class="container-fluid">
                          确定要删除该资源？删除后不可恢复！
                      </div>
                  </div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                      <button type="button" class="btn btn-xs btn-danger">保 存</button>
                  </div>
              </div>
              <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
      </div>--%>
    <!-- /.modal -->
</div>
