<%
'cod           = request.querystring("cod")
'response.write cod
'response.end
%>
<!DOCTYPE html>
<html dir="ltr" lang="en">
<!--#include file ="base.asp"-->
<!--#include file ="lib/Conexao.asp"--> 
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords"
        content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Ample lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Ample admin lite dashboard bootstrap 5 dashboard template">
    <meta name="description"
        content="Ample Admin Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
    <meta name="robots" content="noindex,nofollow">
    <title>D'LAURAS</title>
    <link rel="canonical" href="https://www.wrappixel.com/templates/ample-admin-lite/" />
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="plugins/images/favicon.png">
    <!-- Custom CSS -->
    <link href="plugins/bower_components/chartist/dist/chartist.min.css" rel="stylesheet">
    <link rel="stylesheet" href="plugins/bower_components/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.css">
    <!-- Custom CSS -->
    <link href="css/style.min.css" rel="stylesheet">
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
                <!-- Recent Comments -->
                <!-- ============================================================== -->
<%
cod           = request.querystring("cod")
' TESTANDO SE EXISTE MENSAGEM NA TABELA DE CONTATO
call abreConexao
sql = "select NomeCliente, EmailCliente, telefone, FORMAT (DataContato, 'dd/MM/yyyy ') as DataContato, Assunto, Mensagem from DL_Contato where idCliente = '"&(cod)&"'"
set rs = conn.execute(sql)

%>
                <div class="row">
                    <!-- .col -->
                    <div class="col-md-17 col-lg-12 col-sm-17">
                        <div class="card white-box p-0">
                            <div class="card-body">
                                <h3 class="box-title mb-0">Caixa de Entrada</h3>
                            </div>
                            <div class="comment-widgets">
                                <!-- Comment Row -->
                                <div class="d-flex flex-row comment-row p-3 mt-0">
                                    <div class="p-2"><img src="imagens/alt2.png" alt="user" width="50" class="rounded-circle"></div>
                                    <div class="comment-text ps-2 ps-md-3 w-100">
                                    <%if rs.eof then%>
                                    <span class="mb-3 d-block font-1px">Não Existe Nenhum Registro na base de Dados!</span>
                                    <%else
                                    do while not rs.eof
                                    %>
                                        <h4 class="font-medium">Nome Completo:</h4>
                                        <span class="mb-3 d-block font-1px"><%=rs("NomeCliente")%></span>
                                        <h4 class="font-medium">E-mail:</h4>
                                        <span class="mb-3 d-block"><%=rs("EmailCliente")%></span>
                                        <h4 class="font-medium">Telefone:</h4>
                                        <span class="mb-3 d-block"><%=rs("telefone")%></span>
                                        <h4 class="font-medium">Descrição:</h4>
                                        <span class="mb-3 d-block"><%=rs("Assunto")%></span>
                                        <h4 class="font-medium">Mensagem:</h4>
                                        <textarea id="w3review" name="w3review" rows="5" cols="70"><%=rs("Mensagem")%></textarea>                                                                                                                        
                                            <div class="text-muted fs-2 ms-auto mt-2 mt-md-0">03/02/2022</div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Comment Row -->
                                 </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
             </div>
                    
<%
rs.movenext
loop
end if
call fechaConexao
%>                  
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer text-center"> 2021 © Ample Admin brought to you by <a
                    href="https://www.wrappixel.com/">wrappixel.com</a>
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
    <script src="plugins/bower_components/jquery-sparkline/jquery.sparkline.min.js"></script>
    <!--Wave Effects -->
    <script src="js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="js/custom.js"></script>
    <!--This page JavaScript -->
    <!--chartis chart-->
    <script src="plugins/bower_components/chartist/dist/chartist.min.js"></script>
    <script src="plugins/bower_components/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
    <script src="js/pages/dashboards/dashboard1.js"></script>
</body>

</html>