<!--#include file="inc_login.asp"-->
<!--#include file="inc_tempo.asp"-->
<!--#include file="inc_css.asp"-->

<html>
<head>
<title><!--#include file="inc_title.asp"--></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body leftmargin="0" topmargin="00" marginwidth="0" marginheight="0" >
<div align="center"> 
  <table width="200" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td><div align="center"><img src="imagem/img_transp.gif" width="1" height="5"></div></td>
    </tr>
  </table>
  <table width="700" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td width="155" valign="top"> <table width="150" height="30" border="0" cellpadding="0" cellspacing="0">
          <tr> 
            <td bgcolor="#000000"><table width="100%" height="30" border="0" cellpadding="1" cellspacing="1" CLASS=LINKC>
                <tr> 
                  <td bgcolor="#BBECB1"><div align="center"><strong>AVISOS</strong></div></td>
                </tr>
              </table></td>
          </tr>
        </table></td>
      <td width="795"><table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
          <tr> 
            <td bgcolor="#000000"><table width="100%" height="30" border="0" cellpadding="1" cellspacing="1">
                <tr> 
                  <td bgcolor="#BBECB1"><div align="center"> 
                     <table width="100%" border="0" cellpadding="0" cellspacing="0" class=linka>
                        <tr> 
                          <td width="6%"> <div align="center"><strong> <a class="linkB2" href="javascript:history.go(-1)"><img src="imagem/icones_volta.gif" alt="Volta &agrave; tela anterior" width="20" height="20" border="0"><br>
                          </a></strong></div></td>
                          <td width="6%"><div align="center"><strong> <a class="linkB2"  href="javascript:location.reload()"> 
                              </a></strong><strong><a class="linkB2" href="JavaScript: location.reload()"><br>
                              </a></strong></div></td>
                          <td width="6%"><div align="center">
                              <div align="center">
                                <div align="center"><strong> </strong> </div>
                              </div>
                              </div></td>
                          <td width="6%"> <div align="center"> </div></td>
                          <td width="6%"> <div align="center"><a class="linkB2" href="#" onClick="MM_openBrWindow('sp_grupo.asp','','status=yes,scrollbars=yes,width=600,height=572')"></a></div></td>
                          <td width="6%"> <div align="center"><a class="linkB2" href="#" onClick="MM_openBrWindow('ft_cc_emp.asp','','status=yes,scrollbars=yes,width=600,height=572')"></a></div></td>
                          <td width="6%"> <div align="center"><a class="linkB2" href="#" onClick="MM_openBrWindow('sp_prod_cat.asp','','status=yes,scrollbars=yes,width=600,height=572')"></a> 
                            </div></td>
                          <td width="6%"> <div align="center"></div></td>
                          <td width="6%"><div align="center"></div></td>
                          <td width="6%"><div align="center"></div></td>
                          <td width="6%"><div align="center"></div></td>
                          <td width="6%"><div align="center"></div></td>
                          <td width="6%"><div align="center"></div></td>
                          <td width="6%"><div align="center"></div></td>
                          <td width="16%"><div align="center"></div></td>
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
      <td height="13" bgcolor="#CCCCCC"><div align="center"> <strong>CADASTRO 
          DE MENSAGEM</strong></div></td>
    </tr>
  </table>
  <table width="700" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td><table width="100%" border="0" cellspacing="2" cellpadding="2" CLASS=LINKA>
          <tr> 
            <td><div align="center"><br>
<%
'RESGATA AS VARIÁVEIS
'--------------------
listar	  	= request("listar")
mensagem	= TRIM(Request("mensagem"))
axcod  		= request("axcod")
'codfunc  	= request("codfunc")
data2		= request("data2")
'CADASTRA
'--------

call abre_conexao01
call abre_conexao02

'hora = left(right(time,8),5) 

'data3	= split(date,"/")
'data4		= data3(1) & "/" & data3(0) & "/" & data3(2) 


	sql = "update comunicador set data='"&date&"',hora='"&time&"',codfunc='"&codfunc&"',mensagem='"&mensagem&"'  where cod='"&cod&"' "
	'response.Write(sql) & "<BR>"
	set objrs01 = objConn01.execute(sql) 
	
	sql = "delete from comunicador_func where cod = '"&cod&"'"
	'response.Write(sql)& "<BR>"
	set objrs01 = objConn01.execute(sql)
	
	
set objrs01 = objConn01.execute("select * from funcionarios where codfunc <> '"&codfunc&"' ")
			cont = 0
			while not objrs01.eof

				cod="checkfunc"& objrs01("codfunc")
'			response.Write(cod)				
					if (request(cod) = objrs01("codfunc")) or (request("checktodos") = "T") then
						auxcodfunc = objrs01("codfunc")
						'response.write request(cod) & " : " & auxcodfunc & "<BR>"
						sql = "INSERT INTO comunicador_func (cod,codfunc,lido) values ('"&axcod&"','"&auxcodfunc&"',0) "
'						response.Write(sql)
						set objrs02 = objConn02.execute(sql)
					
					end if
				objrs01.movenext
			wend
							
	
call fecha_conexao01
call fecha_conexao02

%>
                <br>
                <div align="center"></div>
                <div align="center"></div>
                <div align="center"><strong><br>
                  </strong><strong><br>
                  <br>
                  O cadastro foi alterado com sucesso!<br>
                  <br>
                  <br>
                  <br>
                  <br>
                  </strong> </div>
                      
                <strong><a href="fr_mensageiro.asp?listar=<%=listar%>"><img src="IMAGEM/botoes_principal.gif" alt="volta para a p&aacute;gina principal" width="75" height="19" border="0"></a></strong><br>
                <br>
                <br>
                <br>
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
</body>
</html>