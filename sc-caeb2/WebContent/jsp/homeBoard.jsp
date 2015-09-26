<%@page import="com.caeb2.actions.BoardsManager"%>
<%@page import="com.caeb2.util.TextUtils"%>
<%@page import="com.caeb2.util.Parameters"%>
<%@page import="com.caeb2.util.Constants"%>

<%@include file="header.jsp"%>

<%
	Parameters.setTitle("Hogares");

	String dwellingIdStr = (String) request.getAttribute("dwellingId");

	int dwellingId = TextUtils.isEmptyOrNull(dwellingIdStr) ? -1 : Integer.valueOf(dwellingIdStr);

	String homesJSON = BoardsManager.loadAllHomes(dwellingId);
%>

<script type="text/javascript">
	$(document).ready(function() {

		<%if (TextUtils.isEmptyOrNull(homesJSON)) {%>
			showError('<%=Constants.NO_DATA_ERROR%>');
		<%} else {%>
			loadDatatable();
		<%}%>

	});

	function loadDatatable() {

		var jsonData = JSON.parse('<%=homesJSON%>');

		$('#homesData').on('draw.dt', function () {
			init();
		}).dataTable({
			'scrollY': '450px',
			'scrollCollapse': true,
			'language': {
				'url': '/sc-caeb2/js/Spanish.json'
			},
			'data': jsonData.data,
			'columns': jsonData.columns
		});

	}

	function init() {

		$('[data-toggle="tooltip"]').tooltip();

		$('.viewHomeBtn').on('click', function() {
			console.log('viewHomeBtn on click = ' + $(this).attr('data-home-id'));

			window.location.href = '<%=Constants.EXEC_ACTION + "loadAllPersons"%>&homeId='
				+ $(this).attr('data-home-id');
		});

		$('.editHomeBtn').on('click', function() {
			console.log('editHomeBtn on click = ' + $(this).attr('data-home-id'));
		});

		$('.deleteHomeBtn').on('click', function() {
			console.log('deleteHomeBtn on click = ' + $(this).attr('data-home-id'));
		});

	}
</script>

<%@include file="navbar.jsp"%>

<link rel="stylesheet" type="text/css" href="/sc-caeb2/css/dataTables.bootstrap.css"/>

<script src="/sc-caeb2/js/jquery.dataTables.min.js"></script>
<script src="/sc-caeb2/js/dataTables.bootstrap.min.js"></script>

<div class="container-fluid">
	<div class="container table-responsive">

		<br>
		<table id="homesData" class="table table-striped table-bordered"></table>

		<div class="btn-footer">
			<a href="<%=Constants.ACTION_HOME%>">
				<button type="button" class="btn btn-default" id="backBtn">Volver</button>
			</a>
			<a href="<%=Constants.ACTION_NEW_POLL%>">
				<button type="button" class="btn btn-primary" id="newPollBtn">Nueva encuesta</button>
			</a>
		</div>
	</div>
</div>

<%@include file="footer.jsp"%>