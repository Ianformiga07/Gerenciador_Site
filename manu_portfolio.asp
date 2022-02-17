<br>

<!--#include file="FuncaoUpload.asp"-->
<!--#include file ="lib/Conexao.asp"-->
<%

Function ZerosEsquerda(Num,tam)
	Dim Zero
	Num = Trim(Num)
	Zero = ""
	For i = Len(Num) To tam - 1
	    Zero = "0" & Zero
	Next
	ZerosEsquerda = Trim(Zero & Num)
End Function
   'response.write request.querystring("cod")
   'response.end
' Chamando Fun��es, que fazem o Upload funcionar
byteCount = Request.TotalBytes
on Error Resume Next
RequestBin = Request.BinaryRead(byteCount)
Set UploadRequest = CreateObject("Scripting.Dictionary")
BuildUploadRequest RequestBin
if Err.number <> 0 then
response.redirect("cst_portfolio.asp?resp=2")
end if

'RECEBENDO DADOS DOS FORMUL�RIOS
			'response.write(UploadRequest.Item("NomePortfolio").Item("Value"))
			'response.end

'cod          = UploadRequest.Item("hfcod").Item("Value")
 opc           = request.querystring("opc")
 cod           = UploadRequest.Item("hfcod").Item("Value")
 botao         = UploadRequest.Item("Botao").Item("Value")
 NomePortfolio = UploadRequest.Item("NomePortfolio").Item("Value")
 anexo         = UploadRequest.Item("anexo").Item("Value")
		'response.write(NomeServico)
		'response.end
'
'La�o que efetua toda operacao do anexo.
'
	' Recuperando os Dados Digitados ----------------------

	caminho     = UploadRequest.Item("anexo").Item("FileName")
	nome        =  Right(caminho,Len(caminho)-InstrRev(caminho,"\"))
	arquivo     = UploadRequest.Item("anexo").Item("Value")
'TESTANDO SE FOI SELECIONADO ALGUM ARQUIVO E 
	if trim(arquivo) <> "" then
        pasta = Server.MapPath("upload/")
        arq = year(date)&month(date)&day(date)&hour(now)&minute(now)&second(now)&"."&right(nome,3)

		nome_arquivo = arq
		nome_arquivo = "/"&nome_arquivo
		'Response.Write x & "<br>"
		if x = 1 then
			arquivo = arq
			
		else
			arquivo = arquivo & "�" & arq
		end if
		Set ScriptObject = Server.CreateObject("Scripting.FileSystemObject")
		Set MyFile = ScriptObject.CreateTextFile(pasta & nome_arquivo)
		'Response.Write x & "-"& nome_arquivo & "<br>"
		For i = 1 to LenB(arquivo)
		MyFile.Write chr(AscB(MidB(arquivo,i,1)))
		Next
		MyFile.Close
		arquivo = ""
	end if

	'response.write(arq)
	'response.end
session.LCID = 1046



if botao = "Incluir" then

   call abreConexao
   sql = "insert into DL_CadPortfolio(nome, AnexoPortfolio)"
   sql = sql & " values('"&NomePortfolio&"', '"&arq&"')"
	'response.write sql
	'response.end
    conn.execute(sql)
   call fechaConexao
   response.redirect("cst_portfolio.asp?resp=1")
%>
<%

elseif botao = "Alterar" then

 call abreConexao
  sql = "update DL_CadPortfolio set"
  sql = sql & " nome = '"&NomePortfolio&"',"
  sql = sql & " AnexoPortfolio = '"&arq&"'"
  sql = sql & " where id_CadPortfolio = "&cod
   'response.write sql
   'response.end
  conn.execute(sql)
  call fechaConexao
  response.redirect("cst_portfolio.asp?resp=4")
%>
<%

elseif opc = "exc" then

   cod = request.querystring("cod")


   call abreConexao
   sql = "delete from DL_CadServico where id_CadServico="&cod

   conn.execute(sql)
   call fechaConexao
%>
<script>
    alert("Linha excluída com sucesso!")
    parent.location = "cst_servico.asp"
</script>
<%
end if
%>