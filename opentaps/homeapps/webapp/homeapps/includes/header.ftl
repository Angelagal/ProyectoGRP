<#--
 * Copyright (c) Open Source Strategies, Inc.
 * 
 * Opentaps is free software: you can redistribute it and/or modify it
 * under the terms of the GNU Affero General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Opentaps is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with Opentaps.  If not, see <http://www.gnu.org/licenses/>.
-->
<#--/* @author: Michele Orru' (michele.orru@integratingweb.com) */-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="shortcut icon" href="<@ofbizContentUrl>/opentaps_images/favicon.ico</@ofbizContentUrl>">
	
<#if userLogin?exists>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
	 <#-- TODO: find the way to import CSS from css component folder
	  For now we are getting CSS from the opentaps_css directory inside opentaps-common.
	 -->
	
	<link rel="stylesheet" href="/opentaps_css/opentaps-packed.css" type="text/css"/>
	<link href="/opentaps_css/integratingweb/opentaps.css" rel="stylesheet" type="text/css" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	
	
	    <script type="text/javascript">
	        function writeAppDetails(appId, appName, appDescr){
	            var id = document.getElementById('appId');
	            var name = document.getElementById('appName');
	            var description = document.getElementById('appDescr');
	
	            id.innerHTML = appId;
	            name.innerHTML = appName;
	            description.innerHTML = appDescr;
	        }
	
	        function forgotPasswd(){
	            //if the errorDiv is present, increase the heigth of the container
	            if(document.getElementById('errorDiv')){
	               document.getElementById('container').style.height='540px';
	               document.getElementById('form').style.height='380px';
	            }
	
	            var forgotPasswdForm = document.getElementById('forgotpasswd');
	            forgotPasswdForm.style.display='block';
	        }
	    </script>
	
	
	<title>${uiLabelMap.OpentapsProductName}</title>
	</head>
	
	

	<body>
	<div id="top">
			
			<img id="imgagen" src="<@ofbizContentUrl>${configProperties.get("opentaps.header")}</@ofbizContentUrl>" /></div>
	</div>
	<div id="top2">
		<p id="appName">${uiLabelMap.OpentapsProductName}</p>
		<img id="imagenLogin" src="<@ofbizContentUrl>${configProperties.get("opentaps.logoLogin")}</@ofbizContentUrl>" /></div>
	</div>

<style>
		.imgagen{
			margin-top:30px;
		}
		#top{
		background-color:#10312B; 
		height:72px;
		display:flex;
		}
		#top2{
		background-color:#235B4E; 
		height:100px;
		width:100%;
		display:flex;
		}
		#imgagen{
			justify-self:center;
	 		width:350px; 
			height:50px; 
			align:center;
		}
		#appName{
			
			display:flex;
			justify-content:center;
			color:white;
			margin-left:50%;
			font-size:18px;
			font-size: x-large;
			justify-content: center;
		}
		
		#imagenLogin{
		justify-content:center;
		max-width: 200px;
	    align-self: center;
		}

		
		#wrapper{
			position: fixed;
			margin-top:5%;
			margin-left:4%;
			width:100% !important;
			position:realative;
			display:flex;
		}
		#form{
			margin-right:50px;
			padding:5px;
			border-right: dotted;
			
		}
		.modeulos{
			float:right;
			position:realative;
			display:flex;
		}
		#label{
			text-align:center;
			width:50%;
		}

		#texto a{
			text-decoration:none;
			font-family:sans-serif;
			text-align:center;
			font-size:14px;
		}
		#texto a:hover{
			color: #235B4E;
		}
		
		#footer{
			background-color: #235B4E;
  			position: absolute;
  			bottom: 0;
  			width: 100%;
  			height: 55px;
		}
		.decorativeSubmit:hover{
			background-color:#9F2241 !important;
			
		}
		#row{
			margin:0px !important;
		}
		#button{
			width:200px;
		}
		</style>
</#if>





