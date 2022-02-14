<!--#include file ="lib/Conexao.asp"--> 
<%
opc = request("opc")
cod = request.querystring("cod")
%>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="utf-8" />
		<title>Sweet Alert2</title>
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
end if
%>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.2.1/dist/sweetalert2.min.js"></script>

<script>
let status = <%=rs(cod)%>
alert(status);
  Swal.fire(
  'Muito Bem!',
  'Mensagem visualizada com sucesso!',
  'success'
)
parent.location = "cst_caixaentrada.asp"



</script>

    </body>
</html>        