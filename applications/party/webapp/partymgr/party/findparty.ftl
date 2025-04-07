<#--
  Licensed to the Apache Software Foundation (ASF) under one
  or more contributor license agreements. See the NOTICE file
  distributed with this work for additional information
  regarding copyright ownership. The ASF licenses this file
  to you under the Apache License, Version 2.0 (the "License" ); you may not use this file except in compliance
  with the License. You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing,
  software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
  KIND, either express or implied. See the License for the
  specific language governing permissions and limitations
  under the License.
-->
  <#-- This file has been modified by Open Source Strategies, Inc. -->
<style>
  .button_disabled {
    background-color: rgba(0, 0, 0, 0.1) !important;
    color: gray !important;
    cursor: not-allowed !important;
  }
</style>

<style>
  .basic-table {
    width: 100%;
    border-collapse: collapse;
    font-family: Arial, sans-serif;
    background: #f9f9f9;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
  }

  .basic-table td {
    padding: 10px;
    border: 1px solid #ddd;
  }

  .basic-table tr:nth-child(even) {
    background-color: #f2f2f2;
  }

  .label {
    font-weight: bold;
    background:#e3e4e5;
    color: white;
    text-align: left;
    padding: 10px;
  }

  input[type="text"], select {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
  }

  input[disabled] {
    background: rgba(0, 0, 0, 0.1);
    cursor: not-allowed;
  }

  input[type="submit"] {
    background: #92a88f;
    color: white;
    padding: 10px 15px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
  }

  input[type="submit"]:hover {
    background:#92a88f;
  }

</style>


    <#assign extInfo=parameters.extInfo?default("N")>
      <#assign inventoryItemId=parameters.inventoryItemId?default("")>
        <#assign serialNumber=parameters.serialNumber?default("")>
          <#assign softIdentifier=parameters.softIdentifier?default("")>
            <#-- Only allow the search fields to be hidden when we have some results -->
            <#if partyList?exists>
              <#if partyList?has_content>
                <#assign hideFields=parameters.hideFields?default("N")>
                  <#else>
                    <#assign hideFields="N">
              </#if>
              <h1>${uiLabelMap.PartyFindParties}</h1>
              <#if (parameters.firstName?has_content || parameters.lastName?has_content)>
                <#assign createUrl="editperson?create_new=Y&amp;lastName=${parameters.lastName?if_exists}&amp;firstName=${parameters.firstName?if_exists}" />
                <#elseif (parameters.groupName?has_content)>
                  <#assign createUrl="editpartygroup?create_new=Y&amp;groupName=${parameters.groupName?if_exists}" />
                  <#else>
                    <#assign createUrl="createnew" />
              </#if>
              <div class="button-bar"><a href="<@ofbizUrl>${createUrl}</@ofbizUrl>" class="buttontext create">${uiLabelMap.CommonCreateNew}</a></div>
              <div class="screenlet">
                <div class="screenlet-title-bar" style="font-size: 12px;">
                  <#if partyList?has_content>
                    <ul>
                      <#if hideFields=="Y">
                        <li class="collapsed"><a href="<@ofbizUrl>findparty?hideFields=N${paramList}</@ofbizUrl>" title="${uiLabelMap.CommonShowLookupFields}">&nbsp;</a></li>
                        <#else>
                          <li class="expanded"><a href="<@ofbizUrl>findparty?hideFields=Y${paramList}</@ofbizUrl>" title="${uiLabelMap.CommonHideFields}">&nbsp;</a></li>
                      </#if>
                      <#if (partyListSize> 0)>
                        <#if (partyListSize> highIndex)>
                          <li><a class="nav-next" href="<@ofbizUrl>findparty?VIEW_SIZE=${viewSize}&amp;VIEW_INDEX=${viewIndex+1}&amp;hideFields=${hideFields}${paramList}</@ofbizUrl>">${uiLabelMap.CommonNext}</a></li>
                          <#else>
                            <li class="disabled">${uiLabelMap.CommonNext}</li>
                        </#if>
                        <li>${lowIndex} - ${highIndex} ${uiLabelMap.CommonOf} ${partyListSize}</li>
                        <#if (viewIndex> 0)>
                          <li><a class="nav-previous" href="<@ofbizUrl>findparty?VIEW_SIZE=${viewSize}&amp;VIEW_INDEX=${viewIndex-1}&amp;hideFields=${hideFields}${paramList}</@ofbizUrl>">${uiLabelMap.CommonPrevious}</a></li>
                          <#else>
                            <li class="disabled">${uiLabelMap.CommonPrevious}</li>
                        </#if>
                      </#if>
                    </ul>
                    <br class="clear" />
                  </#if>
                </div>
                <div class="screenlet-body">
                  <div id="findPartyParameters" <#if hideFields !="N"> style="display:none" </#if> >
                    <h2 style="font-size: 24px;">${uiLabelMap.CommonSearchOptions}</h2>
                    <#-- NOTE: this form is setup to allow a search by partial partyId or userLoginId; to change it to go directly to
                      the viewprofile page when these are entered add the follow attribute to the form element:

                      onsubmit="javascript:lookupParty('<@ofbizUrl>viewprofile</@ofbizUrl>');"
                      -->
                      <form method="post" name="lookupparty" action="<@ofbizUrl>findparty</@ofbizUrl>" class="basic-form">
                        <input type="hidden" name="lookupFlag" value="Y" />
                        <input type="hidden" name="hideFields" value="Y" />
                        <table class="basic-table" cellspacing="0">
                          <tr>
                          <tr>
                            <td class="label">${uiLabelMap.PartyPartyId}</td>
                            <td><input type="text" id="input_rusp" minlength="0" maxlength="10" name="partyId" value="${parameters.partyId?if_exists}" /></td>
                          </tr>
                          <tr>
                            <td class="label">${uiLabelMap.PartyUserLogin}</td>
                            <td><input type="text" id="input_userlogin" style="background:rgba(0,0,0,0.1);cursor:not-allowed;" disabled="true" name="userLoginId" value="${parameters.userLoginId?if_exists}" /></td>
                          </tr>
                          <tr>
                            <td class="label">${uiLabelMap.PartyFirstName}</td>
                            <td><input type="text" id="input_firtsName" style="background:rgba(0,0,0,0.1);cursor:not-allowed;" disabled="true" name="firstName" value="${parameters.firstName?if_exists}" /></td>
                          </tr>
                          <tr>
                            <td class="label">${uiLabelMap.PartyLastName}</td>
                            <td><input type="text" id="input_lastName" style="background:rgba(0,0,0,0.1);cursor:not-allowed;" disabled="true" name="lastName" value="${parameters.lastName?if_exists}" /></td>
                          </tr>
                    
                          <#if extInfo=="P">
                            <tr>
                              <td colspan="3">
                                <hr />
                              </td>
                            </tr>
                            <tr>
                              <td class="label">${uiLabelMap.CommonAddress1}</td>
                              <td><input type="text" name="address1" value="${parameters.address1?if_exists}" /></td>
                            </tr>
                            <tr>
                              <td class="label">${uiLabelMap.CommonAddress2}</td>
                              <td><input type="text" name="address2" value="${parameters.address2?if_exists}" /></td>
                            </tr>
                            <tr>
                              <td class="label">${uiLabelMap.CommonCity}</td>
                              <td><input type="text" name="city" value="${parameters.city?if_exists}" /></td>
                            </tr>
                            <tr>
                              <td class="label">${uiLabelMap.CommonStateProvince}</td>
                              <td>
                                <select name="stateProvinceGeoId">
                                  <#if currentStateGeo?has_content>
                                    <option value="${currentStateGeo.geoId}">${currentStateGeo.geoName?default(currentStateGeo.geoId)}</option>
                                    <option value="${currentStateGeo.geoId}">---</option>
                                  </#if>
                                  <option value="ANY">${uiLabelMap.CommonAnyStateProvince}</option>
                                  ${screens.render("component://common/widget/CommonScreens.xml#states")}
                                </select>
                              </td>
                            </tr>
                            <tr>
                              <td class="label">${uiLabelMap.PartyPostalCode}</td>
                              <td><input type="text" name="postalCode" value="${parameters.postalCode?if_exists}" /></td>
                            </tr>
                          </#if>
                          <#if extInfo=="T">
                            <tr>
                              <td colspan="3">
                                <hr />
                              </td>
                            </tr>
                            <tr>
                              <td class="label">${uiLabelMap.PartyCountryCode}</td>
                              <td><input type="text" name="countryCode" value="${parameters.countryCode?if_exists}" /></td>
                            </tr>
                            <tr>
                              <td class="label">${uiLabelMap.PartyAreaCode}</td>
                              <td><input type="text" name="areaCode" value="${parameters.areaCode?if_exists}" /></td>
                            </tr>
                            <tr>
                              <td class="label">${uiLabelMap.PartyContactNumber}</td>
                              <td><input type="text" name="contactNumber" value="${parameters.contactNumber?if_exists}" /></td>
                            </tr>
                          </#if>
                          <#if extInfo=="O">
                            <tr>
                              <td colspan="3">
                                <hr />
                              </td>
                            </tr>
                            <tr>
                              <td class="label">${uiLabelMap.PartyContactInformation}</td>
                              <td><input type="text" name="infoString" value="${parameters.infoString?if_exists}" /></td>
                            </tr>
                          </#if>
                          <tr>
                            <td>&nbsp;</td>
                            <td>
                              <input type="submit" value="${uiLabelMap.CommonFind}" onclick="javascript:document.lookupparty.submit();" />
                            </td>
                          </tr>
                        </table>
                      </form>
                  </div>
                  <script language="JavaScript" type="text/javascript">
                    document.lookupparty.partyId.focus();
                  </script>

                  
                    <#if hideFields !="Y">
                      <hr />
                    </#if>
                    <div id="findPartyResults">
                      <h2>${uiLabelMap.CommonSearchResults}</h2>
                    </div>
                    <#if partyList?has_content>
                      <table class="basic-table hover-bar" cellspacing="0">
                        <tr class="header-row-2">
                          <td style="font-size: 14px;">${uiLabelMap.PartyPartyId}</td>
                          <td style="font-size: 14px;">${uiLabelMap.PartyUserLogin}</td>
                          <td style="font-size: 14px;">${uiLabelMap.PartyName}</td>
                          <#if extInfo?default("")=="P">
                            <td style="font-size: 14px;">${uiLabelMap.PartyCity}</td>
                          </#if>
                          <#if extInfo?default("")=="P">
                            <td style="font-size: 14px;">${uiLabelMap.PartyPostalCode}</td>
                          </#if>
                          <#if extInfo?default("")=="T">
                            <td style="font-size: 14px;">${uiLabelMap.PartyAreaCode}</td>
                          </#if>
                          <#if inventoryItemId?default("") !="">
                            <td style="font-size: 14px;">${uiLabelMap.ProductInventoryItemId}</td>
                          </#if>
                          <#if serialNumber?default("") !="">
                            <td style="font-size: 14px;">${uiLabelMap.ProductSerialNumber}</td>
                          </#if>
                          <#if softIdentifier?default("") !="">
                            <td style="font-size: 14px;">${uiLabelMap.ProductSoftIdentifier}</td>
                          </#if>
                          <td style="font-size: 14px;">${uiLabelMap.PartyRelatedCompany}</td>
                          <td style="font-size: 14px;">${uiLabelMap.PartyType}</td>
                          <td style="font-size: 14px;">${uiLabelMap.PartyMainRole}</td>
                          <td>&nbsp;</td>
                        </tr>
                        <#assign alt_row=false>
                          <#assign rowCount=0>
                            <#list partyList as partyRow>
                              <#assign partyType=partyRow.getRelatedOne("PartyType")?if_exists>
                                <tr valign="middle" <#if alt_row> class="alternate-row"
                    </#if>>
                    <td><a href="<@ofbizUrl>viewprofile?partyId=${partyRow.partyId}</@ofbizUrl>">${partyRow.partyId}</a></td>
                    <td>
                      <#if partyRow.containsKey("userLoginId")>
                        ${partyRow.userLoginId?default("N/A")}
                        <#else>
                          <#assign userLogins=partyRow.getRelated("UserLogin")>
                            <#if (userLogins.size()> 0)>
                              <#if (userLogins.size()> 1)>
                                (${uiLabelMap.CommonMany})
                                <#else>
                                  <#assign userLogin=userLogins.get(0)>
                                    ${userLogin.userLoginId}
                              </#if>
                              <#else>
                                (${uiLabelMap.CommonNone})
                            </#if>
                      </#if>
                    </td>
                    <td>
                      <#if partyRow.getModelEntity().isField("lastName") && lastName?has_content>
                        ${partyRow.lastName}<#if partyRow.firstName?has_content>, ${partyRow.firstName}</#if>
                        <#elseif partyRow.getModelEntity().isField("groupName") && partyRow.groupName?has_content>
                          ${partyRow.groupName}
                          <#else>
                            <#assign partyName=Static["org.ofbiz.party.party.PartyHelper"].getPartyName(partyRow, true)>
                              <#if partyName?has_content>
                                ${partyName}
                                <#else>
                                  (${uiLabelMap.PartyNoNameFound})
                              </#if>
                      </#if>
                    </td>
                    <#if extInfo?default("")=="T">
                      <td>${partyRow.areaCode?if_exists}</td>
                    </#if>
                    <#if extInfo?default("")=="P">
                      <td>${partyRow.city?if_exists}, ${partyRow.stateProvinceGeoId?if_exists}</td>
                    </#if>
                    <#if extInfo?default("")=="P">
                      <td>${partyRow.postalCode?if_exists}</td>
                    </#if>
                    <#if inventoryItemId?default("") !="">
                      <td>${partyRow.inventoryItemId?if_exists}</td>
                    </#if>
                    <#if serialNumber?default("") !="">
                      <td>${partyRow.serialNumber?if_exists}</td>
                    </#if>
                    <#if softIdentifier?default("") !="">
                      <td>${partyRow.softIdentifier?if_exists}</td>
                    </#if>
                    <#if partyType?exists>
                      <td>
                        <#if partyType.partyTypeId?has_content && partyType.partyTypeId=="PERSON">
                          <#assign partyRelateCom=delegator.findByAnd("PartyRelationship", {"partyIdTo", partyRow.partyId,"roleTypeIdFrom","ACCOUNT","roleTypeIdTo","CONTACT"})>
                            <#if partyRelateCom?has_content>
                              <#list partyRelateCom as partyRelationship>
                                <#if partyRelationship.partyIdFrom?has_content>
                                  <#assign companyName=Static["org.ofbiz.party.party.PartyHelper"].getPartyName(delegator, partyRelationship.partyIdFrom, true)>
                                    ${companyName?if_exists}
                                </#if>
                              </#list>
                            </#if>
                        </#if>
                      </td>
                      <td>
                        <#if partyType.description?exists>${partyType.get("description", locale)}<#else>???</#if>
                      </td>
                      <#else>
                        <td></td>
                        <td></td>
                    </#if>
                    <td>
                      <#assign mainRole=dispatcher.runSync("getPartyMainRole", Static["org.ofbiz.base.util.UtilMisc"].toMap("partyId", partyRow.partyId, "userLogin" , userLogin)) />
                      ${mainRole.description?if_exists}
                    </td>
                    <td class="button-col align-float">
                      <#if partyRow.containsKey("userLoginId")>
                       <a href="#" data-partyId="${partyRow.partyId}" onclick="inhabilitarUsuario(event);">Inhabilitar</a>
                      <#else>
                        <#assign userLogins=partyRow.getRelated("UserLogin")>

                        <#if (userLogins.size()> 0)>
                          <#if userLogins.get(0).enabled?exists && userLogins.get(0).enabled == "N">
                            <a href="#" data-partyId="${partyRow.partyId}" class="button_disabled" onclick="inhabilitarUsuario(event, false)">Inhabilitado</a>
                            <a href="#" data-partyId="${partyRow.partyId}" onclick="habilitarUsuario(event)">Habilitar</a>
                          <#else>
                            <a href="#" data-partyId="${partyRow.partyId}" onclick="inhabilitarUsuario(event);">Inhabilitar</a>
                          </#if>
                        </#if>
                      </#if>

                      <a href="<@ofbizUrl>viewprofile?partyId=${partyRow.partyId}</@ofbizUrl>">${uiLabelMap.CommonDetails}</a>
                      <#if security.hasRolePermission("ORDERMGR", "_VIEW" , "" , "" , session)>
                        <form name="searchorders_o_${rowCount}" method="post" action="/ordermgr/control/searchorders">
                          <input type="hidden" name="lookupFlag" value="Y" />
                          <input type="hidden" name="hideFields" value="Y" />
                          <input type="hidden" name="partyId" value="${partyRow.partyId}" />
                          <input type="hidden" name="viewIndex" value="1" />
                          <input type="hidden" name="viewSize" value="20" />
                          <!-- <a href="javascript:document.searchorders_o_${rowCount}.submit()">${uiLabelMap.OrderOrders}</a> -->
                        </form>
                        <!-- <a href="/ordermgr/control/FindQuote?partyId=${partyRow.partyId + externalKeyParam}">${uiLabelMap.OrderOrderQuotes}</a> -->
                      </#if>
                      <#if security.hasEntityPermission("ORDERMGR", "_CREATE" , session)>
                        <!-- <a href="/ordermgr/control/checkinits?partyId=${partyRow.partyId + externalKeyParam}">${uiLabelMap.OrderNewOrder}</a> -->
                        <!-- <a href="/ordermgr/control/EditQuote?partyId=${partyRow.partyId + externalKeyParam}">${uiLabelMap.OrderNewQuote}</a> -->
                      </#if>
                    </td>
                    </tr>
                    <#assign rowCount=rowCount + 1>
                      <#-- toggle the row color -->
                        <#assign alt_row=!alt_row>
                          </#list>
                          </table>
                          <#else>
                            <div id="findPartyResults_2">
                              <h3>${uiLabelMap.PartyNoPartiesFound}</h3>
                            </div>
                  </#if>
                  <#if lookupErrorMessage?exists>
                    <h3>${lookupErrorMessage}</h3>
                  </#if>
                </div>
                </#if>
              </div>

<script>
  const input_rusp = document.getElementById('input_rusp');
  const input_userlogin = document.getElementById('input_userlogin');
  const input_firtsName = document.getElementById('input_firtsName');
  const input_lastName = document.getElementById('input_lastName');

  input_rusp.addEventListener('keyup', async function(event) {
    event.preventDefault();
    const value = this.value;

    if (value && value.length > 0) {
      if (value.length > 10) {
        alert("El campo RUSP no puede tener más de 10 caracteres");
        this.value = '';
        return false;
      }

      try {
        const response = await fetch(`http://localhost:3000/parties?partyId=`+value);
        const data = await response.json();
        
        input_userlogin.value = data?.user_login[0]?.user_login_id;
        input_firtsName.value = data.person.first_name;
        input_lastName.value = data.person.last_name;
      } catch (error) {
        console.error(error);
      }
    }
  });

  const inhabilitarUsuario = async (event, estaHabilitado = true) => {
    event.preventDefault();

    if (!estaHabilitado) {
      return false;
    }

    const partyId = event.target.dataset.partyid;

    if (partyId) {
      try {
        const response = await fetch(`http://localhost:3000/parties/` + partyId + `/users/desactivar`, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json'
          },
        });

        const data = await response.json();
        window.location.reload();
      } catch (error) {
        console.error(error);
      }
    }
  };

  const habilitarUsuario = async (event) => {
    event.preventDefault();
    const partyId = event.target.dataset.partyid;

    if (partyId) {
      try {
        const response = await fetch(`http://localhost:3000/parties/` + partyId + `/users/activar`, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json'
          },
        });

        const data = await response.json();
        window.location.reload();
      } catch (error) {
        console.error(error);
      }
    }
  };
</script>