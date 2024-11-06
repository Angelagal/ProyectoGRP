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
 *  Copyright (c) 2003 The Open For Business Project - www.ofbiz.org
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a 
 *  copy of this software and associated documentation files (the "Software"), 
 *  to deal in the Software without restriction, including without limitation 
 *  the rights to use, copy, modify, merge, publish, distribute, sublicense, 
 *  and/or sell copies of the Software, and to permit persons to whom the 
 *  Software is furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included 
 *  in all copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS 
 *  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
 *  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
 *  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
 *  CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT 
 *  OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR 
 *  THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 *@author     Andy Zeneski (jaz@ofbiz.org)
 *@author     Olivier Heintz (olivier.heintz@nereide.biz) 
 *@version    $Rev: 314 $
 *@since      2.1
-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		
<#assign previousParams = sessionAttributes._PREVIOUS_PARAMS_?if_exists/>
<#if previousParams?has_content>
  <#assign previousParams = "?" + previousParams/>
</#if>

<#assign username = requestParameters.USERNAME?default((sessionAttributes.autoUserLogin.userLoginId)?default(""))>
<#if username != "">
  <#assign focusName = false/>
<#else/>
  <#assign focusName = true/>
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
    .container{
        display:flex;
		    flex-wrap: wrap !important;
		    flex-direction: column !important;
		    align-items: center !important;
		    justify-content: center !important;
		    
		    
		    
    }
    div.form{
  	    width: 35% !important;
		    height: auto !important;
		    padding: 3em !important;
		    border: #f0f4f8 1px solid !important;
		    border-radius: 8px !important;
		    background-color: #f0f4f8 !important;
		    margin-top: 8% !important;
		    align-items: center !important;
		    justify-content: center !important;
        margin-left:34%;

    }
    #logo_inicio{
			width: 200px;
			height: 200px;
      margin-bottom:20px;
		}

    .tabletext{
      font-size:14px;
      font-family:sans-serif;

    }

.loginButton{
background: #206c4a !important;
			padding: 4px 12px !important;
}


<#assign fgcolor = "#FFFFFF"/>
<#assign bgcolor = "#942839"/>






</style>

<body class="bodyLogin">
  <div class="container">
<@import location="component://opentaps-common/webapp/common/includes/lib/opentapsFormMacros.ftl"/>

<#assign greetingLabel = opentapsApplicationName?default("opentaps")?cap_first + "LoginGreeting"/>
<#include "keyboard-shortcuts.ftl"/>
<div class="form">
  
  <div align="center">
       <div id="logo">
				    	<img id="logo_inicio" src="<@ofbizContentUrl>${configProperties.get("opentaps.logoLogin")}</@ofbizContentUrl>" align="center"/>
	     </div>
    <@frameSection title="${uiLabelMap.get(greetingLabel)}" style="width: 300px; margin-left: auto; margin-right: auto;text-align: center;" innerStyle="text-align: center;">
        
        <form method="post" action="<@ofbizUrl>login${previousParams?if_exists}</@ofbizUrl>" name="loginform" class="form" style="margin: 0;">
          <table width="50%" border="0" cellpadding="0" cellspacing="2">
            <tr>
              <td align="right">
                <span class="tabletext">${uiLabelMap.CommonUsername}&nbsp;</span>
              </td>
              <td align="left">
                <input type="text" class="inputBox" name="USERNAME" value="${username}" size="20"/>
              </td>
            </tr>
            <tr>
              <td align="right">
                <span class="tabletext">${uiLabelMap.CommonPassword}&nbsp;</span>
              </td>
              <td align="left">
                <input type="password" class="inputBox" name="PASSWORD" value="" size="20"/>

               
              </td>
            </tr>
            <tr>
              <td colspan="2" align="center">
                <input type="submit" value="${uiLabelMap.CommonLogin}" class="loginButton"/>
              </td>
            </tr>
          </table>
        </form>
    </@frameSection>
  </div>
<#--
  <div align="center">
    <@frameSection title="${uiLabelMap.CommonForgotYourPassword}?" style="width: 300px; margin-left: auto; margin-right: auto; margin-top: 20px;" innerStyle="text-align: center;">
        <form method="post" action="<@ofbizUrl>forgotpassword${previousParams}</@ofbizUrl>" name="forgotpassword" style="margin: 0;">
          <span class="tabletext">${uiLabelMap.CommonUsername}&nbsp;</span><input type="text" size="20" class="inputBox" name="USERNAME" value="<#if requestParameters.USERNAME?has_content>${requestParameters.USERNAME}<#elseif autoUserLogin?has_content>${autoUserLogin.userLoginId}</#if>"/>
          <div style="margin-top: 3px;"><input type="submit" name="EMAIL_PASSWORD" class="loginButton" value="${uiLabelMap.CommonEmailPassword}"/></div>
        </form>
    </@frameSection>
  </div>
  -->

  <script type="text/javascript">
  /*<![CDATA[*/
    <#if focusName>
      document.loginform.USERNAME.focus();
    <#else/>
      document.loginform.PASSWORD.focus();
    </#if>
  /*]]>*/
  </script>
</div>
  </div>
</body>
<!-- <@include location="component://opentaps-common/webapp/common/includes/latestnews.ftl"/> -->