<!--#include file ="lib/Conexao.asp"-->
<%

cod = Request.QueryString("cod")
opc = request.querystring("opc")
exc  = Request.QueryString("exc")
if opc <> "" then

   cod = request.querystring("cod")

   call abreConexao
   sql = "delete from DL_CadServico where id_CadServico="&cod

   conn.execute(sql)
   call fechaConexao
    response.redirect("cst_servico.asp?resp=3")
%>
<%
end if
%>