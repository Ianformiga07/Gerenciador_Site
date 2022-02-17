<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file ="lib/Conexao.asp"--> 
<!--#include file ="base.asp"-->

<%

cod = Request.QueryString("cod")
evt  = Request.QueryString("evt")


call abreConexao
if cod <> "" then
   cod = cint(cod)
end if
if ucase(evt) = "ALT" then
   
   sql = "SELECT * from DL_CadLogin where idLogin = "&cod
    'response.write sql
    'response.end
   set rs = conn.execute(sql)
CPF                   =  rs("CPF") 
NomeCompleto          =  rs("NomeCompleto")
Email                 =  rs("Email") 
Senha                 =  rs("Senha")
Telefone              =  rs("Telefone")
Perfil                =  rs("id_Perfil")
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
	if(document.frm_Depoimento.NomeCompleto.value == ""){
        Swal.fire({
 		    icon: 'error',
  			title: 'Oops...',
  			text: 'Obrigatorio Digitar o Nome!',
		 })
         document.frm_Depoimento.NomeCompleto.focus();
         return false;
     }
     if (document.frm_Depoimento.Depoimento.value == ""){
		 Swal.fire({
 		    icon: 'error',
  			title: 'Oops...',
  			text: 'Obrigatorio digitar o Depoimento!',
			
		 })
		 document.frm_Depoimento.Depoimento.focus()
		 return false;
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
   <form class="form-horizontal" name="frm_Depoimento" method="post" action="manu_CadAdmin.asp">

    <div class="form-group">
      <label class="control-label col-sm-2" for="CPF1"><b>CPF:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="CPF" name="CPF" value="<%=CPF%>">
      </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="Nome"><b>Nome Completo:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="NomeCompleto" name="NomeCompleto" value="<%=NomeCompleto%>">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="Email1"><b>Email:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="Email" name="Email" value="<%=Email%>">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="Senha1"><b>Senha:</b></label>
      <div class="col-sm-4">
        <input type="password" class="form-control" id="Senha" name="Senha" value="<%=Senha%>">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="Telefone1"><b>Telefone:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="Telefone" name="Telefone" value="<%=Telefone%>">
      </div>
    </div>
     <%
	call abreConexao
	sql = "Select * from DL_Perfil ORDER BY id_Perfil"
	set rs = conn.execute(sql)
	%>
    <div class="form-group">
      <label class="control-label col-sm-2" for="TipoServico"><b>Tipo do Serviço:</b></label>
      <div class="col-sm-4">
        <select class="form-select shadow-none p-0 border-0 form-control-line" name="TipoPerfil">
            <option value="">--- Selecionar ---</option>
			<%do while not rs.eof%>
        	<option value="<%=rs("id_Perfil")%>" <%if clng(rs("id_Perfil")) = clng(Perfil) then%>selected <%end if%>><%=rs("tipo_perfil")%></option>
            <%
			rs.movenext
			loop
			call fechaConexao
			%>
        </select>
      </div>
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
                    href="">ADAPEC-TO</a>
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