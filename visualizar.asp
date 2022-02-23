<!--#include file ="lib/Conexao.asp"--> 
<%
opc = request("opc")
cod = request.querystring("cod")
%>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="utf-8" />
		<title>Visualiza</title>
		<link rel="canonical" href="#" />
		<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.2.1/dist/sweetalert2.min.css" rel="stylesheet" type="text/css" />
	</head>

	<body>

<%
if opc = 1 then
call abreConexao
	sql = "UPDATE DL_Contato SET status = 1 WHERE idCliente = '"&request.querystring("cod")&"'"
    'response.write sql
    'response.end
	conn.execute(sql)
  call fechaConexao
  Response.Redirect("cst_caixaentrada.asp?resp=1")
end if
%>

<script>

</script>

    </body>
</html>        