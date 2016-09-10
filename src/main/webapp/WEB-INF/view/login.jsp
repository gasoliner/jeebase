<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="staticPath" value="${pageContext.request.contextPath}/static"/>
<c:set var="adminPath" value="${pageContext.request.contextPath}/admin"/>
<html>
<head>
    <title>登录</title>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta content="width=device-width, initial-scale=1" name="viewport" />
  <!-- 全局样式-->
<%--
  <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
--%>
  <link href="${staticPath}/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  <link href="${staticPath}/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
  <link href="${staticPath}/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <link href="${staticPath}/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />

  <link href="${staticPath}/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
  <link href="${staticPath}/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />

  <!--主题全局样式-->
  <link href="${staticPath}/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
  <link href="${staticPath}/global/css/plugins.min.css" rel="stylesheet" type="text/css" />

  <!--页面样式-->
  <link href="${staticPath}/pages/css/login.css" rel="stylesheet" type="text/css" />
  <link rel="shortcut icon" href="favicon.ico" /> </head>
</head>

<body class=" login">
<div class="logo">
    <label style="font-size: 30px;color: #fff">jeebase快速开发平台</label>
</div>

<div class="content">
  <!-- 登录 -->
  <form class="login-form" action="index.html" method="post">
    <h3 class="form-title font-green">登录</h3>

    <div class="alert alert-danger display-hide">
      <button class="close" data-close="alert"></button>
      <span> 请输入你的用户名和密码 </span>
    </div>

    <div class="form-group">
      <!--ie8, ie9 不支持placeholder , 采用标题显示-->
      <label class="control-label visible-ie8 visible-ie9">用户名</label>
      <input class="form-control form-control-solid placeholder-no-fix" type="text" autocomplete="off" placeholder="用户名" name="username" />
    </div>
    <div class="form-group">
      <label class="control-label visible-ie8 visible-ie9">密码</label>
      <input class="form-control form-control-solid placeholder-no-fix" type="password" autocomplete="off" placeholder="密码" name="password" />
    </div>

    <div class="form-group">
      <label class="control-label visible-ie8 visible-ie9">验证码</label>
      <input class="form-control form-control-solid placeholder-no-fix" type="text" autocomplete="off" placeholder="验证码" name="validateCode" />
      <img src="${adminPath}/validateCode" onclick="this.src = '${adminPath}/validateCode?v=' + Math.random()"/>
    </div>

    <div class="form-actions">
      <button type="submit" class="btn green uppercase">登录</button>
      <label class="rememberme check mt-checkbox mt-checkbox-outline">
        <input type="checkbox" name="remember" value="1" />记住我
        <span></span>
      </label>
    </div>
  </form>

</div>

<!--IE9-->
<script src="${staticPath}/global/plugins/respond.min.js"></script>
<script src="${staticPath}/global/plugins/excanvas.min.js"></script>

<!-- js插件 -->
<script src="${staticPath}/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>

<script src="${staticPath}/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>

<!--页面插件-->
<script src="${staticPath}/global/scripts/app.min.js" type="text/javascript"></script>
<script>
  var Login = function() {

    var handleLogin = function() {

      $('.login-form').validate({
        errorElement: 'span', //default input error message container
        errorClass: 'help-block', // default input error message class
        focusInvalid: false, // do not focus the last invalid input
        rules: {
          username: {
            required: true
          },
          password: {
            required: true
          },
          remember: {
            required: false
          },
          validateCode: {
            required : true
          }
        },

        messages: {
          username: {
            required: "请输入用户名"
          },
          password: {
            required: "请输入密码"
          },
          validateCode: {
            required : "请输入验证码"
          }
        },

        invalidHandler: function(event, validator) { //display error alert on form submit
          $('.alert-danger', $('.login-form')).show();
        },

        highlight: function(element) { // hightlight error inputs
          $(element)
                  .closest('.form-group').addClass('has-error'); // set error class to the control group
        },

        success: function(label) {
          label.closest('.form-group').removeClass('has-error');
          label.remove();
        },

        errorPlacement: function(error, element) {
          error.insertAfter(element.closest('.input-icon'));
        },

        submitHandler: function(form) {
          form.submit(); // form validation success, call ajax form submit
        }
      });

      $('.login-form input').keypress(function(e) {
        if (e.which == 13) {
          if ($('.login-form').validate().form()) {
            $('.login-form').submit(); //form validation success, call ajax form submit
          }
          return false;
        }
      });
    }

    return {
      //main function to initiate the module
      init: function() {
        handleLogin();
      }
    };


  }();

  jQuery(document).ready(function() {
    Login.init();
  });
</script>
</body>
</html>