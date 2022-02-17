<br>

<!--#include file ="lib/Conexao.asp"-->
<%

session.LCID = 1046
'RECEBENDO CAMPOS DO FORMUL�RIO
opc          = request.querystring("opc")
botao        =  request.form("botao")
cod          =  request.form("hfcod")
CPF          =  request.form("CPF")
NomeCompleto =  request.form("NomeCompleto")
Email        =  request.form("Email")
Senha        =  request.form("Senha")
Telefone     =  request.form("Telefone")
Perfil       =  request.form("TipoPerfil")
'response.write(cod)
'response.end
if botao = "Incluir" then
' INCLUINDO OS DADOS RECEBIDOS NA TABELA

   call abreConexao
   sql = "insert into DL_CadLogin(CPF, NomeCompleto, Email, Senha, Telefone, id_Perfil)"
   sql = sql & " values('"&CPF&"', '"&NomeCompleto&"', '"&Email&"', '"&Senha&"', '"&Telefone&"', '"&Perfil&"')"
	'response.write sql
	'response.end
    conn.execute(sql)
   call fechaConexao
   response.redirect("cst_CadAdmin.asp?resp=1")
%>
<%
elseif botao = "Alterar" then
' ALTERANDO OS DADOS RECEBIDOS NA TABELA

  call abreConexao
    sql = "update DL_CadLogin set"
    sql = sql & " CPF          = '"&CPF&"',"
    sql = sql & " NomeCompleto = '"&NomeCompleto&"',"
    sql = sql & " Email        = '"&Email       &"',"
    sql = sql & " Senha        = '"&Senha       &"',"
    sql = sql & " Telefone     = '"&Telefone    &"',"
    sql = sql & " id_Perfil    = '"&Perfil&"'"
    sql = sql & " where idLogin = "&cod
    'response.write sql
    'response.end
    conn.execute(sql)
    call fechaConexao
    response.redirect("cst_CadAdmin.asp?resp=4")
%>
<%
elseif opc <> "" then
' DELETANDO REGISTRO SELECIONADO
   cod = request.querystring("cod")
   call abreConexao
   sql = "delete from DL_CadLogin where idLogin="&cod

   conn.execute(sql)
   call fechaConexao
   response.redirect("cst_CadAdmin.asp?resp=3")
%>
<%
end if
%>