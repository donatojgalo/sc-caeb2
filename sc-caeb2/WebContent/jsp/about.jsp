<%@page import="com.caeb2.util.Constants"%>

<div class="modal fade" id="aboutModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
						aria-label="<%=Constants.JSP_CLOSE%>">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title"><%=Constants.JSP_ABOUT%></h4>
			</div>
			<div class="modal-body">
				<p class="text-center"><%=Constants.CENSO_COMUNITARIO%></p>
				<p class="text-center"><%=Constants.CCAEB2%></p>
				<p class="text-justify">Proyecto de Servicio Comunitario desarrollado por los estudiantes
					de la Escuela de Ingenier�a de Sistemas de la Universidad de Los Andes:
					Araujo Arnoely, Galo Donato, Hidalgo Jos� Miguel,
					Porcar Marcelino, Vel�squez Erik y Viloria Marco.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">
					<%=Constants.JSP_OK%>
				</button>
			</div>
		</div>
	</div>
</div>
