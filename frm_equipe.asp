<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file ="lib/Conexao.asp"--> 
<!--#include file ="base.asp"-->

<%

cod = Request.QueryString("cod")
evt  = Request.QueryString("evt")
anexo         =  Request.Form("AnexoPortfolio")
Nome  =  Request.Form("nome")
call abreConexao
if cod <> "" then
   cod = cint(cod)
end if
if ucase(evt) = "ALT" then
   
   sql = "SELECT * FROM DL_CadEquipe where id_equipe = "&cod

   set rs = conn.execute(sql)
Nome          =  rs("NomeCompleto")
Cargo         =  rs("Cargo")
anexo         =  rs("AnexoFoto")
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
   <form class="form-horizontal" name="frm_Equipe" action="manu_equipe.asp" method="post" enctype="multipart/form-data">

    <div class="form-group">
      <label class="control-label col-sm-2" for="Nomefoto"><b>Nome Completo:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="NomeCompleto" name="NomeCompleto" value="<%=Nome%>">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="Cargo01"><b>Cargo:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="Cargo" name="Cargo" value="<%=Cargo%>">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="anexo01"><b>Anexo:</b></label>
      <div class="col-sm-4">
        <input type="file" class="form-control" id="anexo" name="anexo" value="<%=anexo%>">
    </div>
       </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-primary" name="Botao" value="<%=bot%>"><%=bot%></button>
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