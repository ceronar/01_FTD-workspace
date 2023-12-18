<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Google tag (gtag.js) -->
    <script
      async
      src="https://www.googletagmanager.com/gtag/js?id=G-1752YPLP7H"
    ></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag() {
        dataLayer.push(arguments);
      }
      gtag("js", new Date());

      gtag("config", "G-1752YPLP7H");
    </script>

    <title>Simple | tsParticles 404</title>
    <link type="text/css" rel="stylesheet" href="resources/css/common/errors.css" />
    <link rel="icon" type="image/x-icon" href="resources/images/sample/tsParticles-64.png" />
  </head>

  <body>
    <div class="error-page">
      <div>
        <h1 data-h1="401">401</h1>
        <p data-p="UNAUTHORIZED">UNAUTHORIZED</p>
      </div>
    </div>

    <a href="${pageContext.request.contextPath}/" class="back">메인으로</a>

    <div id="tsparticles"></div>

    <script
      type="text/javascript"
      src="https://cdn.jsdelivr.net/npm/tsparticles@2/tsparticles.bundle.min.js"
    ></script>
    <script type="text/javascript" src="resources/js/common/errors.js"></script>
  </body>
</html>
