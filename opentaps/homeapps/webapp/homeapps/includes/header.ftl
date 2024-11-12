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
	<#if userLogin?exists>
			<style type="text/css">
				#logo {
					height: 90px !important;
				}
			</style>
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
				<meta name="viewport" content="width=device-witdh, initial-scale=1.0"/>
				<#-- TODO: find the way to import CSS from css component folder
				For now we are getting CSS from the opentaps_css directory inside opentaps-common. -->
				<link rel="stylesheet" href="/opentaps_css/opentaps-packed.css" type="text/css"/>
				<link href="/opentaps_css/integratingweb/opentaps.css" rel="stylesheet" type="text/css" />
				<link rel="shortcut icon" href="<@ofbizContentUrl>/opentaps_images/favicon.ico</@ofbizContentUrl>">
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
			<div id="container">
					<div id="header">
						<div id="logo">
							<img id="logo-img" src="/opentaps_images/opentaps_logo.png" />
						</div>
						<div id="logo-header">
							<img id="imagenLogin" src="/opentaps_images/BienestarLogo.png" /></div>
						</div>
						<div id="title">
							<div id="contenedor">
				<input type="checkbox" id="menu-check">
				<label id="menu" for="menu-check">
					<span id="menu-abrir">&#9776;</span>
					<span id="menu-cerrar">X</span>
				</label>
				<nav>
					<ul>
						<li>
							<svg xmlns="http://www.w3.org/2000/svg" height="30px" viewBox="0 -960 960 960" width="30px" fill="#e8eaed"><path d="M240-200h120v-240h240v240h120v-360L480-740 240-560v360Zm-80 80v-480l320-240 320 240v480H520v-240h-80v240H160Zm320-350Z"/></svg>
							<a href="/control/login<#if externalKeyParam?exists>?${externalKeyParam}</#if>">Inicio</a>
						</li>
						<li>
							<svg xmlns="http://www.w3.org/2000/svg" height="30px" viewBox="0 -960 960 960" width="30px" fill="#e8eaed"><path d="M480-40q-112 0-206-51T120-227v107H40v-240h240v80h-99q48 72 126.5 116T480-120q75 0 140.5-28.5t114-77q48.5-48.5 77-114T840-480h80q0 91-34.5 171T791-169q-60 60-140 94.5T480-40Zm-36-160v-52q-47-11-76.5-40.5T324-370l66-26q12 41 37.5 61.5T486-314q33 0 56.5-15.5T566-378q0-29-24.5-47T454-466q-59-21-86.5-50T340-592q0-41 28.5-74.5T446-710v-50h70v50q36 3 65.5 29t40.5 61l-64 26q-8-23-26-38.5T482-648q-35 0-53.5 15T410-592q0 26 23 41t83 35q72 26 96 61t24 77q0 29-10 51t-26.5 37.5Q583-274 561-264.5T514-250v50h-70ZM40-480q0-91 34.5-171T169-791q60-60 140-94.5T480-920q112 0 206 51t154 136v-107h80v240H680v-80h99q-48-72-126.5-116T480-840q-75 0-140.5 28.5t-114 77q-48.5 48.5-77 114T120-480H40Z"/></svg>
							<a href="/financials/control/main<#if externalKeyParam?exists>?${externalKeyParam}</#if>">Control Presupuestal Contable</a>
						</li>
						<li>
							<svg xmlns="http://www.w3.org/2000/svg" height="30px" viewBox="0 -960 960 960" width="30px" fill="#e8eaed"><path d="M40-120v-80h880v80H40Zm120-120q-33 0-56.5-23.5T80-320v-440q0-33 23.5-56.5T160-840h640q33 0 56.5 23.5T880-760v440q0 33-23.5 56.5T800-240H160Zm0-80h640v-440H160v440Zm0 0v-440 440Z"/></svg>
							<a href="/partymgr/control/main<#if externalKeyParam?exists>?${externalKeyParam}</#if>">Administraci&oacute;n del Sistema</a>
						</li>
						<li>
							<svg xmlns="http://www.w3.org/2000/svg" height="30px" viewBox="0 -960 960 960" width="30px" fill="#e8eaed"><path d="M200-120q-17 0-28.5-11.5T160-160v-40h-40v-160q0-17 11.5-28.5T160-400h40v-280q0-66 47-113t113-47q66 0 113 47t47 113v400q0 33 23.5 56.5T600-200q33 0 56.5-23.5T680-280v-280h-40q-17 0-28.5-11.5T600-600v-160h40v-40q0-17 11.5-28.5T680-840h80q17 0 28.5 11.5T800-800v40h40v160q0 17-11.5 28.5T800-560h-40v280q0 66-47 113t-113 47q-66 0-113-47t-47-113v-400q0-33-23.5-56.5T360-760q-33 0-56.5 23.5T280-680v280h40q17 0 28.5 11.5T360-360v160h-40v40q0 17-11.5 28.5T280-120h-80Z"/></svg>
							<a href="/dataimport/control/main<#if externalKeyParam?exists>?${externalKeyParam}</#if>">Importaci&oacute;n de Datos</a>
						</li>
						<#-- <li>
							<svg xmlns="http://www.w3.org/2000/svg" height="30px" viewBox="0 -960 960 960" width="30px" fill="#e8eaed"><path d="M160-160q-33 0-56.5-23.5T80-240v-480q0-33 23.5-56.5T160-800h240l80 80h320q33 0 56.5 23.5T880-640v400q0 33-23.5 56.5T800-160H160Zm0-80h640v-400H447l-80-80H160v480Zm0 0v-480 480Z"/></svg>
							<a href="http://localhost/catalog/control/main<#if externalKeyParam?exists>?${externalKeyParam}</#if>">Cat&aacute;logos Auxiliares</a>
						</li>
						 -->
						<li>
							<svg xmlns="http://www.w3.org/2000/svg" height="30px" viewBox="0 -960 960 960" width="30px" fill="#e8eaed"><path d="M480-80q-82 0-155-31.5t-127.5-86Q143-252 111.5-325T80-480q0-83 31.5-155.5t86-127Q252-817 325-848.5T480-880q83 0 155.5 31.5t127 86q54.5 54.5 86 127T880-480q0 82-31.5 155t-86 127.5q-54.5 54.5-127 86T480-80Zm0-82q26-36 45-75t31-83H404q12 44 31 83t45 75Zm-104-16q-18-33-31.5-68.5T322-320H204q29 50 72.5 87t99.5 55Zm208 0q56-18 99.5-55t72.5-87H638q-9 38-22.5 73.5T584-178ZM170-400h136q-3-20-4.5-39.5T300-480q0-21 1.5-40.5T306-560H170q-5 20-7.5 39.5T160-480q0 21 2.5 40.5T170-400Zm216 0h188q3-20 4.5-39.5T580-480q0-21-1.5-40.5T574-560H386q-3 20-4.5 39.5T380-480q0 21 1.5 40.5T386-400Zm268 0h136q5-20 7.5-39.5T800-480q0-21-2.5-40.5T790-560H654q3 20 4.5 39.5T660-480q0 21-1.5 40.5T654-400Zm-16-240h118q-29-50-72.5-87T584-782q18 33 31.5 68.5T638-640Zm-234 0h152q-12-44-31-83t-45-75q-26 36-45 75t-31 83Zm-200 0h118q9-38 22.5-73.5T376-782q-56 18-99.5 55T204-640Z"/></svg>
							<a href="/webtools/control/main<#if externalKeyParam?exists>?${externalKeyParam}</#if>">Herramientas Web</a>
						</li>
						<li>
							<form id="logout" method="post" action="<@ofbizUrl>logout${previousParams?if_exists}</@ofbizUrl>">
								<svg xmlns="http://www.w3.org/2000/svg" height="30px" viewBox="0 -960 960 960" width="30px" fill="#e8eaed">
									<path d="M200-120q-33 0-56.5-23.5T120-200v-160h80v160h560v-560H200v160h-80v-160q0-33 23.5-56.5T200-840h560q33 0 56.5 23.5T840-760v560q0 33-23.5 56.5T760-120H200Zm220-160-56-58 102-102H120v-80h346L364-622l56-58 200 200-200 200Z"/>
								</svg>
					        	<a href="/control/logout" class="decorativeSubmit1">${uiLabelMap.CommonLogout}</a>
					      	</form>
						</li>
					</ul>	
				</nav>
				</div> 
					<h1>
						<#-- <span id="appId" style="color:#FF3300">${uiLabelMap.opentaps}</span> -->
						<span id="appName">${uiLabelMap.OpentapsProductName}</span>
					</h1>
				</div>
			</div>

			<style>
				.gwtWidget, .insideHeaderText, .logo-area, .control-area, #main-navigation{
					height: 45px !important;
					display: none;
				}
			
				/*********Diseño responsive********/

					#menu-check:not(:checked) ~ nav{
						display:none;
					}

					#menu-check:checked ~ nav{
						display:block;
					}

					#menu{
						display:block;
						color: #ffffff;
						font-size:1.5em;
						font-weight:bold;
						border-radius: 0.3em;
						position: absolute;
						left:0.5em;
						top:3.3em;
						z-index: 2;
						cursor: pointer;
						padding: 0px 3px;
					}

					#menu:hover{
						color: #235B4E;
						background: #ffffff;
						border-radius: 3px;
						padding: 0px 3px;
					}

					#menu-cerrar{
						display:none;
						padding: 0px 3px;
						margin-top: 5px;
					}

					#menu-check:checked ~ label #menu-abrir{
						display:none;
					}

					#menu-check:checked ~ label #menu-cerrar{
						display:block;
					}

					#contenedor nav{
						position: absolute;
						top: 118px;
						left: 0;
						height: 100%;
						background-color: #10312B;
						padding-top: 0.5em;
						padding-right: 1.5em;
						opacity: 0.9;
						z-index: 1;
						font-size: 20px;
						transition: 0.3s;
					}

					#contenedor nav ul a{
						color: #ffffff;
						background: none;
						text-decoration: none;
						margin-left:20px;

					}

					#contenedor nav ul, #contenedor nav ul li{
						display: block;
						text-align: left;
					}

					.decorativeSubmit1{
						background:none; 
						color:white; 
						border:none;
						text-align: left;
						font-size: 20px;
						margin-left: 20px;
					}

					.decorativeSubmit1:hover, #contenedor nav ul li:hover{
					background-color:#235B4E !important;

					}

				#menu-check {
					display: none;
				}

				/*********Diseño responsive********/


				@media(max-width: 1355px){

					.gwtWidget, .insideHeaderText, .logo-area, .control-area{
					display: none;
				}

					.modulos #row{
						width:15%;
						height: 23% !important;
					}

				}

				@media(max-width: 1355px) {

					

					#menu-check:not(:checked) ~ nav{
						display:none;
					}

					#menu-check:checked ~ nav{
						display:block;
					}

					#menu{
						display:block;
						color: #ffffff;
						font-size:1.5em;
						font-weight:bold;
						border-radius: 0.3em;
						position: absolute;
						left:0.5em;
						top:3.3em;
						z-index: 2;
					}

					#menu:hover{
						color: #235B4E;
						background: #ffffff;
					}

					#menu-cerrar{
						display:none;
					}

					#menu-check:checked ~ label #menu-abrir{
						display:none;
					}

					#menu-check:checked ~ label #menu-cerrar{
						display:block;
					}

					#contenedor nav{
						position: absolute;
						top: 118px;
						left: 0;
						height: 100%;
						width:50%;
						background-color: #10312B;
						padding-top: 0.5em;
						padding-right: 1.5em;
						opacity: 0.9;
						z-index: 1;
						font-size: 20px;
						transition: 0.3s;
					}

					#contenedor nav ul a{
						color: #ffffff;
						background: none;
						text-decoration: none;
						margin-left:20px;

					}

					#contenedor nav ul, #contenedor nav ul li{
						display: block;
						text-align: left;
					}

					.decorativeSubmit{
						background:none; 
						color:white; 
						border:none;
						text-align: left;
						font-size: 20px;
						margin-left: 20px;
					}

					.decorativeSubmit:hover, #contenedor nav ul li:hover{
					background-color:#235B4E !important;

					}
					body{
						overflow-x:hidden;
					}
					
					#top{
						background-color:#10312B; 
						height:36px;
						display:flex;
					}
					
					#imgagen{
						justify-content:center;
						width:175px; 
						height:30px; 
						align:center;
					}

					#wrapper{
						position: absolute;
					}

					#form{
						display: none;
					}

					#imagenLogin{
						justify-content:center;
						max-width: 100px;
						align-self: center;
					}

					#appName{
					
						display:flex;
						justify-content:center;
						color:white;
						margin-left:50%;
						font-size:13px !important;
						font-size: x-large;
						justify-content: center;
					}

					#top2{
						background-color:#235B4E; 
						height:50px;
						width:100%;
						display:flex;
					}

					/*.modulos #row{
						width:25%;
						height: 30% !important;
					}*/

					.imagen{
						width:50%;
					}

					#footer{
						position:fixed;
					}
					
				}

				@media(max-width: 835px) {

					#contenedor nav{
						width:100%;
						font-size: 20px;
					}

					.modulos #row{
						width:14%;
						height: 23% !important;
					}

					#appName{
					
						display:flex;
						justify-content:center;
						color:white;
						margin-left:50%;
						font-size:10px !important;
						font-size: x-large;
						justify-content: center;
					}

					#texto{
						font-size:15px;
						text-wrap:balance;
					}

					#wrapper{
						position: absolute;
					}
				}

				@media(max-width: 700px) {
					
					.modulos #row{
						width:18%;
					}

				}

				@media (max-width: 660px) {
					
					.modulos #row {
						width: 29%;
					}

					#appName{
					
						display:flex;
						justify-content:center;
						color:white;
						margin-left:5%;
						font-size:8px !important;
						font-size: x-large;
						justify-content: center;
					}
				}

			</style>
	</#if>