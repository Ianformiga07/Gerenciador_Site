<br>

<!--#include file="FuncaoUpload.asp"-->
<!--#include file ="lib/Conexao.asp"-->
<%

session.LCID = 1046
'RECEBENDO CAMPOS DO FORMUL�RIO
opc          = request.querystring("opc")
botao        =  request.form("botao")
cod          =  request.form("hfcod")
NomeCompleto         =  request.form("NomeCompleto")
Depoimento   =  request.form("Depoimento")
'response.write(cod)
'response.end
if botao = "Incluir" then
' INCLUINDO OS DADOS RECEBIDOS NA TABELA

   call abreConexao
   sql = "insert into DL_Depoimento(NomeCompleto, Depoimento)"
   sql = sql & " values('"&NomeCompleto&"', '"&Depoimento&"')"
	'response.write sql
	'response.end
    conn.execute(sql)
   call fechaConexao
%>
<script>
    alert("Dados incluido com sucesso!")
    parent.location = "cst_depoimento.asp"
</script>
<%
elseif botao = "Alterar" then
' ALTERANDO OS DADOS RECEBIDOS NA TABELA

  call abreConexao
    sql = "update AU_Curso set"
    sql = sql & " NomeCompleto = '"&NomeCompleto&"',"
    sql = sql & " Depoimento = '"&Depoimento&"'"
    sql = sql & " where id_Depoimento = "&cod
    response.write sql
    response.end
    conn.execute(sql)
    call fechaConexao
%>
<script>
    alert("Dados alterado com sucesso!")
    parent.location = "cst_depoimento.asp"
</script>
<%
elseif opc <> "" then
' DELETANDO REGISTRO SELECIONADO
'   cod = request.querystring("cod")
'   sql = "delete from TABELA where CODIGO="&cod
'  response.write sql
'  response.end
'   conexao.execute(sql)
%>
<script>
    alert("Linha exclu�da com sucesso!")
    parent.location = "cst_modelo.asp"
</script>
<%
end if
%>