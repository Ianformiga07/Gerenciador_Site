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
'inserir no bando de dados através do INSERT
call abreConexao
sql = "insert into DL_Contato (NomeCliente, EmailCliente, Assunto, Telefone, Mensagem, DataContato, status) values ('"&nome&"','"&email&"','"&assunto&"', '"&replace(replace(replace(replace((Telefone),"(",""),")",""),"-", ""), " ", "")&"','"&mensagem&"', getdate(), 0)"
'response.write sql
'response.end
'response.write sql
'response.end
conn.execute(sql)

' enviar mensagem e redirecionar para a index
call fechaConexao
response.Redirect("index.asp?resp=1")
%>
<script>

</script>