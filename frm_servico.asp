<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file ="lib/Conexao.asp"--> 
<!--#include file ="base.asp"-->

<%
if Session("CPF_Usu") = "" then
response.Write("<script>")
response.Write("alert('O Usuáio não está logado!');")
response.Write("window.location.assign('login.asp')")
response.Write("</script>")
end if


cod = Request.QueryString("cod")
evt  = Request.QueryString("evt")
Session("NomeServico") = request.form("nome")
anexo         =  Request.Form("Anexo")
NomeServico   =  Request.Form("NomeServico")
call abreConexao
if cod <> "" then
   cod = cint(cod)
end if
if ucase(evt) = "ALT" then
   
   sql = "SELECT * from DL_CadServico where id_CadServico = "&cod

   set rs = conn.execute(sql)
NomeServico   =  rs("NomeServico")
anexo         =  rs("Anexo")
TipoServico   =  rs("Tipo_Servico") 
Existe = 1


   bot        = "Alterar"
else
   bot       = "Incluir"
end if
'Session("id_modulo") = rs("id_modulo")
call fechaConexao
%>


<head>
   
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords">
       
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.2.1/dist/sweetalert2.min.js"></script>
<script>
function validar(){
	if(document.frm_Servico.NomeServico_001.value == ""){
        Swal.fire({
 		    icon: 'error',
  			title: 'Oops...',
  			text: 'Obrigatorio Digitar o Nome do Serviço!',
		 })
         document.frm_Servico.NomeServico_001.focus();
         return false;
     }
     if (document.frm_Servico.TipoServico.value == ""){
		 Swal.fire({
 		    icon: 'error',
  			title: 'Oops...',
  			text: 'Obrigatorio Selecionar o tipo de serviço!',
			
		 })
		 document.frm_Servico.TipoServico.focus()
		 return false;
		 }
     if (document.frm_Servico.anexo.value == ""){
		 Swal.fire({
 		    icon: 'error',
  			title: 'Oops...',
  			text: 'Obrigatorio Inserir o anexo!',
			
		 })
		 document.frm_Servico.anexo.focus()
		 return false;
		 }
     else{
       document.frm_Servico.action = "manu_servico.asp";
     }
}
</script>


      
        <div class="page-wrapper" style="min-height: 250px;">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb bg-white">
                <div class="row align-items-center">
                   
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="white-box">
                            <h3 class="box-title">Cadastro</h3>
   <form class="form-horizontal" name="frm_Servico" method="post" enctype="multipart/form-data">

    <div class="form-group">
      <label class="control-label col-sm-2" for="NomeServico_1"><b>Nome do Serviço:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="NomeServico_001" name="NomeServico_001" value="<%=NomeServico%>">
      </div>
    </div>
    <%
	call abreConexao
	sql = "Select * from DL_Servico ORDER BY id_Servico"
	set rs = conn.execute(sql)
	%>
    <div class="form-group">
      <label class="control-label col-sm-2" for="TipoServico"><b>Tipo do Serviço:</b></label>
      <div class="col-sm-4">
        <select class="form-select shadow-none p-0 border-0 form-control-line" name="TipoServico">
            <option value="">--- Selecionar ---</option>
			<%do while not rs.eof%>
        	<option value="<%=rs("id_Servico")%>" <%if clng(rs("id_Servico")) = clng(TipoServico) then%>selected <%end if%>><%=rs("Nome_Servico")%></option>
            <%
			rs.movenext
			loop
			call fechaConexao
			%>
        </select>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="anexo"><b>Anexo:</b></label>
      <div class="col-sm-4">
        <input type="file" class="form-control" id="anexo" name="anexo" value="<%=anexo%>">
    </div>
       </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-primary" name="Botao" onClick="return validar();" value="<%=bot%>"><%=bot%></button>
      </div>
    </div>
	<input type="hidden" name="hfcod" value="<%=cod%>">
  </form>
</div>
                       </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Right sidebar -->
                <!-- ============================================================== -->
                <!-- .right-sidebar -->
                <!-- ============================================================== -->
                <!-- End Right sidebar -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer text-center"> 2021 © <a
                    href="https://www.wrappixel.com/">ADAPEC-TO</a>
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="plugins/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/app-style-switcher.js"></script>
    <!--Wave Effects -->
    <script src="js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="js/custom.js"></script>