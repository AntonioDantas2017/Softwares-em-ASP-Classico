<!--#include file="inc_login.asp"-->
<!--#include file="inc_tempo.asp"-->
<%
nivel = nivel_contratos
if ((nivel="1")or(nivel="2")) then

else
    Response.Redirect ("default_acessonegado.asp")
end if
nivel_aux = nivel
'nivel_aux = 2
%><%
call abre_conexao01
%>
<!--#include file="inc_css.asp"-->


<html>
<head>
              <script language="JavaScript">
/***
* Descri��o.: formata um campo do formul�rio de
* acordo com a m�scara informada...
* Par�metros: - objForm (o Objeto Form)
* - strField (string contendo o nome
* do textbox)
* - sMask (mascara que define o
* formato que o dado ser� apresentado,
* usando o algarismo "9" para
* definir n�meros e o s�mbolo "!" para
* qualquer caracter...
* - evtKeyPress (evento)
* Uso.......: <input type="textbox"
* name="xxx".....
* onkeypress="return txtBoxFormat(document.rcfDownload, 'str_cep', '99999-999', event);">
* Observa��o: As m�scaras podem ser representadas como os exemplos abaixo:
* CEP -> 99.999-999
* CPF -> 999.999.999-99
* CNPJ -> 99.999.999/9999-99
* Data -> 99/99/9999
* Tel Resid -> (99) 999-9999
* Tel Cel -> (99) 9999-9999
* Processo -> 99.999999999/999-99
* C/C -> 999999-!
* E por a� vai...
***/

function txtBoxFormat(strField, sMask, evtKeyPress) {
    var i, nCount, sValue, fldLen, mskLen,bolMask, sCod, nTecla;

    if(window.event) { // Internet Explorer
      nTecla = evtKeyPress.keyCode; }
    else if(evtKeyPress.which) { // Nestcape / firefox
      nTecla = evtKeyPress.which;
    }
//se for backspace n�o faz nada
if (nTecla != 8){
    sValue = document.getElementById(strField).value;
// alert(sValue);

    // Limpa todos os caracteres de formata��o que
    // j� estiverem no campo.
    sValue = sValue.toString().replace( "-", "" );
    sValue = sValue.toString().replace( "-", "" );
    sValue = sValue.toString().replace( ".", "" );
    sValue = sValue.toString().replace( ".", "" );
    sValue = sValue.toString().replace( ":", "" );
    sValue = sValue.toString().replace( ":", "" );
    sValue = sValue.toString().replace( "/", "" );
    sValue = sValue.toString().replace( "/", "" );
    sValue = sValue.toString().replace( "(", "" );
    sValue = sValue.toString().replace( "(", "" );
    sValue = sValue.toString().replace( ")", "" );
    sValue = sValue.toString().replace( ")", "" );
    sValue = sValue.toString().replace( " ", "" );
    sValue = sValue.toString().replace( " ", "" );
    fldLen = sValue.length;
    mskLen = sMask.length;

    i = 0;
    nCount = 0;
    sCod = "";
    mskLen = fldLen;

    while (i <= mskLen) {
      bolMask = ((sMask.charAt(i) == "-") || (sMask.charAt(i) == ".")  || (sMask.charAt(i) == ":") || (sMask.charAt(i) 

== "/"))
      bolMask = bolMask || ((sMask.charAt(i) == "(") || (sMask.charAt(i) == ")") || (sMask.charAt(i) == " "))

      if (bolMask) {
        sCod += sMask.charAt(i);
        mskLen++; }
      else {
        sCod += sValue.charAt(nCount);
        nCount++;
      }

      i++;
    }

    document.getElementById(strField).value = sCod;

    if (nTecla != 8) { // backspace
      if (sMask.charAt(i-1) == "9") { // apenas n�meros...
        return ((nTecla > 47) && (nTecla < 58)); } // n�meros de 0 a 9
      else { // qualquer caracter...
        return true;
      } }
    else {
      return true;
    }
}//fim do if que verifica se � backspace
}
//Fim da Fun��o M�scaras Gerais
</script>

<title><!--#include file="inc_title.asp"--></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body leftmargin="0" topmargin="00" marginwidth="0" marginheight="0" onLoad="MM_goToURL('parent.frames[\'topFrame\']','sistema2.asp?barra=NEWS');return document.MM_returnValue">
<%
'RESGATA AS VARI�VEIS
'--------------------
pesquisa    = request("pesquisa")
pesquisa2    = request("pesquisa2")
ordem 	 	= request("ordem")
listar      = request("listar")
codfor		= request("codfor")
filtro		= request("filtro")
filtro2		= request("filtro2")
datainicio	= request("datainicio")
datafim		= request("datafim")

codloc    = request("codloc")

set objrs01 = objConn01.execute("select * from locatarios where codloc="&codloc&" ")
if not objrs01.eof then
	nome		= objrs01 ("nome")
	qualificacao	= objrs01 ("qualificacao")
	cpf		= objrs01 ("cpf")
	rg	= objrs01 ("rg")
	contato		= objrs01 ("contato")		
end if

%>
<div align="center"> 
  <table width="200" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td><div align="center"><img src="imagem/img_transp.gif" width="1" height="5"></div></td>
    </tr>
  </table>
  <table width="700" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td width="115"> <table width="115" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td bgcolor="#000000"><table width="100%" height="30" border="0" cellpadding="1" cellspacing="1" CLASS=LINKC>
                <tr> 
                  <td bgcolor="#BBECB1"><div align="center"><strong> LOCAT&Aacute;RIOS</strong></div></td>
                </tr>
              </table></td>
          </tr>
        </table></td>
      <td width="3">&nbsp;</td>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td bgcolor="#000000"><table width="100%" height="30" border="0" cellpadding="1" cellspacing="1">
                <tr> 
                  <td bgcolor="#BBECB1"><div align="center"> 
                      <table width="100%" border="0" cellpadding="0" cellspacing="0" class=linka>
                        <tr> 
                          <td width="30"> <div align="center"><strong><a href="javascript:history.go(-1)"><img src="imagem/icones_volta.gif" alt="Volta &agrave; tela anterior" width="20" height="20" border="0"></a></strong></div></td>
                          <td width="30"><div align="center"><strong><a href="JavaScript: location.reload()"><img src="imagem/icones_atualiza.gif" alt="Atualiza esta tela" width="20" height="20" border="0"></a></strong></div></td>
                          <td width="30"><div align="center"><strong></strong></div></td>
                          <td width="120"> <div align="center"></div></td>
                          <td width="130"> <div align="center"></div></td>
                          <td width="130"> <div align="right"></div></td>
                          <td width="420"><div align="right"></div>
                            <div align="center"></div>
                            <div align="center"><strong> </strong></div>
                            <div align="center"></div>
                            <div align="right"> </div></td>
                        </tr>
                      </table>
                    </div></td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
  </table>
  <br>
  <table width="700" border="0" cellspacing="0" cellpadding="0" class=linka>
    <tr> 
      <td height="13" bgcolor="#CCCCCC"><div align="center"> <strong> ALTERA&Ccedil;&Atilde;O 
          DE LOCAT&Aacute;RIO</strong></div></td>
    </tr>
  </table>
  <table width="700" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td bgcolor="#CCCCCC"><table width="100%" border="0" cellspacing="2" cellpadding="2" CLASS=LINKA>
          <tr> 
            <td bgcolor="#FFFFFF"><div align="center">
                <script language="JavaScript">
function ValidateOrder(form)
{
  if (form.nome.value == "")
  { 
	  alert("Por favor digite o seu Nome"); form.nome.focus(); return; 
  }

  if (form.qualificacao.value == "")
  { 
	  alert("Por favor digite a Qualifica��o"); form.qualificacao.focus(); return; 
  }
  
   if (form.cpf.value == "")
  { 
	  alert("Por favor digite o CPF"); form.cpf.focus(); return; 
  }
  
   if (form.rg.value == "")
  { 
	  alert("Por favor digite o RG"); form.rg.focus(); return; 
  }
  
  form.submit();
}
</script>
                <br>
                <font color="#FF0000" size="2"><strong>( n&atilde;o utilizar os 
                caracteres especiais : &quot; ' &amp; % ( ) &lt; &gt; )</strong></font><br>
				  <form action="locatarios_editar2.asp" method="get" name="form" id="form" >
				    <input name="listar" type="hidden" value="<%=listar%>">
                    <input name="ordem" type="hidden" value="<%=ordem%>">
                    <input name="pesquisa" type="hidden" value="<%=pesquisa%>">
                    <input name="tipo" type="hidden" value="<%=tipo%>">
                    <input name="filtro" type="hidden" value="<%=filtro%>">
                    <input name="pesquisa2" type="hidden" value="<%=pesquisa2%>">
                    <input name="datainicio" type="hidden" value="<%=datainicio%>">
                    <input name="datafim" type="hidden" value="<%=datafim%>">
                    <input name="filtro2" type="hidden" value="<%=filtro2%>">
                    <input name="codloc" type="hidden" value="<%=codloc%>">
                  <strong>OS CAMPOS EM VERMELHO S&Atilde;O DE PREENCHIMENTO OBRIGAT&Oacute;RIO</strong><br>
                  <br>
                  <table width="650" border="0" cellspacing="0" cellpadding="0">
                    <tr valign="top">
                      <td width="100%"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="linkA">
                          <tr>
                            <td bgcolor="#CCCCCC"><strong>NOME</strong></td>
                          </tr>
                          <tr>
                            <td><img src="imagem/img_transp.gif" width="1" height="2"></td>
                          </tr>
                          <tr>
                            <td height="18"><input name="nome" type="text" id="nome" style="FONT-FAMILY: Verdana; FONT-SIZE: 10px; BACKGROUND-COLOR: #FFC4C4" size="60" maxlength="50" value="<%=nome%>">
                              ( max. 50 caract. ) </td>
                          </tr>
                          <tr>
                            <td><img src="imagem/img_transp.gif" width="1" height="2"></td>
                          </tr>
                          <tr>
                            <td><img src="imagem/img_transp.gif" width="1" height="2"></td>
                          </tr>
                          <tr>
                            <td bgcolor="#CCCCCC"><strong>QUALIFICA&Ccedil;&Atilde;O</strong></td>
                          </tr>
                          <tr>
                            <td><img src="imagem/img_transp.gif" width="1" height="2"></td>
                          </tr>
                          <tr>
                            <td height="18"><input name="qualificacao" type="text" id="qualificacao" style="FONT-FAMILY: Verdana; FONT-SIZE: 10px; BACKGROUND-COLOR: #FFC4C4" size="60" maxlength="50" value="<%=qualificacao%>">
                              ( max. 50 caract. ) </td>
                          </tr>
                          <tr>
                            <td><img src="imagem/img_transp.gif" width="1" height="2"></td>
                          </tr>
                          <tr>
                            <td bgcolor="#CCCCCC"><strong>CPF</strong></td>
                          </tr>
                          <tr>
                            <td><img src="imagem/img_transp.gif" width="1" height="2"></td>
                          </tr>
                          <tr>
                            <td height="18"><input name="cpf" type="text" id="cpf" style="FONT-FAMILY: Verdana; FONT-SIZE: 10px; BACKGROUND-COLOR: #FFC4C4" size="20" maxlength="14" value="<%=cpf%>" onKeyPress="return txtBoxFormat('cpf', '999.999.999-99', event);"></td>
                          </tr>
                          <tr>
                            <td bgcolor="#CCCCCC"><strong>RG</strong></td>
                          </tr>
                          <tr>
                            <td><img src="imagem/img_transp.gif" width="1" height="2"></td>
                          </tr>
                          <tr>
                            <td height="18"><input name="rg" type="text" id="rg" style="FONT-FAMILY: Verdana; FONT-SIZE: 10px; BACKGROUND-COLOR: #FFC4C4" size="30" maxlength="20" value="<%=rg%>">
                              ( max. 30 caract. ) </td>
                          </tr>
                          <tr>
                            <td><img src="imagem/img_transp.gif" width="1" height="2"></td>
                          </tr>
                          <tr>
                            <td bgcolor="#CCCCCC"><strong>CONTATO</strong></td>
                          </tr>
                          <tr>
                            <td><img src="imagem/img_transp.gif" width="1" height="2"></td>
                          </tr>
                          <tr>
                            <td height="18"><input name="contato" type="text" id="contato" style="FONT-FAMILY: Verdana; FONT-SIZE: 10px; BACKGROUND-COLOR: #EAEAEA" size="60" maxlength="50" value="<%=contato%>">
                              ( max. 50 caract. ) </td>
                          </tr>
                          <tr>
                            <td height="2"><img src="imagem/img_transp.gif" width="1" height="2"></td>
                          </tr>
                          <tr>
                            <td height="2"><img src="imagem/img_transp.gif" width="1" height="2"></td>
                          </tr>
                      </table></td>
                    </tr>
                  </table>
                  <br>
                  <br>
<input name="Button" TYPE="button" onClick="ValidateOrder(this.form)" VALUE="Confirma" style="FONT-FAMILY: Verdana; FONT-SIZE: 10px; BACKGROUND-COLOR: #EAEAEA">				  
                  <br>
                </form>                
                
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
  <%
call fecha_conexao01
%>  
</div>
</body>
</html>