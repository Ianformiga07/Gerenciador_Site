<!--#include file ="lib/Conexao.asp"--> 
<%
cod = request.querystring("cod")


if cod = 1 then
call abreConexao
	sql = "UPDATE DL_Contato SET Status = '"&request.Form("status")&"' WHERE idCliente = '"&request.querystring("cod")&"'"
    'response.write sql
    'response.end
	conn.execute(sql)
  call fechaConexao
end if
%>
<script>
  alert("Mensagem enviada com sucesso, em breve entraremos em contato.")
  parent.location = "cst_caixaentrada.asp"
</script>