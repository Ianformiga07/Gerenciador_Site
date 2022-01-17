<!--#include file ="lib/Conexao.asp"-->
<%

cod = Request.QueryString("cod")
opc = request.querystring("opc")
exc  = Request.QueryString("exc")
if opc <> "" then

   cod = request.querystring("cod")

   call abreConexao
   sql = "delete from DL_CadEquipe where id_equipe="&cod

   conn.execute(sql)
   call fechaConexao
%>
<script>
    alert("Linha excluída com sucesso!")
    parent.location = "cst_equipe.asp"
</script>
<%
end if
%>