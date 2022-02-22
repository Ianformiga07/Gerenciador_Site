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
%>

<!DOCTYPE html>
<!-- Modal -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.2.1/dist/sweetalert2.min.js"></script>
<script>
var url_string = window.location.href;
var url = new URL(url_string);
var resp = url.searchParams.get("resp");

function visualizar(cod)
{
  window.location="mensagem.asp?cod=" + cod ;
}

mensagem(resp)
function mensagem(resp){
if(resp == 1){
	Swal.fire(
  'Otimo',
  'Mensagem visualizada com Sucesso!',
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
<form name="frm_servico" method=post>
<%
' TESTANDO SE EXISTE MENSAGEM NA TABELA DE CONTATO
call abreConexao
sql = "select idCliente, NomeCliente, EmailCliente, telefone, FORMAT (DataContato, 'dd/MM/yyyy ') as DataContato, status as statusUsuario from DL_Contato order by idCliente DESC"
set rs = conn.execute(sql)

%>
  <div class="table-responsive">          
  <table class="table">
    <thead>
      <%if rs.eof then%>
  <tr><td>Não Existe Nenhum Registro na base de Dados!</td></tr>
  <%else%>
      <tr>
        <th><b>#</b></th>
        <th><b>Nome do Cliente</b></th>
        <th><b>EmailCliente</b></th>
        <th><b>telefone</b></th>
        <th><b>Data da mensagem</b></th>
        <th><b>Status</b></th>
        <th><b>#</b></th>		
      </tr>
    </thead>
    <tbody>
<%
do while not rs.eof
%>
      <tr>
        <td>
 <img src="imagens/alt2.png" width="40">
        </a>		
		</td>
        <td><%=rs("NomeCliente")%></td>
        <td><%=rs("EmailCliente")%></td>
        <td><%=rs("telefone")%></td>
        <td><%=rs("DataContato")%></td>
        <td><% if rs("statusUsuario") = true then %>
          <font color="#009933"> Visualizado </font>
          <%ELSE%>
          <font color="#FF0000"> Não Visualizado </font>
          <%end if%>          
        </td>
          <td> <a href="javascript:visualizar(<%=rs("idCliente")%>)">
 <img src="imagens/visualizar.png" width="30">
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