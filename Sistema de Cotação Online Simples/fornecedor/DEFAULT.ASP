<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">

<!--#include file="inc_conexao.asp"-->
<!--#include file="inc_css.asp"-->

<html>
<head>
<title><!--#include file="inc_title.asp"--></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<script language="JavaScript" type="text/JavaScript">
<!--
	



	//rotina para fechar a tela que abre esta
	var wName = window.name;
	if (wName != "teste")
	{
		window.name = "teste";
	}
	
    try
    {
	    if (opener) 
		{
			opener.opener = opener; 
			opener.close(); 
		}
	}
	catch(err)
	{
		//Do nothing
	}
	
	
	//rotina que pega a resolu��o do usu�rio e redimenciona a tela
	/*
	if (screen.width == "720")
	{
		location.href = 'default3.asp'
	} 
	if (screen.width == "640")
	{
		location.href = 'default3.asp'
	} 
	
	if (screen.width == "800")
	{
		location.href = 'default3.asp'
	} 
	if (screen.width == "1024")
	{
		if (top.frames.length!=0)
			top.location=self.document.location;
		self.moveTo(0,0);
		self.resizeTo(screen.availWidth,screen.availHeight);
	} 
	else
	{
		window.resizeTo(1024,740);
		self.moveTo(0,0);
	}*/


	if (screen.width == "720")
	{
		if (top.frames.length!=0)
			top.location=self.document.location;
		self.moveTo(0,0);
		self.resizeTo(screen.availWidth,screen.availHeight);
	} 
	else
	{
		window.resizeTo(720,640);
		self.moveTo(0,0);
	}	 
	if (screen.width == "640")
	{
		if (top.frames.length!=0)
			top.location=self.document.location;
		self.moveTo(0,0);
		self.resizeTo(screen.availWidth,screen.availHeight);
	} 
	else
	{
		window.resizeTo(640,480);
		self.moveTo(0,0);
	}	 
	
	if (screen.width == "800")
	{
		if (top.frames.length!=0)
			top.location=self.document.location;
		self.moveTo(0,0);
		self.resizeTo(screen.availWidth,screen.availHeight);
	} 
	else
	{
		window.resizeTo(800,600);
		self.moveTo(0,0);
	}	 
	if (screen.width == "1024")
	{
		if (top.frames.length!=0)
			top.location=self.document.location;
		self.moveTo(0,0);
		self.resizeTo(screen.availWidth,screen.availHeight);
	} 
	else
	{
		window.resizeTo(1024,740);
		self.moveTo(0,0);
	}	
//-->
</script>

<frameset rows="80,*" frameborder="NO" border="0" framespacing="0">
  <frame src="default-topo.asp?primeira=sim" name="topFrame" frameborder="no" scrolling="NO" noresize >
  <frame src="fornecedores.asp" name="mainFrame" frameborder="no" scrolling="yes">
</frameset>

<noframes>
<body>

</body>
</noframes>

</html>
