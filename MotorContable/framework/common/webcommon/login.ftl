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
<#-- This file has been modified by Open Source Strategies, Inc. -->

<#if requestAttributes.uiLabelMap?exists><#assign uiLabelMap = requestAttributes.uiLabelMap></#if>
<#assign useMultitenant = Static["org.ofbiz.base.util.UtilProperties"].getPropertyValue("general.properties", "multitenant")>

<#assign username = requestParameters.USERNAME?default((sessionAttributes.autoUserLogin.userLoginId)?default(""))>
<#if username != "">
  <#assign focusName = false>
<#else>
  <#assign focusName = true>
</#if>
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

	.screenlet-body {
		background-color: #f0f4f8 !important;
	}

	.basic-table {
		background-color: #f0f4f8 !important;
	}
</style>
<body class="bodyLogin">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <div class="container text-center">
	  	<div class="card">
		  <div class="card-body">
		    <div id="logo" class="mb-2">
		    	<img id="logo_inicio" src="/images/BienestarLogo.png" align="center"/>
		    </div>
		    <div >
    <div class="screenlet-body">
      <form method="post" action="<@ofbizUrl>login</@ofbizUrl>" name="loginform">
        <table class="basic-table" cellspacing="0">
          <tr>
            <td class="label">${uiLabelMap.CommonUsername}</td>
            <td><input type="text" class="form-control" name="USERNAME" value="${username}" size="20"/></td>
          </tr>
          <tr>
            <td class="label">${uiLabelMap.CommonPassword}</td>
            <td><input type="password" class="form-control" name="PASSWORD" value="" size="20"/></td>
          </tr>
          <#if ("Y" == useMultitenant)>
            <tr>
              <td class="label">${uiLabelMap.CommonTenantId}</td>
              <td><input type="text" name="tenantId" value="${parameters.tenantId?if_exists}" size="20"/></td>
            </tr>
          </#if>
          <tr>
            <td colspan="2" align="center">
              <input type="submit" class="btn btn-primary" value="${uiLabelMap.CommonLogin}"/>
            </td>
          </tr>
        </table>
        <input type="hidden" name="JavaScriptEnabled" value="N"/>
        <br />
        <a href="<@ofbizUrl>forgotPassword</@ofbizUrl>">${uiLabelMap.CommonForgotYourPassword}?</a>
      </form>
    </div>
  </div>
		  </div>
		</div>
  </div>
</body>

<script language="JavaScript" type="text/javascript">
  document.loginform.JavaScriptEnabled.value = "Y";
  <#if focusName>
    document.loginform.USERNAME.focus();
  <#else>
    document.loginform.PASSWORD.focus();
  </#if>
</script>
