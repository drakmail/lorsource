<%--
  ~ Copyright 1998-2012 Linux.org.ru
  ~    Licensed under the Apache License, Version 2.0 (the "License");
  ~    you may not use this file except in compliance with the License.
  ~    You may obtain a copy of the License at
  ~
  ~        http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~    Unless required by applicable law or agreed to in writing, software
  ~    distributed under the License is distributed on an "AS IS" BASIS,
  ~    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  ~    See the License for the specific language governing permissions and
  ~    limitations under the License.
  --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lor" uri="http://www.linux.org.ru" %>
<jsp:include page="/WEB-INF/jsp/head.jsp"/>
<title>Конструктор страницы</title>
<jsp:include page="/WEB-INF/jsp/header.jsp"/>

<h1>Конструктор страницы</h1>
При помощи этого инструмента вы можете составить для себя свою собственную
страничку, содержащую только необходимую вам информацию.

<table>
  <tr>
    <td valign="top">
      <h3>Левая колонка</h3>

      <div class=column>
        <c:set var="boxvar">
          <c:choose>
            <c:when test="${isThreeColumn}">main3-1</c:when>
            <c:otherwise>main2</c:otherwise>
          </c:choose>
        </c:set>
        <lor:boxlets object="${boxvar}" var="boxes">
          <c:forEach items="${boxes}" var="box" varStatus="status">
            <div class="boxlet">
              <c:import url="/${box}.boxlet"/>
              <c:url context="/" var="add_url" value="/add-box.jsp">
                <c:param name="tag" value="left"/>
                <c:param name="pos" value="${status.index}"/>
              </c:url>

              <c:url context="/" var="remove_url" value="/remove-box.jsp">
                <c:param name="tag" value="left"/>
                <c:param name="pos" value="${status.index}"/>
              </c:url>
              <p/>
              <strong>Меню редактирования:</strong>
              <br>
              * <a href="${add_url}">добавить сюда</a>
              <br>
              * <a href="${remove_url}">удалить</a>
              <br>
            </div>
          </c:forEach>
        </lor:boxlets>
        <c:url context="/" var="add_url" value="/add-box.jsp">
          <c:param name="tag" value="left"/>
        </c:url>
        [<a href="${add_url}">Добавить</a>]
      </div>
    </td>
    <td valign="top"><h1>Редактирование</h1>
      Чтобы добавить или удалить Boxlet, выберете соответствующий пункт в меню
      редактирования внизу каждой коробочки.
    </td>
    <c:if test="${isThreeColumn}">
      <td valign="top">
        <h3>Правая колонка</h3>

        <div class="column">
          <lor:boxlets object="main3-2" var="boxes">
            <c:forEach items="${boxes}" var="box" varStatus="status">
              <div class="boxlet">
                <c:import url="/${box}.boxlet"/>
                <c:url context="/" var="add_url" value="/add-box.jsp">
                  <c:param name="tag" value="right"/>
                  <c:param name="pos" value="${status.index}"/>
                </c:url>

                <c:url context="/" var="remove_url" value="/remove-box.jsp">
                  <c:param name="tag" value="right"/>
                  <c:param name="pos" value="${status.index}"/>
                </c:url>
                <p/>
                <strong>Меню редактирования:</strong>
                <br>
                * <a href="${add_url}">добавить сюда</a>
                <br>
                * <a href="${remove_url}">удалить</a>
                <br>
              </div>
            </c:forEach>
          </lor:boxlets>
          <c:url context="/" var="add_url" value="/add-box.jsp">
            <c:param name="tag" value="right"/>
          </c:url>
          [<a href="${add_url}">Добавить</a>]
        </div>
      </td>
    </c:if>
  </tr>
</table>

<jsp:include page="/WEB-INF/jsp/footer.jsp"/>