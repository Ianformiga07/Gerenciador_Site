<br>

<!--#include file="FuncaoUpload.asp"-->
<!--#include file ="lib/Conexao.asp"-->
<%

session.LCID = 1046
'RECEBENDO CAMPOS DO FORMUL�RIO
opc          = request.querystring("opc")
botao        =  request.form("botao")
cod          =  request.form("hfcod")
NomeCompleto =  request.form("NomeCompleto")
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
   response.redirect("cst_depoimento.asp?resp=1")
%>
<%
elseif botao = "Alterar" then
' ALTERANDO OS DADOS RECEBIDOS NA TABELA

  call abreConexao
    sql = "update DL_Depoimento set"
    sql = sql & " NomeCompleto = '"&NomeCompleto&"',"
    sql = sql & " Depoimento = '"&Depoimento&"'"
    sql = sql & " where id_Depoimento = "&cod
    'response.write sql
    'response.end
    conn.execute(sql)
    call fechaConexao
    response.redirect("cst_depoimento.asp?resp=4")
%>
<%
elseif opc <> "" then
' DELETANDO REGISTRO SELECIONADO
   cod = request.querystring("cod")
   call abreConexao
   sql = "delete from DL_Depoimento where id_Depoimento="&cod

   conn.execute(sql)
   call fechaConexao
   response.redirect("cst_depoimento.asp?resp=3")
%>
<%
end if
%>