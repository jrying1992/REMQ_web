<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
    <%@ page import="Model.showInfo" %> 
    <%@ page import="Model.complexity" %> 
    <%@ page import="Model.security" %> 
    <%@ page import="Model.coupling" %> 
    <%@ page import="Model.cohesion" %> 
    <%@ page import="Bean.resultBean"%>
    <%@ page import="DAO.resultDAO"%>
    <%@ page import="DAO.commentDAO"%>
    <%@ page import="Bean.commentBean"%>    
    <%@ page import="java.util.Date"%>
    <%@ page import="java.text.DateFormat"%>
    <%@ page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
		</noscript>
		<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/skel.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/skel-layers.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/init.js"></script>
		<noscript>
			<link rel="stylesheet" href="${pageContext.request.contextPath}/css/skel.css" />
			<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
			<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style-xlarge.css" />
		</noscript>
<title>Result page</title>
</head>
<body>
<body>
<%
showInfo bean = (showInfo)request.getAttribute("basic"); 
complexity comp_bean = (complexity)request.getAttribute("complexity");
security se_bean = (security)request.getAttribute("security");
coupling cp_bean = (coupling)request.getAttribute("coupling");
cohesion ch_bean = (cohesion)request.getAttribute("cohesion");


DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
Date date = new Date();
out.println(dateFormat.format(date));

String packageName = "test";
int classNum = bean.getClassNum();
double simplicity = comp_bean.countSimplicity();
double reusability = comp_bean.countReusability();
double cohesion = ch_bean.countCohesion();
double coupling = cp_bean.countWTCoup();
double AHF = se_bean.countAHF();
double HC = se_bean.countHC();
double security = se_bean.countSecurity();
String time = dateFormat.format(date);


resultBean result = new resultBean();
result.setPackageName(packageName);
result.setClassNum(classNum);
result.setSimplicity(simplicity);
result.setResuability(reusability);
result.setCohesion(cohesion);
result.setCoupling(coupling);
result.setAHF(AHF);
result.setHC(HC);
result.setSecurity(security);
result.setTime(time);
result = resultDAO.insertData(result);

commentBean comment = new commentBean();

comment = commentDAO.selectlastData(comment);
comment = commentDAO.getComplexityComment(comment);
comment = commentDAO.getCohesionComment(comment);
comment = commentDAO.getCouplingComment(comment);
comment = commentDAO.getSecurityComment(comment);

String complexityComment = comment.getComplexityComment();
String cohesionComment = comment.getCohesionComment();
String couplingComment = comment.getCouplingComment();
String securityComment = comment.getSecurityComment();

%>

		
<!-- Header -->
			<header id="header">
				<h1><a href="index.html">NCU ISQ</a></h1>
				<nav id="nav">
					<ul>
						<li><a href="#">Home</a></li>
						<li><a href="showAllResult.jsp">Historical data</a></li>
						<li><a href="homePage.jsp">Sign Up</a></li>
						<li><a href="homePage.jsp" class="button special">Log out</a></li>
					</ul>
				</nav>
			</header>

	<!-- One -->
			<section id="one" class="wrapper style1 special">
				<div class="container">
					<header class="major">
						<h2>Result</h2>
						<p>Package name : <%=packageName%><br>Class number :<%=classNum %></p>
					</header>
					<div class="row 100%">
						<div class="3u 6u(medium)">
							<section class="box">
								<i class="icon big rounded color1 fa-cloud"></i>
								<h3>Complexity</h3>
								<p>Simplicity: <%=simplicity %>.<br>Reusability : <%=reusability%></p>
							</section>
						</div>
						<div class="3u 6u(medium)">
							<section class="box">
								<i class="icon big rounded color9 fa-desktop"></i>
								<h3>Coupling</h3>
								<p><%=coupling %></p>
							</section>
						</div>
						<div class="3u 6u(medium)">
							<section class="box">
								<i class="icon big rounded color6 fa-rocket"></i>
								<h3>Cohesion</h3>
								<p><%=cohesion%></p>
							</section>
						</div>
						<div class="3u 6u(medium)">
							<section class="box">
								<i class="icon big rounded color6 fa-rocket"></i>
								<h3>Security</h3>
								<p><%=security%></p>
							</section>
						</div>
					</div>
				</div>
			</section>

	<!-- Two -->
			<section id="two" class="wrapper style2 special">
				<div class="container">
					<header class="major">
						<h2>Complexity</h2>
						<p><%=complexityComment %></p>
						<h2>Coupling</h2>
						<p><%=couplingComment %></p>
						<h2>Cohesion</h2>
						<p><%=cohesionComment%></p>
						<h2>Security</h2>
						<p><%=securityComment %></p>
					</header>
					
					<footer>
						<p>�����צ�����N���A�w���g�^�X</p>
						<ul class="actions">
							<li>
								<a href="feedback.jsp" class="button big">Feedback</a>
							</li>
						</ul>
					</footer>
				</div>
			</section>


	<!-- Footer -->
			<footer id="footer">
				<div class="container">
					<section class="links">
						<div class="row">
							<section class="3u 6u(medium) 12u$(small)">
								<h3>Lorem ipsum dolor</h3>
								<ul class="unstyled">
									<li><a href="#">Lorem ipsum dolor sit</a></li>
									<li><a href="#">Nesciunt itaque, alias possimus</a></li>
									<li><a href="#">Optio rerum beatae autem</a></li>
									<li><a href="#">Nostrum nemo dolorum facilis</a></li>
									<li><a href="#">Quo fugit dolor totam</a></li>
								</ul>
							</section>
							<section class="3u 6u$(medium) 12u$(small)">
								<h3>Culpa quia, nesciunt</h3>
								<ul class="unstyled">
									<li><a href="#">Lorem ipsum dolor sit</a></li>
									<li><a href="#">Reiciendis dicta laboriosam enim</a></li>
									<li><a href="#">Corporis, non aut rerum</a></li>
									<li><a href="#">Laboriosam nulla voluptas, harum</a></li>
									<li><a href="#">Facere eligendi, inventore dolor</a></li>
								</ul>
							</section>
							<section class="3u 6u(medium) 12u$(small)">
								<h3>Neque, dolore, facere</h3>
								<ul class="unstyled">
									<li><a href="#">Lorem ipsum dolor sit</a></li>
									<li><a href="#">Distinctio, inventore quidem nesciunt</a></li>
									<li><a href="#">Explicabo inventore itaque autem</a></li>
									<li><a href="#">Aperiam harum, sint quibusdam</a></li>
									<li><a href="#">Labore excepturi assumenda</a></li>
								</ul>
							</section>
							<section class="3u$ 6u$(medium) 12u$(small)">
								<h3>Illum, tempori, saepe</h3>
								<ul class="unstyled">
									<li><a href="#">Lorem ipsum dolor sit</a></li>
									<li><a href="#">Recusandae, culpa necessita nam</a></li>
									<li><a href="#">Cupiditate, debitis adipisci blandi</a></li>
									<li><a href="#">Tempore nam, enim quia</a></li>
									<li><a href="#">Explicabo molestiae dolor labore</a></li>
								</ul>
							</section>
						</div>
					</section>
					<div class="row">
						<div class="8u 12u$(medium)">
							<ul class="copyright">
								<li>&copy; NCU ISQ 2017. All rights reserved.</li>
								<li>Design: Jrying Yang</a></li>
								<li>Contact: <a href="http://templated.co">jrying1212@g.ncu.edu.tw</a></li>
							</ul>
						</div>
						<div class="4u$ 12u$(medium)">
							<ul class="icons">
								<li>
									<a class="icon rounded fa-facebook"><span class="label">Facebook</span></a>
								</li>
								<li>
									<a class="icon rounded fa-twitter"><span class="label">Twitter</span></a>
								</li>
								<li>
									<a class="icon rounded fa-google-plus"><span class="label">Google+</span></a>
								</li>
								<li>
									<a class="icon rounded fa-linkedin"><span class="label">LinkedIn</span></a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</footer>

</body>
</html>