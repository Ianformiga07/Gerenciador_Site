<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file ="lib/Conexao.asp"-->
<!--#include file ="base.asp"-->  
<!DOCTYPE html>
<%
if Session("CPF_Usu") = "" then
response.Write("<script>")
response.Write("alert('O Usuáio não está logado!');")
response.Write("window.location.assign('login.asp')")
response.Write("</script>")
end if

Existe = 0
call abreConexao
sql = "select * from DL_Depoimento"
set rs = conn.execute(sql)


%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.2.1/dist/sweetalert2.min.js"></script>
 <script>
var url_string = window.location.href;
var url = new URL(url_string);
var resp = url.searchParams.get("resp");

function Excluir(cod)
   {
Swal.fire({
  title: 'Deseja continuar?',
    text: "O usuário será desativado e não será mais listado no sistema!",
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',    
    cancelButtonText: 'Cancelar',
    confirmButtonText: 'Sim, prosseguir!'
  }).then((result) => {
    if (result.value) {
        window.location="manu_depoimento.asp?opc=exc&cod=" + cod ;
    }
  })
  }

mensagem(resp)
function mensagem(resp){
if(resp == 1){
	Swal.fire(
  'Otimo',
  'Arquivo Cadastrado com Sucesso!',
  'success'
)
}
else
if(resp == 2){
	Swal.fire(
  'Erro',
  'Tamanho do Arquivo Excedido!',
  'error'
)
}
else
if(resp == 3){
	Swal.fire(
  'Otimo',
  'Arquivo Excluído com Sucesso!',
  'success'
)
}
else
if(resp == 4){
	Swal.fire(
  'Otimo',
  'Arquivo Alterado com Sucesso!',
  'success'
)
}
}
 </script>

<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords">
       
</head>

<body>
        <div class="page-wrapper" style="min-height: 250px;">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb bg-white">
                <div class="row align-items-center">
                </div>
                <!-- /.col-lg-12 -->
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
							
	
<div class="container">
<form action="frm_depoimento.asp" method=post>
<button type="submit" class="btn btn-outline-dark btn-icon-split">Adicionar</button>

  <div class="table-responsive">          
  <table class="table">
    <thead>
      <%if rs.eof then%>
  <tr><td>Não Existe Nenhum Registro na base de Dados!</td></tr>
  <%else%>
      <tr>
        <th>#</th>
        <th>Nome Completo</th>
        <th>Depoimento</th>
        <th>#</th>		
      </tr>
    </thead>
    <tbody>
<%
do while not rs.eof
%>
      <tr>
        <td>
 <a href="frm_depoimento.asp?evt=alt&cod=<%=rs("id_Depoimento")%>">
 <img src="imagens/alt3.png" width="30">
        </a>		
		</td>
        <td><%=rs("NomeCompleto")%></td>
        <td><%=rs("Depoimento")%></td>
        <td>
          <td> <a href="javascript:Excluir(<%=rs("id_Depoimento")%>)">
 <img src="imagens/excluir.png" width="30">
        </a></td>

      </tr>
	  <%

rs.movenext
loop
end if
call fechaConexao

%>
    </tbody>
  </table>

  </div>


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
</body>

</html>