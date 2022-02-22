<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../Lib/Conexao.asp"-->
 <link href="assets/vendor/fancybox/fancybox.css" rel="stylesheet">
  <script src="assets/vendor/fancybox/fancybox.js"></script>
<%
'Id
Tipo_Servico = trim(request.form("id"))

call abreConexao
sql = "select * from DL_CadServico where Tipo_Servico = '"&Tipo_Servico&"'"
set rs = conn.execute(sql)

if (not rs.Eof) then
    while not rs.EOF
        %>
        <a href="<%=URL%>/Upload/<%=rs("Anexo")%>" class="fancybox-buttons fancybox-imagens" data-fancybox-group="button">                                
            <img src="<%=URL%>/Upload/<%=rs("Anexo")%>" title="" alt="">
        </a>
        <%
    rs.movenext
    wend
end if

call fechaConexao
%>