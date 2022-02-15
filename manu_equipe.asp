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
RequestBin = Request.BinaryRead(byteCount)
Set UploadRequest = CreateObject("Scripting.Dictionary")
BuildUploadRequest RequestBin

'RECEBENDO DADOS DOS FORMUL�RIOS
			'response.write(UploadRequest.Item("hfcod").Item("Value"))
			'response.end

'cod          = UploadRequest.Item("hfcod").Item("Value")
 opc           = request.querystring("opc")
 cod           = UploadRequest.Item("hfcod").Item("Value")
 botao         = UploadRequest.Item("Botao").Item("Value")
 NomeCompleto  = UploadRequest.Item("NomeCompleto").Item("Value")
 Cargo         = UploadRequest.Item("Cargo").Item("Value")
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
   sql = "insert into DL_CadEquipe(NomeCompleto, Cargo, AnexoFoto)"
   sql = sql & " values('"&NomeCompleto&"', '"&Cargo&"','"&arq&"')"
	'response.write sql
	'response.end
    conn.execute(sql)
   call fechaConexao
%>
<script>
    alert("Dados incluído com sucesso!")
    parent.location = "cst_equipe.asp"
</script>
<%

elseif botao = "Alterar" then

 call abreConexao
  sql = "update DL_CadEquipe set"
  sql = sql & " NomeCompleto = '"&NomeCompleto&"',"
  sql = sql & " Cargo = '"&Cargo&"',"
  sql = sql & " AnexoFoto = '"&arq&"'"
  sql = sql & " where id_equipe = "&cod
   'response.write sql
   'response.end
  conn.execute(sql)
  call fechaConexao
%>
<script>
    alert("Dados alterado com sucesso!")
    parent.location = "cst_equipe.asp"
</script>
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