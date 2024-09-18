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
<#if !userLogin?exists>
	<style type="text/css">
	
		body{
		    background: url("/images/FondoAntenas4K.jpg");
		    height: 100%;
		    width: 100%;
		    background-position: center;
		    background-repeat:repeat no-repeat;
		    background-size: cover;
		}
		
		#wrapper{
		    text-align: center;
		    display: flex;
		    flex-wrap: wrap;
		    flex-direction: column ;
		    align-items: center ;
		    justify-content: center ;
		    gap: 3rem;
		    width: 100% ;
		    height: 100% ;
		    margin-top: 50px;
		}
		
		
		#form{
		  font-size: 18px;
		  text-align: center;
		  width: 30%;
		  height: auto;
		  padding: 4em;
		  border: white 1px solid;
		  border-radius: 10px;
		  background-color: #ffffff;
		  margin-top: 1%;
		  align-content: center;
		  align-items: center;
		  transition: 0.6s;
		}
		
		
		.titulo{
		    font-size: 33px;
		    font-family: sans-serif;
		    font-weight:100;
		}
				
		  @media screen and (max-width: 850px) {
		    .loginCard {
		      width: 100%;
		      margin-top: 10%;
		      min-width: 300px;
		    }
		  }
				  
		  .q-pa-lg:hover {
		    background-color: #9f2241 !important;
		    color: white !important; 
		  }
				
		  .ingre{
		    font-size: 14px;
		    font-family: sans-serif;
		    font-weight:100;
		  }
		  
		  input {
		    width: 80%;
		    border: none;
		    padding: 15px;
		  }
		
		  input:hover{
		    border: border solid 1px color black;

		  }
      .pac{
        margin-top:20px;
      }
		  .decorativeSubmit {
		    text-align:center;
		    width:30%;
		    margin-top: 25px;
		    padding: 16px 30px;
		    color: #235B4E;
		    cursor: #235B4E;
		    font-size: 18px;
		    font-weight:300;
		    font-family: Arial, Helvetica, sans-serif;
		  }
		
		 
		  .decorativeSubmit:hover{
		    background-color: #9f2241;
		    color: white;
		  }
		
		  #forgotpasswd {
		    display: none;
		  }

      #recoverPassword{
        text-align:center;
        width:70%;
        padding: 16px 40px !important;

      }
		  
      .enlace{
        margin-top:15px;

      }

		  .enlace a {
		    text-decoration:none;
		    color:#10312B;
		    font-size: 19px;
		    font-family: Roboto;
		  }
		
		  .enlace a:hover{
		    color: #DDC9A3;
		  }

      ::placeholder{
        font-size:19px;
      }
   

	</style>
</#if>


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
<div id="wrapper">

  <div id="form">
    <#-- if user is authenticated -->
    <#if userLogin?exists>
      <h2 id="Bienvenida">${uiLabelMap.CommonWelcome} <br />${firstName} ${lastName}</h2>
      <br />
      <form id="logout" method="post" action="<@ofbizUrl>logout${previousParams?if_exists}</@ofbizUrl>">
        <input style="background-color: #10312B; color:#FFFFFF; margin:3px; height:50px; " class="decorativeSubmit" type="submit"  value="${uiLabelMap.CommonLogout}" />
      </form>
  <style>

  #button{
  margin: 0px !important;
  padding:0px !important;  
}

</style>

      <#-- if user IS NOT authenticated, shows login form -->
    <#else>
      <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
      <div id="logo"><img src="<@ofbizContentUrl>${configProperties.get("opentaps.logoLogin")}</@ofbizContentUrl>" width="200" height="200" align="center"/></div>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
      <h2>${uiLabelMap.OpentapsLoginGreeting}</h2>

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
        <div id="errorDiv" class="serviceError">
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
        <div id="errorDiv" class="serviceError">
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


      <#-- handles service error messages -->

      <form id="login" method="post" action="<@ofbizUrl>login${previousParams?if_exists}</@ofbizUrl>">
        <label class="ingre">Ingrese sus accesos</label>
        
        
        <div class="pac">
          <p class="material-symbols-outlined">person</p>
          <input class="inputLogin" type="text" id="username" placeholder="Nombre de usuario" name="USERNAME" size="50"/>
        </div>
        <div class="pac">
          <p class="material-symbols-outlined">key</p>
          <input class="inputLogin" type="password" id="password" placeholder="Password" name="PASSWORD" size="50"/>
        </div>
        <input class="decorativeSubmit" type="submit" value="${uiLabelMap.CommonLogin}" />
        
      </form>

      <h3 class="enlace"><a href="javascript:forgotPasswd()">${uiLabelMap.CommonForgotYourPassword}?</a></h3>

      <form id="forgotpasswd" method="post" action="<@ofbizUrl>forgotpassword${previousParams?if_exists}</@ofbizUrl>">
        <p class="top">
          <input class="inputLogin" placeholder="Ingrese su correo electronico" type="text" id="username" name="USERNAME" size="50"/> <br />
        </p>
        <p>
          <input type="submit" name="EMAIL_PASSWORD" id="recoverPassword" class="decorativeSubmit" value="${uiLabelMap.CommonEmailPassword}"/>
        </p>
      </form>

    </#if>
    <br/><br/>
    <!-- <@include location="component://opentaps-common/webapp/common/includes/latestnews.ftl"/> -->
  </div>

<div class="modulos">

  <#if apps?exists>
    <div id="row">
      <#assign appIndex = 0 />
      <#list apps as app>
        <#if (!app.hide?exists || app.hide != "Y") && app.linkUrl?has_content>
          <#assign appIndex = appIndex + 1 />
          <div id="button" class="${app.applicationId}" onmouseover="javascript:writeAppDetails('${app.shortName!app.applicationId}','${app.applicationName!app.applicationId}','${app.description!app.applicationId}')">
            <#if app.imageUrl?has_content>
              <a id="Titulos" href="${app.linkUrl}<#if externalKeyParam?exists>?${externalKeyParam}</#if>">
                <img src="${app.imageUrl}" onmouseover="this.src='${app.imageHoverUrl!app.imageUrl}'" onmouseout="this.src='${app.imageUrl}'" />
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
            </div> 
            <div id="row"> 
          </#if>
        </#if>
      </#list>
    </div>     
    </#if>
    
 <#-- end of the latest row-->

</div>  <#-- end of wrapper-->
<div>

	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
</div>
