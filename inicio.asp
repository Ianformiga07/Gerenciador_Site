<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file ="base.asp"-->
<!--#include file ="lib/Conexao.asp"--> 

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords">
   
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb bg-white">
                <div class="row align-items-center">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">Home</h4>
                    </div>
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
                <%
				call abreConexao
				sql = "select count(*) as qtd_Equipe from DL_CadEquipe;"
				set rs = conn.execute(sql)
				%>
                <div class="row justify-content-center">
                    <div class="col-lg-4 col-md-12">
                        <div class="white-box analytics-info">
                            <h3 class="box-title">Equipe</h3>
                            <ul class="list-inline two-part d-flex align-items-center mb-0">
                                <i aria-hidden="true"><img src="imagens/usuario.png" width="40"></i>
                                <li class="ms-auto"><span class="counter text-success"><%=rs("qtd_Equipe")%></span></li>
                               <%call fechaConexao%>
                            </ul>
                        </div>
                    </div>
                    <%
					call abreConexao
					sql = "select count(*) as qtd_servicos from DL_CadServico;"
					set rs = conn.execute(sql)
					%>                    
                    <div class="col-lg-4 col-md-12">
                        <div class="white-box analytics-info">
                            <h3 class="box-title">Serviços</h3>
                            <ul class="list-inline two-part d-flex align-items-center mb-0">
                                <li>
                                    <img src="imagens/curso.png" width="40">
                                </li>
                                <li class="ms-auto"><span class="counter text-purple"><%=rs("qtd_servicos")%></span></li>
                                <%call fechaConexao%>
                            </ul>
                        </div>
                    </div>
                    <%
					call abreConexao
					sql = "select count(*) as qtd_msg from DL_CadServico;"
					set rs = conn.execute(sql)
					%>               
                    <div class="col-lg-4 col-md-12">
                        <div class="white-box analytics-info">
                            <h3 class="box-title">Caixa de entrada</h3>
                            <ul class="list-inline two-part d-flex align-items-center mb-0">
                                <li>
                                    <img src="imagens/caixa.png" width="40">
                                </li>
                                <li class="ms-auto"><span class="counter text-info"><%=rs("qtd_msg")%></span>
                                </li>
                              <%call fechaConexao%>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- PRODUCTS YEARLY SALES -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                        
                    </div>
                </div>
<div class="container-fluid">
   
                <!-- ============================================================== -->
                <!-- Recent Comments -->
                <!-- ============================================================== -->
                <div class="row">
                    <!-- .col -->
                    <div class="col-md-20 col-lg-15 col-sm-20">
                        <div class="card white-box p-0">
                            <div class="card-body">
                                <h3 class="box-title mb-0">Gerenciador Site D'LAURAS</h3>
                            </div>
                            <div class="comment-widgets">
                                <!-- Comment Row -->
<div class="col-lg-10">
  <!-- Dropdown Basics -->
  <div class="card mb-4">
    <div class="card-body text-center">
      <h4>Seja bem-vindo ao Gerenciador do Site D'LAURAS. Aqui você pode definir todas funcionalidades do site, tais como inserir, alterar e excluir
      informações nos modulos determinados.</h4>
      <h4>Clique no botão abaixo para visualizar as mensagens recentes.</h4>
      <a href="cst_caixaentrada.asp" class="btn btn-outline-dark btn-icon-split">
        <span class="icon text-red-50">
          <i class="fas fa-flag"></i>
        </span>
        <span class="text">Selecionar Caixa de Entrada</span>
      </a>
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
                <!-- ============================================================== -->
                <!-- Recent Comments -->
                <!-- ============================================================== -->
                <div class="row">
                    <!-- .col -->
                    
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        
                    </div>
                    <!-- /.col -->
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer text-center"> 2021 © <a
                    href="https://www.wrappixel.com/">D'LAURAS MÓVEIS</a>
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
