<!--#include file ="lib/Conexao.asp"--> 
<%


'recebendo os parametros enviado pelo form atrav�s do Request.form


nome     = request.form("nome")
email    = request.form("email")
assunto  = request.form("assunto")
Telefone = request.form("Telefone")
mensagem = request.form("mensagem")
'RESPONSE.write nome
'RESPONSE.END
'inserir no bando de dados atrav�s do INSERT
call abreConexao
sql = "insert into DL_Contato (NomeCliente, EmailCliente, Assunto, Telefone, Mensagem, DataContato) values ('"&nome&"','"&email&"','"&assunto&"', '"&Telefone&"','"&mensagem&"', getdate())"
response.write sql
response.end
'response.write sql
'response.end
conn.execute(sql)

' enviar mensagem e redirecionar para a index
call fechaConexao
%>
<script>
  alert("Mensagem enviada com sucesso, em breve entraremos em contato.")
  parent.location = "index.asp"
</script>