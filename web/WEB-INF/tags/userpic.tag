<%@ tag import="ru.org.linux.util.ImageInfo" %>
<%@ tag import="ru.org.linux.util.BadImageException" %>
<%@ tag import="ru.org.linux.util.StringUtil" %>
<%@ tag import="java.io.IOException" %>
<%@ tag import="ru.org.linux.site.Template" %>
<%--
~ Copyright 1998-2009 Linux.org.ru
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
<%@ tag pageEncoding="UTF-8"%>
<%@ attribute name="author" required="true" type="ru.org.linux.site.User"%>
<div class="userpic">
<%
  Template tmpl = Template.getTemplate(request);

  if (author.getPhoto() != null) {
    try {
      ImageInfo info = new ImageInfo(tmpl.getObjectConfig().getHTMLPathPrefix() + "/photos/" + author.getPhoto());
      out.append("<img src=\"/photos/").append(author.getPhoto()).append("\" alt=\"").append(author.getNick()).append(" (фотография)\" ").append(info.getCode()).append(" >");
    } catch (BadImageException e) {
//      logger.warning(StringUtil.getStackTrace(e));
    } catch (IOException e) {
//      logger.warning(StringUtil.getStackTrace(e));
    }
  } else {
    if (author.hasGravatar()) {
      out.append("<img width=150 height=150 src=\""+author.getGravatar()+"\">");
    }
  }
%>
</div>