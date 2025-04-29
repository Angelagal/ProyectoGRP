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
<#-- Copyright (c) Open Source Strategies, Inc. -->

<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->

<style type="text/css">
		.bodyLogin {
			font-family: Helvetica;
		    background: url("/images/FondoAntenas4K.jpg") !important;
		    background-position: center center !important;
		    background-repeat: no-repeat !important;
		    background-size: cover !important;
		    background-attachment: fixed !important;
		    background-color: #929495 !important;
		    background-blend-mode: overlay !important;
		}
		
		.container {
			align-items: center;
		}
		
		.container {
			display: flex !important;
		    flex-wrap: wrap !important;
		    flex-direction: column !important;
		    align-items: center !important;
		    justify-content: center !important;
		    gap: 3rem !important;
		    width: 100% !important;
		    height: 100% !important;
		}
		
		.card {
			width: 45% !important;
		    height: auto !important;
		    padding: 3em !important;
		    border: #f0f4f8 1px solid !important;
		    border-radius: 10px !important;
		    background-color: #f0f4f8 !important;
		    margin-top: 10% !important;
		    align-content: center !important;
		    align-items: center !important;
		    transition: 0.5s !important;
		}
		
		.inicioSesion {
			color: #206c4a;
			margin: 10px 0px !important;
		}
		
		.btn-primary {
			background: #206c4a !important;
			padding: 8px 25px !important;
		}
		
		.btn-primary:hover {
			opacity: 0.8 !important;
		}
		
		.user-icon {
		    padding: 10px 18px !important;
		    margin: 0px !important;
		}
		
		.key-icon {
			padding: 10px 12px !important;
		}
		
		.serviceError {
			color: red !important;
			font-size: 8pt !important;
		}
		
		#forgotpasswd {
	    	display: none;
	  	}

		/***************/

		#logo_inicio{
			width: 200px;
			height: 200px;
		}

		.texto, .enlace a{
				font-size: 13pt !important;
			}

		/*******Diseño Responsivo********/
		
		@media(max-width: 1000px) {
			#logo_inicio{
          		width: 100px !important;
         		height: 100px !important;
        	}
		}

		@media(max-width: 767px) {
			.card {
				width: 70% !important;
			}

			.inicioSesion{
				font-size: 20px;
			}

			.texto, .enlace a, .texto2{
				font-size: 10pt !important;
			}
		}
</style>

<@import location="component://opentaps-common/webapp/common/includes/lib/opentapsFormMacros.ftl"/>
	<head>
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
			<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
		    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	</head>
	<body class="bodyLogin">
		<#assign username = requestParameters.USERNAME?default((sessionAttributes.autoUserLogin.userLoginId)?default(""))>
		<div class="container text-center">
	      	<div class="card">
			  <div class="card-body">
			    <div id="logo" class="mb-2">
			    	<img id="logo_inicio" src="<@ofbizContentUrl>${configProperties.get("opentaps.logoLogin")}</@ofbizContentUrl>" align="center"/>
			    </div>
			    <@frameSection title="${uiLabelMap.CommonPasswordChange}" style="width: auto;" innerStyle="text-align: center;">
				    <form method="post" action="<@ofbizUrl>login</@ofbizUrl>" name="loginform">
				      <input type="hidden" name="requirePasswordChange" value="Y"/>
				      <input type="hidden" name="USERNAME" value="${username}"/>
				      <table cellspacing="0">
				        <tr>
				          <td align="right"><@display text="${uiLabelMap.CommonCurrentPassword}&nbsp;" class="tabletext"/></td>
				          <td align="left"><input type="password" class="form-control my-2" name="PASSWORD" value="" size="20" class="inputBox"/></td>
				        </tr>
				        <tr>
				          <td align="right"><@display text="${uiLabelMap.CommonNewPassword}&nbsp;" class="tabletext"/></td>
				          <td align="left"><input type="password" class="form-control mb-2" name="newPassword" value="" size="20" class="inputBox"/></td>
				        </tr>
				        <tr>
				          <td align="right"><@display text="${uiLabelMap.OpentapsConfirmPassword}&nbsp;" class="tabletext"/></td>
				          <td align="left"><input type="password" class="form-control mb-2" name="newPasswordVerify" value="" size="20" class="inputBox"/></td>
				        </tr>
				        <tr>
				          <td colspan="2" align="center">
				            <input type="submit" class="btn btn-primary mt-4" value="${uiLabelMap.PartyChangePassword}" class="loginButton"/>
				          </td>
				        </tr>
				      </table>
				    </form>
				</@frameSection>
			  </div	>
			</div>
			<script language="JavaScript" type="text/javascript">
			  document.loginform.PASSWORD.focus();
			</script>
	</body>