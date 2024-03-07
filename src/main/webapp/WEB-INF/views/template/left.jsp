<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:eval var="contextPath" expression="@environment.getProperty('context.path')" />

<nav id="sidebarMenu" class="sidebar d-lg-block bg-gray-800 text-white collapse" data-simplebar>
	<div class="sidebar-inner px-4 pt-3">
		<div class="user-card d-flex d-md-none align-items-center justify-content-between justify-content-md-center pb-4">
			<div class="d-flex align-items-center">
				<div class="avatar-lg me-4">
					<%--
					<img src="/${contextPath}/vendor/volt-v1.4.1/assets/img/team/profile-picture-3.jpg" class="card-img-top rounded-circle border-white" alt="Bonnie Green">
					--%>
					<c:choose>
						<c:when test="${not empty auth}">
							<img src="${auth.user.picture}" class="card-img-top rounded-circle border-white">
						</c:when>
						<c:otherwise>
							<img src="/${contextPath}/img/etc/OIG3.png" class="card-img-top rounded-circle border-white">
						</c:otherwise>
					</c:choose>
				</div>
				<div class="d-block">
					<c:choose>
						<c:when test="${not empty auth}">
							<h2 class="h5 mb-3">Hi! ${auth.user.email}</h2>
							<a href="/${contextPath}/logout" class="btn btn-secondary btn-sm d-inline-flex align-items-center">
								<svg class="icon icon-xxs me-1" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path></svg>						
								LOGOUT
							</a>
						</c:when>
						<c:otherwise>
							<h2 class="h5 mb-3">Hi!</h2>
							<a href="/${contextPath}/oauth2/authorization/google" class="btn btn-secondary btn-sm d-inline-flex align-items-center">
								<svg class="icon icon-xxs me-1" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path></svg>						
								LOGIN
							</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="collapse-close d-md-none">
				<a href="#sidebarMenu" data-bs-toggle="collapse"
						data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="true"
						aria-label="Toggle navigation">
						<svg class="icon icon-xs" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
					</a>
			</div>
		</div>
		<ul class="nav flex-column pt-3 pt-md-0">
			<li class="nav-item my-2">
				<a href="/${contextPath}/" class="nav-link d-flex align-items-center">
					<span class="sidebar-icon">
						<svg class="icon icon-xs me-2" fill="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
							<path d="M13.768,1.147a2.5,2.5,0,0,0-3.536,0L0,11.38V21a3,3,0,0,0,3,3H21a3,3,0,0,0,3-3V11.38ZM21,21H16V17.818A3.818,3.818,0,0,0,12.182,14h-.364A3.818,3.818,0,0,0,8,17.818V21H3V12.622l9-9,9,9Z"/>
						</svg>
					</span>
					<span class="mt-1 ms-1 sidebar-text">HOME</span>
				</a>
			</li>
			<li class="nav-item my-2">
				<a href="/${contextPath}/main/main" class="nav-link d-flex align-items-center">
					<span class="sidebar-icon">
						<svg class="icon icon-xs me-2" fill="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
							<path d="M13.768,1.147a2.5,2.5,0,0,0-3.536,0L0,11.38V21a3,3,0,0,0,3,3H21a3,3,0,0,0,3-3V11.38ZM21,21H16V17.818A3.818,3.818,0,0,0,12.182,14h-.364A3.818,3.818,0,0,0,8,17.818V21H3V12.622l9-9,9,9Z"/>
						</svg>
					</span>
					<span class="mt-1 ms-1 sidebar-text">MAIN</span>
				</a>
			</li>
			<li class="nav-item my-2">
				<a href="/${contextPath}/bbs/bbsList" class="nav-link">
					<span class="sidebar-icon">
						<svg class="icon icon-xs me-2" fill="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
							<path d="M21,16H16v5H3V3.409A.41.41,0,0,1,3.409,3H15.172l3-3H3.409A3.413,3.413,0,0,0,0,3.409V24H18.349L24,18.348V5.829l-3,3Z"/><path d="M5,19H8L23.4,3.6a2.121,2.121,0,0,0-3-3L5,16Z"/>
						</svg>
					</span> 
					<span class="sidebar-text">BBS</span>
				</a>
			</li>
			<li class="nav-item my-2">
				<a href="/${contextPath}/admin/manage" class="nav-link">
					<span class="sidebar-icon">
						<svg class="icon icon-xs me-2" fill="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
							<path d="M12,8a4,4,0,1,0,4,4A4,4,0,0,0,12,8Zm0,6a2,2,0,1,1,2-2A2,2,0,0,1,12,14Z"/><path d="M21.294,13.9l-.444-.256a9.1,9.1,0,0,0,0-3.29l.444-.256a3,3,0,1,0-3-5.2l-.445.257A8.977,8.977,0,0,0,15,3.513V3A3,3,0,0,0,9,3v.513A8.977,8.977,0,0,0,6.152,5.159L5.705,4.9a3,3,0,0,0-3,5.2l.444.256a9.1,9.1,0,0,0,0,3.29l-.444.256a3,3,0,1,0,3,5.2l.445-.257A8.977,8.977,0,0,0,9,20.487V21a3,3,0,0,0,6,0v-.513a8.977,8.977,0,0,0,2.848-1.646l.447.258a3,3,0,0,0,3-5.2Zm-2.548-3.776a7.048,7.048,0,0,1,0,3.75,1,1,0,0,0,.464,1.133l1.084.626a1,1,0,0,1-1,1.733l-1.086-.628a1,1,0,0,0-1.215.165,6.984,6.984,0,0,1-3.243,1.875,1,1,0,0,0-.751.969V21a1,1,0,0,1-2,0V19.748a1,1,0,0,0-.751-.969A6.984,6.984,0,0,1,7.006,16.9a1,1,0,0,0-1.215-.165l-1.084.627a1,1,0,1,1-1-1.732l1.084-.626a1,1,0,0,0,.464-1.133,7.048,7.048,0,0,1,0-3.75A1,1,0,0,0,4.79,8.992L3.706,8.366a1,1,0,0,1,1-1.733l1.086.628A1,1,0,0,0,7.006,7.1a6.984,6.984,0,0,1,3.243-1.875A1,1,0,0,0,11,4.252V3a1,1,0,0,1,2,0V4.252a1,1,0,0,0,.751.969A6.984,6.984,0,0,1,16.994,7.1a1,1,0,0,0,1.215.165l1.084-.627a1,1,0,1,1,1,1.732l-1.084.626A1,1,0,0,0,18.746,10.125Z"/>
						</svg>
					</span> 
					<span class="sidebar-text">MANAGE</span>
				</a>
			</li>
			<li class="nav-item my-2">
				<a href="/${contextPath}/user/info" class="nav-link">
					<span class="sidebar-icon">
						<svg class="icon icon-xs me-2" fill="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
							<path d="M12,24A12,12,0,1,1,24,12,12.013,12.013,0,0,1,12,24ZM12,3a9,9,0,1,0,9,9A9.011,9.011,0,0,0,12,3Z"/><path d="M14.455,18.682h-3V12.545H10.091v-3H12A2.457,2.457,0,0,1,14.455,12Z"/><circle cx="12.284" cy="6.75" r="1.716"/>
						</svg>
					</span> 
					<span class="sidebar-text">INFO</span>
				</a>
			</li>
			
			<c:choose>
				<c:when test="${empty auth}">
					<li class="nav-item my-2">
					
						<%--
						<a href="/${contextPath}/login" class="nav-link">
						--%>
						<a href="/${contextPath}/oauth2/authorization/google" class="nav-link">
						<%--
						<a href="/${contextPath}/oauth2/authorization/google" 
						onclick="window.open(this.href, '_blank', width='400', height='300'); return false;" class="nav-link">
						--%>
							<span class="sidebar-icon">
								<svg class="icon icon-xs me-2" fill="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
									<path d="M3.017,13.5H14.455l-2.689,2.689,2.121,2.122,4.189-4.19a3,3,0,0,0,0-4.242l-4.2-4.2L11.753,7.8l2.7,2.7H3.017Z"/><path d="M20.5,0H3.5A3.528,3.528,0,0,0,0,3.552V7.9H3V3.552A.526.526,0,0,1,3.5,3h17a.526.526,0,0,1,.5.548v16.9a.526.526,0,0,1-.5.548H3.5a.526.526,0,0,1-.5-.548V16.1H0v4.352A3.528,3.528,0,0,0,3.5,24h17A3.528,3.528,0,0,0,24,20.448V3.552A3.528,3.528,0,0,0,20.5,0Z"/>
								</svg>
							</span> 
							<span class="sidebar-text">LOGIN</span>
						</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="nav-item my-2">
						<a href="/${contextPath}/logout" class="nav-link">
							<span class="sidebar-icon">
								<svg class="icon icon-xs me-2" fill="currentColor" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
									<path d="M170.698,448H72.757c-4.814-0.012-8.714-3.911-8.725-8.725V72.725c0.012-4.814,3.911-8.714,8.725-8.725h97.941	 c17.673,0,32-14.327,32-32s-14.327-32-32-32H72.757C32.611,0.047,0.079,32.58,0.032,72.725v366.549	 C0.079,479.42,32.611,511.953,72.757,512h97.941c17.673,0,32-14.327,32-32S188.371,448,170.698,448z"/>
									<path d="M483.914,188.117l-82.816-82.752c-12.501-12.495-32.764-12.49-45.259,0.011s-12.49,32.764,0.011,45.259l72.789,72.768	 L138.698,224c-17.673,0-32,14.327-32,32s14.327,32,32,32l0,0l291.115-0.533l-73.963,73.963	 c-12.042,12.936-11.317,33.184,1.618,45.226c12.295,11.445,31.346,11.436,43.63-0.021l82.752-82.752	 c37.491-37.49,37.491-98.274,0.001-135.764c0,0-0.001-0.001-0.001-0.001L483.914,188.117z"/>
								</svg>
							</span> 
							<span class="sidebar-text">LOGOUT</span>
						</a>
					</li>
				</c:otherwise>
			</c:choose>
			
			<li role="separator" class="dropdown-divider mt-4 mb-3 border-gray-700"></li>
			
			<li class="nav-item mt-2">
				<a class="nav-link" href="https://www.flaticon.com/uicons">UIcon by Flaticon</a>
				<a class="nav-link" href="https://themesberg.com">Theme by Themesberg</a>
			</li>
		</ul>
		
	</div>
</nav>