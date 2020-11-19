<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer  style="background-color: #3c3c3c" class="footer navbar-fixed-bottom hidden-xs">
    <div class="container">
        <div class="row">
            <div class="hidden-xs col-sm-3 col-md-3">
                <p style="color: white; margin: 15px 5px 15px 5px;">
                    <%
                        Date d = new Date();
                        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        String now = df.format(d);
                    %>
                    当前时间：<%=now %>
                </p>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6 text-center">
                <p style="color: white; margin: 15px 5px 15px 5px;"><span>Copyright © Hasaki-Pro 2019</span></p>
            </div>
<%--            <div class="hidden-xs col-md-3">--%>
<%--                <p style="color: white; margin: 15px 5px 15px 5px;"><span>Version 1.0</span></p>--%>
<%--            </div>--%>
        </div>
    </div>
</footer>
