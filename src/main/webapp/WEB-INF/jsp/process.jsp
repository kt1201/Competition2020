<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Process</title>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<script>
	$(document)
			.ready(
					function() {

						google.charts.load('current', {
							'packages' : [ 'corechart' ]
						});
						google.charts.setOnLoadCallback(draw_A_Crosshairs);
						google.charts.setOnLoadCallback(draw_B_Crosshairs);
						google.charts.setOnLoadCallback(draw_C_Crosshairs);

						function draw_A_Crosshairs() {

							var result;
							$
									.ajax({
										type : 'GET',
										dataType : "json",
										url : '${pageContext.request.contextPath}/api/sample/find_A',
										async : false,
										success : function(data) {
											result = data;
										}
									});

							var data = new google.visualization.DataTable();
							data.addColumn('number', 'sq');
							data.addColumn('number', 'col1');
							data.addColumn('number', 'col2');
							data.addColumn('number', 'col3');
							data.addColumn('number', 'col4');
							var dataArray = [];
							$.each(result, function(i, obj) {
								dataArray.push([ obj.sq, obj.col1, obj.col2,
										obj.col3, obj.col4 ]);
							});

							data.addRows(dataArray);

							var linechart = new google.visualization.ChartWrapper(
									{
										chartType : 'LineChart',
										containerId : 'A_linechart_div',
										dataTable : data,
										options : {
											legend : {
												textStyle : {
													fontSize : 13
												}
											},
											hAxis : {
												title : 'sq',
												textStyle : {
													fontSize : 12
												}
											},
											vAxis : {
												title : 'Value',
												textStyle : {
													fontSize : 12
												}
											},
											colors : [ 'red', 'green', 'blue',
													'orange' ],
											crosshair : {
												color : '#000',
												trigger : 'selection'
											}
										}
									});

							var columns = [ 0 ];
							/* the series map is an array of data series
							 * "column" is the index of the data column to use for the series
							 * "roleColumns" is an array of column indices corresponding to columns with roles that are associated with this data series
							 * "display" is a boolean, set to true to make the series visible on the initial draw
							 */
							var seriesMap = [ {
								column : 1,
								display : true
							}, {
								column : 2,
								display : true
							}, {
								column : 3,
								display : true
							}, {
								column : 4,
								display : true
							} ];
							var columnsMap = {};
							var series = [];
							for (var i = 0; i < seriesMap.length; i++) {
								var col = seriesMap[i].column;
								columnsMap[col] = i;
								// set the default series option
								series[i] = {};
								if (seriesMap[i].display) {
									// if the column is the domain column or in the default list, display the series
									columns.push(col);
								} else {
									// otherwise, hide it
									columns.push({
										label : data.getColumnLabel(col),
										type : data.getColumnType(col),
										sourceColumn : col,
										calc : function() {
											return null;
										}
									});
									// backup the default color (if set)
									if (typeof (series[i].color) !== 'undefined') {
										series[i].backupColor = series[i].color;
									}
									series[i].color = '#CCCCCC';
								}
							}

							linechart.setOption('series', series);

							function showHideSeries() {
								var sel = linechart.getChart().getSelection();
								// if selection length is 0, we deselected an element
								if (sel.length > 0) {
									// if row is undefined, we clicked on the legend
									if (sel[0].row == null) {
										var col = sel[0].column;
										if (typeof (columns[col]) == 'number') {
											var src = columns[col];

											// hide the data series
											columns[col] = {
												label : data
														.getColumnLabel(src),
												type : data.getColumnType(src),
												sourceColumn : src,
												calc : function() {
													return null;
												}
											};

											// grey out the legend entry
											series[columnsMap[src]].color = '#CCCCCC';
										} else {
											var src = columns[col].sourceColumn;

											// show the data series
											columns[col] = src;
											series[columnsMap[src]].color = null;
										}
										var view = linechart.getView() || {};
										view.columns = columns;
										linechart.setView(view);
										linechart.draw();
									}
								}
							}

							google.visualization.events.addListener(linechart,
									'select', showHideSeries);

							// create a view with the default columns
							var view = {
								columns : columns
							};

							window.addEventListener('resize', function() {
								linechart.draw();
							}, false);
							linechart.draw();
						}

						function draw_B_Crosshairs() {

							var result;
							$
									.ajax({
										type : 'GET',
										dataType : "json",
										url : '${pageContext.request.contextPath}/api/sample/find_B',
										async : false,
										success : function(data) {
											result = data;
										}
									});

							var data = new google.visualization.DataTable();
							data.addColumn('number', 'sq');
							data.addColumn('number', 'col1');
							data.addColumn('number', 'col2');
							data.addColumn('number', 'col3');
							data.addColumn('number', 'col4');
							var dataArray = [];
							$.each(result, function(i, obj) {
								dataArray.push([ obj.sq, obj.col1, obj.col2,
										obj.col3, obj.col4 ]);
							});

							data.addRows(dataArray);

							var linechart = new google.visualization.ChartWrapper(
									{
										chartType : 'LineChart',
										containerId : 'B_linechart_div',
										dataTable : data,
										options : {
											legend : {
												textStyle : {
													fontSize : 13
												}
											},
											hAxis : {
												title : 'sq',
												textStyle : {
													fontSize : 12
												}
											},
											vAxis : {
												title : 'Value',
												textStyle : {
													fontSize : 12
												}
											},
											colors : [ 'red', 'green', 'blue',
													'orange' ],
											crosshair : {
												color : '#000',
												trigger : 'selection'
											}
										}
									});

							var columns = [ 0 ];
							/* the series map is an array of data series
							 * "column" is the index of the data column to use for the series
							 * "roleColumns" is an array of column indices corresponding to columns with roles that are associated with this data series
							 * "display" is a boolean, set to true to make the series visible on the initial draw
							 */
							var seriesMap = [ {
								column : 1,
								display : true
							}, {
								column : 2,
								display : true
							}, {
								column : 3,
								display : true
							}, {
								column : 4,
								display : true
							} ];
							var columnsMap = {};
							var series = [];
							for (var i = 0; i < seriesMap.length; i++) {
								var col = seriesMap[i].column;
								columnsMap[col] = i;
								// set the default series option
								series[i] = {};
								if (seriesMap[i].display) {
									// if the column is the domain column or in the default list, display the series
									columns.push(col);
								} else {
									// otherwise, hide it
									columns.push({
										label : data.getColumnLabel(col),
										type : data.getColumnType(col),
										sourceColumn : col,
										calc : function() {
											return null;
										}
									});
									// backup the default color (if set)
									if (typeof (series[i].color) !== 'undefined') {
										series[i].backupColor = series[i].color;
									}
									series[i].color = '#CCCCCC';
								}
							}

							linechart.setOption('series', series);

							function showHideSeries() {
								var sel = linechart.getChart().getSelection();
								// if selection length is 0, we deselected an element
								if (sel.length > 0) {
									// if row is undefined, we clicked on the legend
									if (sel[0].row == null) {
										var col = sel[0].column;
										if (typeof (columns[col]) == 'number') {
											var src = columns[col];

											// hide the data series
											columns[col] = {
												label : data
														.getColumnLabel(src),
												type : data.getColumnType(src),
												sourceColumn : src,
												calc : function() {
													return null;
												}
											};

											// grey out the legend entry
											series[columnsMap[src]].color = '#CCCCCC';
										} else {
											var src = columns[col].sourceColumn;

											// show the data series
											columns[col] = src;
											series[columnsMap[src]].color = null;
										}
										var view = linechart.getView() || {};
										view.columns = columns;
										linechart.setView(view);
										linechart.draw();
									}
								}
							}

							google.visualization.events.addListener(linechart,
									'select', showHideSeries);

							// create a view with the default columns
							var view = {
								columns : columns
							};

							window.addEventListener('resize', function() {
								linechart.draw();
							}, false);
							linechart.draw();
						}

						function draw_C_Crosshairs() {

							var result;
							$
									.ajax({
										type : 'GET',
										dataType : "json",
										url : '${pageContext.request.contextPath}/api/sample/find_C',
										async : false,
										success : function(data) {
											result = data;
										}
									});

							var data = new google.visualization.DataTable();
							data.addColumn('number', 'sq');
							data.addColumn('number', 'col1');
							data.addColumn('number', 'col2');
							data.addColumn('number', 'col3');
							data.addColumn('number', 'col4');
							var dataArray = [];
							$.each(result, function(i, obj) {
								dataArray.push([ obj.sq, obj.col1, obj.col2,
										obj.col3, obj.col4 ]);
							});

							data.addRows(dataArray);

							var linechart = new google.visualization.ChartWrapper(
									{
										chartType : 'LineChart',
										containerId : 'C_linechart_div',
										dataTable : data,
										options : {
											legend : {
												textStyle : {
													fontSize : 13
												}
											},
											hAxis : {
												title : 'sq',
												textStyle : {
													fontSize : 12
												}
											},
											vAxis : {
												title : 'Value',
												textStyle : {
													fontSize : 12
												}
											},
											colors : [ 'red', 'green', 'blue',
													'orange' ],
											crosshair : {
												color : '#000',
												trigger : 'selection'
											}
										}
									});

							var columns = [ 0 ];
							/* the series map is an array of data series
							 * "column" is the index of the data column to use for the series
							 * "roleColumns" is an array of column indices corresponding to columns with roles that are associated with this data series
							 * "display" is a boolean, set to true to make the series visible on the initial draw
							 */
							var seriesMap = [ {
								column : 1,
								display : true
							}, {
								column : 2,
								display : true
							}, {
								column : 3,
								display : true
							}, {
								column : 4,
								display : true
							} ];
							var columnsMap = {};
							var series = [];
							for (var i = 0; i < seriesMap.length; i++) {
								var col = seriesMap[i].column;
								columnsMap[col] = i;
								// set the default series option
								series[i] = {};
								if (seriesMap[i].display) {
									// if the column is the domain column or in the default list, display the series
									columns.push(col);
								} else {
									// otherwise, hide it
									columns.push({
										label : data.getColumnLabel(col),
										type : data.getColumnType(col),
										sourceColumn : col,
										calc : function() {
											return null;
										}
									});
									// backup the default color (if set)
									if (typeof (series[i].color) !== 'undefined') {
										series[i].backupColor = series[i].color;
									}
									series[i].color = '#CCCCCC';
								}
							}

							linechart.setOption('series', series);

							function showHideSeries() {
								var sel = linechart.getChart().getSelection();
								// if selection length is 0, we deselected an element
								if (sel.length > 0) {
									// if row is undefined, we clicked on the legend
									if (sel[0].row == null) {
										var col = sel[0].column;
										if (typeof (columns[col]) == 'number') {
											var src = columns[col];

											// hide the data series
											columns[col] = {
												label : data
														.getColumnLabel(src),
												type : data.getColumnType(src),
												sourceColumn : src,
												calc : function() {
													return null;
												}
											};

											// grey out the legend entry
											series[columnsMap[src]].color = '#CCCCCC';
										} else {
											var src = columns[col].sourceColumn;

											// show the data series
											columns[col] = src;
											series[columnsMap[src]].color = null;
										}
										var view = linechart.getView() || {};
										view.columns = columns;
										linechart.setView(view);
										linechart.draw();
									}
								}
							}

							google.visualization.events.addListener(linechart,
									'select', showHideSeries);

							// create a view with the default columns
							var view = {
								columns : columns
							};

							window.addEventListener('resize', function() {
								linechart.draw();
							}, false);
							linechart.draw();
						}
					});
</script>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="/">
				<div class="text-center">
					<img class="img-fluid px-1 px-sm-1 mt-1 mb-1"
						src="img/Penta logo.png" alt="">
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link" href="/"> <i
					class="fas fa-fw fa-tachometer-alt"></i> <span>Process</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Process</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseA_module"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-folder"></i> <span>Alpha Process</span>
			</a>
				<div id="collapseA_module" class="collapse"
					aria-labelledby="headingA_module" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="/Alpha">Alpha Table</a>
						<div class="collapse-divider"></div>
					</div>
				</div></li>

			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseB_module"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-folder"></i> <span>Beta Process</span>
			</a>
				<div id="collapseB_module" class="collapse"
					aria-labelledby="headingB_module" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="/Beta">Beta Table</a>
						<div class="collapse-divider"></div>
					</div>
				</div></li>

			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseC_Process"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-folder"></i> <span>Gamma Process</span>
			</a>
				<div id="collapseC_Process" class="collapse"
					aria-labelledby="headingC_Process" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="/Gamma">Gamma Table</a>
						<div class="collapse-divider"></div>
					</div>
				</div></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- Topbar Search -->
					<c:if test="${pageContext.request.userPrincipal.name != null}">
						<form id="logoutForm" method="POST" action="${contextPath}/logout">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</form>

						<h4 style="color: black;">USER :
							${pageContext.request.userPrincipal.name}</h4>


						<!-- Topbar Navbar -->
						<ul class="navbar-nav ml-auto">
							<a onclick="document.forms['logoutForm'].submit()"
								class="btn btn-secondary btn-icon-split"> <span
								class="icon text-white-50"> <i class="fas fa-info-circle"></i>
							</span> <span class="text" style="color: white;">LOG OUT</span>
							</a>
						</ul>
					</c:if>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">프로세스 현황</h1>
					</div>

					<!-- Content Row -->

					<div class="row">
						<!-- Area A process Chart -->
						<div class="col-xl-12 col-lg-11">
							<div class="card shadow mb-4">
								<!-- Card Header -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">Alpha
										Process</h6>
									<div class="module">
										<a href="/Alpha" class="btn btn-light btn-icon-split"> <span
											class="icon text-gray-600"> <i
												class="fas fa-arrow-right"></i>
										</span> <span class="text" style="color: black;">Alpha Table</span>
										</a>
									</div>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-area">
										<div id="A_linechart_div" style="width: 100%; height: 100%;"></div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<!-- Area B process Chart -->
						<div class="col-xl-12 col-lg-11">
							<div class="card shadow mb-4">
								<!-- Card Header -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">Beta Process</h6>
									<div class="module">
										<a href="/Beta" class="btn btn-light btn-icon-split"> <span
											class="icon text-gray-600"> <i
												class="fas fa-arrow-right"></i>
										</span> <span class="text" style="color: black;">Beta Table</span>
										</a>
									</div>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-area">
										<div id="B_linechart_div" style="width: 100%; height: 100%;"></div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<!-- Area C process Chart -->
						<div class="col-xl-12 col-lg-11">
							<div class="card shadow mb-4">
								<!-- Card Header -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">Gamma
										Process</h6>
									<div class="module">
										<a href="/Gamma" class="btn btn-light btn-icon-split"> <span
											class="icon text-gray-600"> <i
												class="fas fa-arrow-right"></i>
										</span> <span class="text" style="color: black;">Gamma Table</span>
										</a>
									</div>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-area">
										<div id="C_linechart_div" style="width: 100%; height: 100%;"></div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Penta System Technology / BigData Team</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/chart-area-demo.js"></script>
	<script src="js/demo/chart-pie-demo.js"></script>

</body>

</html>
