<#if !userLogin?exists>
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
	
 	<#-- if login -->
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml">
		<link rel="shortcut icon" href="<@ofbizContentUrl>/opentaps_images/favicon.ico</@ofbizContentUrl>">
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
			<meta name="viewport" content="width=device-witdh, initial-scale=1.0"/>
			 <#-- TODO: find the way to import CSS from css component folder For now we are getting CSS from the opentaps_css directory inside opentaps-common. -->
			<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
			<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
		    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		</head>
		<body class="bodyLogin">
		      <div class="container text-center">
		      	<div class="card">
				  <div class="card-body">
				    <div id="logo">
				    	<img id="logo_inicio" src="<@ofbizContentUrl>${configProperties.get("opentaps.logoLogin")}</@ofbizContentUrl>" align="center"/>
				    </div>
				    <h2 class="inicioSesion">${uiLabelMap.OpentapsLoginGreeting}</h2>
				    <p class="texto" style="">Ingresa tus credenciales para acceder al sistema</p>
				    <#-- handles service error messages -->
					      <#if requestAttributes.errorMessageList?has_content><#assign errorMessageList=requestAttributes.errorMessageList></#if>
					      <#if requestAttributes.eventMessageList?has_content><#assign eventMessageList=requestAttributes.eventMessageList></#if>
					      <#if requestAttributes.serviceValidationException?exists><#assign serviceValidationException = requestAttributes.serviceValidationException></#if>
					      <#if requestAttributes.uiLabelMap?has_content><#assign uiLabelMap = requestAttributes.uiLabelMap></#if>
					
					      <#if !errorMessage?has_content>
					        <#assign errorMessage = requestAttributes._ERROR_MESSAGE_?if_exists/>
					      </#if>
					      <#if !errorMessageList?has_content>
					        <#assign errorMessageList = requestAttributes._ERROR_MESSAGE_LIST_?if_exists/>
					      </#if>
					      <#if !eventMessage?has_content>
					        <#assign eventMessage = requestAttributes._EVENT_MESSAGE_?if_exists/>
					      </#if>
					      <#if !eventMessageList?has_content>
					        <#assign eventMessageList = requestAttributes._EVENT_MESSAGE_LIST_?if_exists/>
					      </#if>
					
					      <#-- display the error messages -->
					      <#if (errorMessage?has_content || errorMessageList?has_content)>
					        <div id="errorDiv" class="serviceError alert alert-danger">
					          <p>${uiLabelMap.CommonFollowingErrorsOccurred}:</p>
					          <#if errorMessage?has_content && errorMessage != "null">
					            <p>${errorMessage}</p>
					          </#if>
					          <#if errorMessageList?has_content>
					            <#list errorMessageList as errorMsg>
					              <#if errorMsg?exists && errorMsg != "null">
					                <p>${errorMsg}</p>
					              </#if>
					            </#list>
					          </#if>
					        </div>
					      </#if>
			
					      <#-- display the event messages -->
					      <#if (eventMessage?has_content || eventMessageList?has_content)>
					        <div id="errorDiv" class="serviceError alert alert-danger">
					          <p>${uiLabelMap.CommonFollowingOccurred}:</p>
					          <#if eventMessage?has_content && eventMessage != "null">
					            <p>${eventMessage}</p>
					          </#if>
					          <#if eventMessageList?has_content && eventMessageList != "null">
					            <#list eventMessageList as eventMsg>
					              <#if errorMsg?exists && errorMsg != "null">
					                <p>${eventMsg}</p>
					              </#if>
					            </#list>
					          </#if>
					        </div>
					      </#if>
				    <#-- Error end -->
				      
				    <#-- form -->
				    <form id="login" method="post" action="<@ofbizUrl>login${previousParams?if_exists}</@ofbizUrl>">
					  <div class="row">
					  	<div class="col-12">
					  		<label class="sr-only" for="inlineFormInputGroupUsername2">Username</label>
							  <div class="input-group mb-2 mr-sm-2">
							    <div class="input-group-prepend">
							      <div class="input-group-text user-icon">
							      	<i class="fa fa-user my-1"></i>
							      </div>
							    </div>
							    <input class="form-control" type="text" id="username" placeholder="Nombre de usuario" name="USERNAME" size="50"/>
							  </div>
					  	</div>
					  </div>
					  <div class="row">
					  	<div class="col-12">
					  		<label class="sr-only" for="inlineFormInputGroupUsername2">Username</label>
							  <div class="input-group mb-2 mr-sm-2">
							    <div class="input-group-prepend">
							      <div class="input-group-text key-icon">
							      	<i class="material-symbols-outlined">key</i>
							      </div>
							    </div>
							    <input class="form-control" type="password" id="password" placeholder="Password" name="PASSWORD" size="50"/>
							  </div>
					  	</div>
					  </div>
					  <div class="row">
					  	<div class="col-12 mt-4">
					  		<button class="btn btn-primary" type="submit">
						  		${uiLabelMap.CommonLogin} <i class="fa fa-sign-in" aria-hidden="true"></i>
					  		</button>
					  	</div>
					  </div>
					</form>
					<div class="row mt-3">
						<div class="col-12">
							<h6 class="enlace"><a href="javascript:forgotPasswd()">${uiLabelMap.CommonForgotYourPassword}?</a></h6>
						</div>
					</div>
					<form id="forgotpasswd" method="post" action="<@ofbizUrl>forgotpassword${previousParams?if_exists}</@ofbizUrl>">
					  <hr>
					  <h6 class="texto2">${uiLabelMap.CommonForgotPassword}</h6>
			          <div class="row">
			          	<div class="col-12">
					        <input type="text" class="form-control" id="username" name="USERNAME" placeholder="${uiLabelMap.CommonUsername}" size="50" />
			          	</div>
			          </div>
			          <div class="row mt-4">
			          	<div class="col-12">
			          		<input type="submit" class="btn btn-primary" name="EMAIL_PASSWORD" value="${uiLabelMap.CommonEmailPassword}"/>
			          	</div>
			          </div>
				    </form>
				  </div>
				</div>
			</div>
			<script type="text/javascript">
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
		</body>
	</html>
</#if>
<#-- if login -->

<#-- if user is authenticated -->
<#if userLogin?exists>
	<div id="container">
		<div id="form">
	      	<h2 id="Bienvenida">${uiLabelMap.CommonWelcome} <br />${firstName} ${lastName}</h2>
	      	<hr>
	      	<form id="logout" method="post" action="<@ofbizUrl>logout${previousParams?if_exists}</@ofbizUrl>">
	        	<input class="decorativeSubmit" type="submit" value="${uiLabelMap.CommonLogout}" />
	      	</form>
	    	<!-- <@include location="component://opentaps-common/webapp/common/includes/latestnews.ftl"/> -->
		</div>
		<div class="modulos">
			<div id="row">
		    	<#assign appIndex = 0 />
		      	<#list apps as app>
		      		<#if (app.applicationId != "warehouse" && app.applicationId != "controlPatrimonial" && app.applicationId != "purchasing" && app.applicationId != "viaticos"
		      			&& app.applicationId != "gastosReserva" && app.applicationId != "obras" && app.applicationId != "crmsfa" && app.applicationId != "" && app.applicationId != "proyectos")>
						<#if (!app.hide?exists || app.hide != "Y") && app.linkUrl?has_content>
					    	<#assign appIndex = appIndex + 1 />
				        	<div id="button" class="${app.applicationId}" onmouseover="javascript:writeAppDetails('${app.shortName!app.applicationId}','${app.applicationName!app.applicationId}','${app.description!app.applicationId}')">
					        	<#if app.imageUrl?has_content>
					              <a id="Titulos" href="${app.linkUrl}<#if externalKeyParam?exists>?${externalKeyParam}</#if>">
					                <img class="imagen" src="${app.imageUrl}" onmouseover="this.src='${app.imageHoverUrl!app.imageUrl}'" onmouseout="this.src='${app.imageUrl}'" />
					              </a>
					            </#if>
					            <div id="texto" for="${app.applicationId}">
					            	<a style="color: black;" href="${app.linkUrl}<#if externalKeyParam?exists>?${externalKeyParam}</#if>" >
					                	${app.shortName!app.applicationId}
					              	</a>
					            </div>
				          	</div>
					        <#if !app_has_next>
				          		</div>
				          	<#elseif appIndex % 1 == 0>
				            	</div><div id="row"> 
					        </#if>
						</#if>
					</#if>
		      	</#list>
		    </div>
    	</div>
    </div>
</#if>