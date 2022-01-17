<!--#include file ="lib/Conexao.asp"-->
<%

cod = Request.QueryString("cod")
opc = request.querystring("opc")
exc  = Request.QueryString("exc")
if opc <> "" then

   cod = request.querystring("cod")

   call abreConexao
   sql = "delete from DL_CadPortfolio where id_Cadportfolio="&cod

   conn.execute(sql)
   call fechaConexao
%>
<script>
    alert("Linha excluída com sucesso!")
    parent.location = "cst_portfolio.asp"
</script>
<%
end if
%>