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

<#if party?exists>
<#-- Main Heading -->
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td>
      <h2>${uiLabelMap.PartyTheProfileOf}
          <#if person?exists>
          ${person.personalTitle?if_exists}
          ${person.firstName?if_exists}
          ${person.middleName?if_exists}
          ${person.lastName?if_exists}
          ${person.suffix?if_exists}
        <#else>
          "${uiLabelMap.PartyNewUser}"
        </#if>
      </h2>
    </td>
    <td align="right">
      <#if showOld>
        <a href="<@ofbizUrl>viewprofile</@ofbizUrl>" class="button">${uiLabelMap.PartyHideOld}</a>
      <#else>
      <a href="<@ofbizUrl>viewprofile?SHOW_OLD=true</@ofbizUrl>" class="button">${uiLabelMap.PartyShowOld}</a>
      </#if>
      <#if (productStore.enableDigProdUpload)?if_exists == "Y">
        <a href="<@ofbizUrl>digitalproductlist</@ofbizUrl>" class="button">${uiLabelMap.EcommerceDigitalProductUpload}</a>
      </#if>
    </td>
  </tr>
</table>

<div class="screenlet">
  <div class="boxlink">
    <a href="<@ofbizUrl>editperson</@ofbizUrl>" class="submenutextright">
    <#if person?exists>${uiLabelMap.CommonUpdate}<#else>${uiLabelMap.CommonCreate}</#if></a>
  </div>
 <h3>${uiLabelMap.PartyPersonalInformation}</h3>
  <div class="screenlet-body">
    <#if person?exists>
    <div>
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="right">${uiLabelMap.PartyName}</td>
          <td>
              ${person.personalTitle?if_exists}
              ${person.firstName?if_exists}
              ${person.middleName?if_exists}
              ${person.lastName?if_exists}
              ${person.suffix?if_exists}
          </td>
        </tr>
      <#if person.nickname?has_content><tr><td align="right">${uiLabelMap.PartyNickName}</td><td>${person.nickname}</td></tr></#if>
      <#if person.gender?has_content><tr><td align="right">${uiLabelMap.PartyGender}</td><td>${person.gender}</td></tr></#if>
      <#if person.birthDate?exists><tr><td align="right">${uiLabelMap.PartyBirthDate}</td><td>${person.birthDate.toString()}</td></tr></#if>
      <#if person.height?exists><tr><td align="right">${uiLabelMap.PartyHeight}</td><td>${person.height}</td></tr></#if>
      <#if person.weight?exists><tr><td align="right">${uiLabelMap.PartyWeight}</td><td>${person.weight}</td></tr></#if>
      <#if person.mothersMaidenName?has_content><tr><td align="right">${uiLabelMap.PartyMaidenName}</td><td>${person.mothersMaidenName}</td></tr></#if>
      <#if person.maritalStatus?has_content><tr><td align="right">${uiLabelMap.PartyMaritalStatus}</td><td>${person.maritalStatus}</td></tr></#if>
      <#if person.socialSecurityNumber?has_content><tr><td align="right">${uiLabelMap.PartySocialSecurityNumber}</td><td>${person.socialSecurityNumber}</td></tr></#if>
      <#if person.passportNumber?has_content><tr><td align="right">${uiLabelMap.PartyPassportNumber}</td><td>${person.passportNumber}</td></tr></#if>
      <#if person.passportExpireDate?exists><tr><td align="right">${uiLabelMap.PartyPassportExpireDate}</td><td>${person.passportExpireDate.toString()}</td></tr></#if>
      <#if person.totalYearsWorkExperience?exists><tr><td align="right">${uiLabelMap.PartyYearsWork}</td><td>${person.totalYearsWorkExperience}</td></tr></#if>
      <#if person.comments?has_content><tr><td align="right">${uiLabelMap.CommonComments}</td><td>${person.comments}</td></tr></#if>
      </table>
    </div>
    <#else>
      <label>${uiLabelMap.PartyPersonalInformationNotFound}</label>
    </#if>
  </div>
</div>

<#-- ============================================================= -->
<#if monthsToInclude?exists && totalSubRemainingAmount?exists && totalOrders?exists>
<div class="screenlet">
  <h3>${uiLabelMap.EcommerceLoyaltyPoints}</h3>
  <div class="screenlet-body">
    <label>${uiLabelMap.EcommerceYouHave} ${totalSubRemainingAmount} ${uiLabelMap.EcommercePointsFrom} ${totalOrders} ${uiLabelMap.EcommerceOrderInLast} ${monthsToInclude} ${uiLabelMap.EcommerceMonths}</label>
  </div>
</div>
</#if>

<#-- ============================================================= -->
<div class="screenlet">
  <div class="boxlink">
    <a href="<@ofbizUrl>editcontactmech</@ofbizUrl>" class="submenutextright">${uiLabelMap.CommonCreateNew}</a>
  </div>
  <h3>${uiLabelMap.PartyContactInformation}</h3>
  <div class="screenlet-body">
  <#if partyContactMechValueMaps?has_content>
    <table width="100%" border="0" cellpadding="0">
      <tr valign="bottom">
        <th>${uiLabelMap.PartyContactType}</th>
        <th></th>
        <th>${uiLabelMap.CommonInformation}</th>
        <th colspan="2">${uiLabelMap.PartySolicitingOk}?</th>
        <th></th>
        <th></th>
      </tr>
      <#list partyContactMechValueMaps as partyContactMechValueMap>
        <#assign contactMech = partyContactMechValueMap.contactMech?if_exists />
        <#assign contactMechType = partyContactMechValueMap.contactMechType?if_exists />
        <#assign partyContactMech = partyContactMechValueMap.partyContactMech?if_exists />
          <tr><td colspan="7"></td></tr>
          <tr>
            <td align="right" valign="top">
              ${contactMechType.get("description",locale)}
            </td>
            <td>&nbsp;</td>
            <td valign="top">
              <#list partyContactMechValueMap.partyContactMechPurposes?if_exists as partyContactMechPurpose>
                <#assign contactMechPurposeType = partyContactMechPurpose.getRelatedOneCache("ContactMechPurposeType") />
                <div class="tabletext">
                  <#if contactMechPurposeType?exists>
                    ${contactMechPurposeType.get("description",locale)}
                    <#if contactMechPurposeType.contactMechPurposeTypeId == "SHIPPING_LOCATION" && (profiledefs.defaultShipAddr)?default("") == contactMech.contactMechId>
                      <span class="buttontextdisabled">${uiLabelMap.EcommerceIsDefault}</span>
                    <#elseif contactMechPurposeType.contactMechPurposeTypeId == "SHIPPING_LOCATION">
                      <form name="defaultShippingAddressForm" method="post" action="<@ofbizUrl>setprofiledefault/viewprofile</@ofbizUrl>">
                        <input type="hidden" name="productStoreId" value="${productStoreId}" />
                        <input type="hidden" name="defaultShipAddr" value="${contactMech.contactMechId}" />
                        <input type="hidden" name="partyId" value="${party.partyId}" />
                        <input type="submit" value="${uiLabelMap.EcommerceSetDefault}" class="button" />
                      </form>
                    </#if>
                  <#else>
                    ${uiLabelMap.PartyPurposeTypeNotFound}: "${partyContactMechPurpose.contactMechPurposeTypeId}"
                  </#if>
                  <#if partyContactMechPurpose.thruDate?exists>(${uiLabelMap.CommonExpire}:${partyContactMechPurpose.thruDate.toString()})</#if>
                </div>
              </#list>
              <#if contactMech.contactMechTypeId?if_exists = "POSTAL_ADDRESS">
                <#assign postalAddress = partyContactMechValueMap.postalAddress?if_exists />
                <div class="tabletext">
                  <#if postalAddress?exists>
                    <#if postalAddress.toName?has_content>${uiLabelMap.CommonTo}: ${postalAddress.toName}<br /></#if>
                    <#if postalAddress.attnName?has_content>${uiLabelMap.PartyAddrAttnName}: ${postalAddress.attnName}<br /></#if>
                    ${postalAddress.address1}<br />
                    <#if postalAddress.address2?has_content>${postalAddress.address2}<br /></#if>
                    ${postalAddress.city}<#if postalAddress.stateProvinceGeoId?has_content>,&nbsp;${postalAddress.stateProvinceGeoId}</#if>&nbsp;${postalAddress.postalCode?if_exists}
                    <#if postalAddress.countryGeoId?has_content><br />${postalAddress.countryGeoId}</#if>
                    <#if (!postalAddress.countryGeoId?has_content || postalAddress.countryGeoId?if_exists = "USA")>
                      <#assign addr1 = postalAddress.address1?if_exists />
                      <#if (addr1.indexOf(" ") > 0)>
                        <#assign addressNum = addr1.substring(0, addr1.indexOf(" ")) />
                        <#assign addressOther = addr1.substring(addr1.indexOf(" ")+1) />
                        <a target="_blank" href="${uiLabelMap.CommonLookupWhitepagesAddressLink}" class="linktext">(${uiLabelMap.CommonLookupWhitepages})</a>
                      </#if>
                    </#if>
                  <#else>
                    ${uiLabelMap.PartyPostalInformationNotFound}.
                  </#if>
                  </div>
              <#elseif contactMech.contactMechTypeId?if_exists = "TELECOM_NUMBER">
                <#assign telecomNumber = partyContactMechValueMap.telecomNumber?if_exists>
                <div class="tabletext">
                <#if telecomNumber?exists>
                  ${telecomNumber.countryCode?if_exists}
                  <#if telecomNumber.areaCode?has_content>${telecomNumber.areaCode}-</#if>${telecomNumber.contactNumber?if_exists}
                  <#if partyContactMech.extension?has_content>ext&nbsp;${partyContactMech.extension}</#if>
                  <#if (!telecomNumber.countryCode?has_content || telecomNumber.countryCode = "011")>
                    <a target="_blank" href="${uiLabelMap.CommonLookupAnywhoLink}" class="linktext">${uiLabelMap.CommonLookupAnywho}</a>
                    <a target="_blank" href="${uiLabelMap.CommonLookupWhitepagesTelNumberLink}" class="linktext">${uiLabelMap.CommonLookupWhitepages}</a>
                  </#if>
                <#else>
                  ${uiLabelMap.PartyPhoneNumberInfoNotFound}.
                </#if>
                </div>
              <#elseif contactMech.contactMechTypeId?if_exists = "EMAIL_ADDRESS">
                  ${contactMech.infoString}
                  <a href="mailto:${contactMech.infoString}" class="linktext">(${uiLabelMap.PartySendEmail})</a>
              <#elseif contactMech.contactMechTypeId?if_exists = "WEB_ADDRESS">
                <div class="tabletext">
                  ${contactMech.infoString}
                  <#assign openAddress = contactMech.infoString?if_exists />
                  <#if !openAddress.startsWith("http") && !openAddress.startsWith("HTTP")><#assign openAddress = "http://" + openAddress /></#if>
                  <a target="_blank" href="${openAddress}" class="linktext">(${uiLabelMap.CommonOpenNewWindow})</a>
                </div>
              <#else>
                ${contactMech.infoString?if_exists}
              </#if>
              <div class="tabletext">(${uiLabelMap.CommonUpdated}:&nbsp;${partyContactMech.fromDate.toString()})</div>
              <#if partyContactMech.thruDate?exists><div class="tabletext">${uiLabelMap.CommonDelete}:&nbsp;${partyContactMech.thruDate.toString()}</div></#if>
            </td>
            <td align="center" valign="top"><div class="tabletext">(${partyContactMech.allowSolicitation?if_exists})</div></td>
            <td>&nbsp;</td>
            <td align="right" valign="top">
              <a href="<@ofbizUrl>editcontactmech?contactMechId=${contactMech.contactMechId}</@ofbizUrl>" class="button">${uiLabelMap.CommonUpdate}</a>
            </td>
            <td align="right" valign="top">
              <form name= "deleteContactMech_${contactMech.contactMechId}" method= "post" action= "<@ofbizUrl>deleteContactMech</@ofbizUrl>">
                <div>
                <input type= "hidden" name= "contactMechId" value= "${contactMech.contactMechId}"/>
                <a href='javascript:document.deleteContactMech_${contactMech.contactMechId}.submit()' class='button'>${uiLabelMap.CommonExpire}</a>
              </div>
              </form>
            </td>
          </tr>
      </#list>
    </table>
  <#else>
    <label>${uiLabelMap.PartyNoContactInformation}.</label><br />
  </#if>
  </div>
</div>

<#-- ============================================================= -->

<div class="screenlet">
  <div class="boxlink">
    <a href="<@ofbizUrl>editcreditcard</@ofbizUrl>" class="submenutext">${uiLabelMap.PartyCreateNewCreditCard}</a><a href="<@ofbizUrl>editgiftcard</@ofbizUrl>" class="submenutext">${uiLabelMap.PartyCreateNewGiftCard}</a><a href="<@ofbizUrl>editeftaccount</@ofbizUrl>" class="submenutextright">${uiLabelMap.PartyCreateNewEftAccount}</a>
  </div>
  <h3>${uiLabelMap.AccountingPaymentMethodInformation}</h3>
  <div class="screenlet-body">
    <table width="100%" border="0" cellpadding="1">
      <tr>
        <td>
          <#if paymentMethodValueMaps?has_content>
          <table width="100%" cellpadding="2" cellspacing="0" border="0">
            <#list paymentMethodValueMaps as paymentMethodValueMap>
              <#assign paymentMethod = paymentMethodValueMap.paymentMethod?if_exists />
              <#assign creditCard = paymentMethodValueMap.creditCard?if_exists />
              <#assign giftCard = paymentMethodValueMap.giftCard?if_exists />
              <#assign eftAccount = paymentMethodValueMap.eftAccount?if_exists />
              <tr>
                <#if paymentMethod.paymentMethodTypeId?if_exists == "CREDIT_CARD">
                <td valign="top">
                  <div class="tabletext">
                    ${uiLabelMap.AccountingCreditCard}:
                    <#if creditCard.companyNameOnCard?has_content>${creditCard.companyNameOnCard}&nbsp;</#if>
                    <#if creditCard.titleOnCard?has_content>${creditCard.titleOnCard}&nbsp;</#if>
                    ${creditCard.firstNameOnCard}&nbsp;
                    <#if creditCard.middleNameOnCard?has_content>${creditCard.middleNameOnCard}&nbsp;</#if>
                    ${creditCard.lastNameOnCard}
                    <#if creditCard.suffixOnCard?has_content>&nbsp;${creditCard.suffixOnCard}</#if>
                    &nbsp;${Static["org.ofbiz.party.contact.ContactHelper"].formatCreditCard(creditCard)}
                    <#if paymentMethod.description?has_content>(${paymentMethod.description})</#if>
                    <#if paymentMethod.fromDate?has_content>(${uiLabelMap.CommonUpdated}:&nbsp;${paymentMethod.fromDate.toString()})</#if>
                    <#if paymentMethod.thruDate?exists>(${uiLabelMap.CommonDelete}:&nbsp;${paymentMethod.thruDate.toString()})</#if>
                  </div>
                </td>
                <td>&nbsp;</td>
                <td align="right" valign="top">
                  <a href="<@ofbizUrl>editcreditcard?paymentMethodId=${paymentMethod.paymentMethodId}</@ofbizUrl>" class="button">
                            ${uiLabelMap.CommonUpdate}</a>
                </td>
                <#elseif paymentMethod.paymentMethodTypeId?if_exists == "GIFT_CARD">
                  <#if giftCard?has_content && giftCard.cardNumber?has_content>
                    <#assign giftCardNumber = "" />
                    <#assign pcardNumber = giftCard.cardNumber />
                    <#if pcardNumber?has_content>
                      <#assign psize = pcardNumber?length - 4 />
                      <#if (0 < psize)>
                        <#list 0 .. psize-1 as foo>
                          <#assign giftCardNumber = giftCardNumber + "*" />
                        </#list>
                         <#assign giftCardNumber = giftCardNumber + pcardNumber[psize .. psize + 3] />
                      <#else>
                         <#assign giftCardNumber = pcardNumber />
                      </#if>
                    </#if>
                  </#if>

                  <td valign="top">
                    <div class="tabletext">
                      ${uiLabelMap.AccountingGiftCard}: ${giftCardNumber}
                      <#if paymentMethod.description?has_content>(${paymentMethod.description})</#if>
                      <#if paymentMethod.fromDate?has_content>(${uiLabelMap.CommonUpdated}:&nbsp;${paymentMethod.fromDate.toString()})</#if>
                      <#if paymentMethod.thruDate?exists>(${uiLabelMap.CommonDelete}:&nbsp;${paymentMethod.thruDate.toString()})</#if>
                    </div>
                  </td>
                  <td >&nbsp;</td>
                  <td align="right" valign="top">
                    <a href="<@ofbizUrl>editgiftcard?paymentMethodId=${paymentMethod.paymentMethodId}</@ofbizUrl>" class="button">
                            ${uiLabelMap.CommonUpdate}</a>
                  </td>
                  <#elseif paymentMethod.paymentMethodTypeId?if_exists == "EFT_ACCOUNT">
                  <td valign="top">
                    <div class="tabletext">
                      ${uiLabelMap.AccountingEFTAccount}: ${eftAccount.nameOnAccount?if_exists} - <#if eftAccount.bankName?has_content>${uiLabelMap.AccountingBank}: ${eftAccount.bankName}</#if> <#if eftAccount.accountNumber?has_content>${uiLabelMap.AccountingAccount} #: ${eftAccount.accountNumber}</#if>
                      <#if paymentMethod.description?has_content>(${paymentMethod.description})</#if>
                      <#if paymentMethod.fromDate?has_content>(${uiLabelMap.CommonUpdated}:&nbsp;${paymentMethod.fromDate.toString()})</#if>
                      <#if paymentMethod.thruDate?exists>(${uiLabelMap.CommonDelete}:&nbsp;${paymentMethod.thruDate.toString()})</#if>
                    </div>
                  </td>
                  <td>&nbsp;</td>
                  <td align="right" valign="top">
                    <a href="<@ofbizUrl>editeftaccount?paymentMethodId=${paymentMethod.paymentMethodId}</@ofbizUrl>" class="button">
                            ${uiLabelMap.CommonUpdate}</a>
                  </td>
                </#if>
                <td align="right" valign="top">
                 <a href="<@ofbizUrl>deletePaymentMethod/viewprofile?paymentMethodId=${paymentMethod.paymentMethodId}</@ofbizUrl>" class="button">
                        ${uiLabelMap.CommonExpire}</a>
                </td>
                <td align="right" valign="top">
                  <#if (profiledefs.defaultPayMeth)?default("") == paymentMethod.paymentMethodId>
                    <span class="buttontextdisabled">${uiLabelMap.EcommerceIsDefault}</span>
                  <#else>
                    <form name="defaultPaymentMethodForm" method="post" action="<@ofbizUrl>setprofiledefault/viewprofile</@ofbizUrl>">
                      <input type="hidden" name="productStoreId" value="${productStoreId}" />
                      <input type="hidden" name="defaultPayMeth" value="${paymentMethod.paymentMethodId}" />
                      <input type="hidden" name="partyId" value="${party.partyId}" />
                      <input type="submit" value="${uiLabelMap.EcommerceSetDefault}" class="button" />
                    </form>
                  </#if>
                </td>
              </tr>
            </#list>
          </table>
          <#else>
            ${uiLabelMap.AccountingNoPaymentMethodInformation}.
          </#if>
        </td>
      </tr>
    </table>
  </div>
</div>

<#-- ============================================================= -->
<div class="screenlet">
  <h3>${uiLabelMap.PartyTaxIdentification}</h3>
  <div class="screenlet-body">
    <form method="post" action="<@ofbizUrl>createCustomerTaxAuthInfo</@ofbizUrl>" name="createCustTaxAuthInfoForm">
      <div>
      <input type="hidden" name="partyId" value="${party.partyId}"/>
      ${screens.render("component://order/widget/ordermgr/OrderEntryOrderScreens.xml#customertaxinfo")}
      <input type="submit" value="${uiLabelMap.CommonAdd}" class="smallSubmit"/>
      </div>
    </form>
  </div>
</div>

<#-- ============================================================= -->
<div class="screenlet">
  <div class="boxlink">
    <a href="<@ofbizUrl>changepassword</@ofbizUrl>" class="submenutextright">${uiLabelMap.PartyChangePassword}</a>
  </div>
  <h3>${uiLabelMap.CommonUsername} &amp; ${uiLabelMap.CommonPassword}</h3>
  <div class="screenlet-body">
    <table width="100%" border="0" cellpadding="1">
      <tr>
        <td align="right" valign="top">${uiLabelMap.CommonUsername}</td>
        <td>&nbsp;</td>
        <td valign="top">${userLogin.userLoginId}</td>
      </tr>
    </table>
  </div>
</div>

<#-- ============================================================= -->
<form name="setdefaultshipmeth" action="<@ofbizUrl>setprofiledefault/viewprofile</@ofbizUrl>" method="post">
<div>
  <input type="hidden" name="productStoreId" value="${productStoreId}" />
  <div class="screenlet">
    <div class="boxlink">
      <#if profiledefs?has_content && profiledefs.defaultShipAddr?has_content && carrierShipMethods?has_content><a href="javascript:document.setdefaultshipmeth.submit();" class="submenutextright">${uiLabelMap.EcommerceSetDefault}</a></#if>
    </div>
    <h3>${uiLabelMap.EcommerceDefaultShipmentMethod}</h3>
    <div class="screenlet-body">
      <table width="100%" border="0" cellpadding="1">
        <#if profiledefs?has_content && profiledefs.defaultShipAddr?has_content && carrierShipMethods?has_content>
          <#list carrierShipMethods as shipMeth>
            <#assign shippingMethod = shipMeth.shipmentMethodTypeId + "@" + shipMeth.partyId />
            <tr>
              <td>&nbsp;</td>
              <td>
                <div class="tabletext"><span style="white-space:;"><#if shipMeth.partyId != "_NA_">${shipMeth.partyId?if_exists}&nbsp;</#if>${shipMeth.get("description",locale)?if_exists}</span></div>
              </td>
              <td><input type="radio" name="defaultShipMeth" value="${shippingMethod}" <#if profiledefs.defaultShipMeth?default("") == shippingMethod>checked="checked"</#if> /></td>
            </tr>
          </#list>
        <#else>
        <tr><td>${uiLabelMap.EcommerceDefaultShipmentMethodMsg}</td></tr>
        </#if>
      </table>
    </div>
  </div>
</div>
</form>

<#-- ============================================================= -->
<div class="screenlet">
  <h3>${uiLabelMap.EcommerceFileManager}</h3>
  <div class="screenlet-body">
   <table width="100%" border="0" cellpadding="1">
      <#if partyContent?has_content>
        <#list partyContent as contentRole>
        <#assign content = contentRole.getRelatedOne("Content") />
        <#assign contentType = content.getRelatedOneCache("ContentType") />
        <#assign mimeType = content.getRelatedOneCache("MimeType")?if_exists />
        <#assign status = content.getRelatedOneCache("StatusItem") />
          <tr>
            <td><a href="<@ofbizUrl>img/${content.contentName?if_exists}?imgId=${content.dataResourceId?if_exists}</@ofbizUrl>" class="button">${content.contentId}</a></td>
            <td>${content.contentName?if_exists}</td>
            <td>${(contentType.get("description",locale))?if_exists}</td>
            <td>${mimeType?if_exists.description?if_exists}</td>
            <td>${(status.get("description",locale))?if_exists}</td>
            <td>${contentRole.fromDate?if_exists}</td>
            <td align="right">
              <a href="<@ofbizUrl>img/${content.contentName?if_exists}?imgId=${content.dataResourceId?if_exists}</@ofbizUrl>" class="button">${uiLabelMap.CommonView}</a>
              <a href="<@ofbizUrl>removePartyAsset?contentId=${contentRole.contentId}&amp;partyId=${contentRole.partyId}&amp;roleTypeId=${contentRole.roleTypeId}</@ofbizUrl>" class="button">${uiLabelMap.CommonRemove}</a>
            </td>
          </tr>
        </#list>
      <#else>
         <tr><td>${uiLabelMap.EcommerceNoFiles}</td></tr>
      </#if>
    </table>
    <div>&nbsp;</div>
    <label>${uiLabelMap.EcommerceUploadNewFile}</label>
    <div>
      <form method="post" enctype="multipart/form-data" action="<@ofbizUrl>uploadPartyContent</@ofbizUrl>">
      <div>
        <input type="hidden" name="partyId" value="${party.partyId}"/>
        <input type="hidden" name="dataCategoryId" value="PERSONAL"/>
        <input type="hidden" name="contentTypeId" value="DOCUMENT"/>
        <input type="hidden" name="statusId" value="CTNT_PUBLISHED"/>
        <input type="hidden" name="roleTypeId" value="OWNER"/>
        <input type="file" name="uploadedFile" size="50" class="inputBox"/>
        <select name="partyContentTypeId" class="selectBox">
          <option value="">${uiLabelMap.PartySelectPurpose}</option>
          <#list partyContentTypes as partyContentType>
            <option value="${partyContentType.partyContentTypeId}">${partyContentType.get("description", locale)?default(partyContentType.partyContentTypeId)}</option>
          </#list>
        </select>
        <select name="mimeTypeId" class="selectBox">
          <option value="">${uiLabelMap.PartySelectMimeType}</option>
          <#list mimeTypes as mimeType>
            <option value="${mimeType.mimeTypeId}">${mimeType.get("description", locale)?default(mimeType.mimeTypeId)}</option>
          </#list>
        </select>
        <input type="submit" value="${uiLabelMap.CommonUpload}" class="smallSubmit"/>
        </div>
      </form>
    </div>
  </div>
</div>

<#-- ============================================================= -->
<div class="screenlet">
  <h3>${uiLabelMap.PartyContactLists}</h3>
  <div class="screenlet-body">
    <table width="100%" border="0" cellpadding="1" cellspacing="0">
      <tr>
        <th>${uiLabelMap.EcommerceListName}</th>
        <#-- <th >${uiLabelMap.OrderListType}</th> -->
        <th>${uiLabelMap.CommonFromDate}</th>
        <th>${uiLabelMap.CommonThruDate}</th>
        <th>${uiLabelMap.CommonStatus}</th>
        <th>${uiLabelMap.CommonEmail}</th>
        <th>&nbsp;</th>
        <th>&nbsp;</th>
      </tr>
      <#list contactListPartyList as contactListParty>
      <#assign contactList = contactListParty.getRelatedOne("ContactList")?if_exists />
      <#assign statusItem = contactListParty.getRelatedOneCache("StatusItem")?if_exists />
      <#assign emailAddress = contactListParty.getRelatedOneCache("PreferredContactMech")?if_exists />
      <#-- <#assign contactListType = contactList.getRelatedOneCache("ContactListType")/> -->
      <tr><td colspan="7"></td></tr>
      <tr>
        <td>${contactList.contactListName?if_exists}<#if contactList.description?has_content>&nbsp;-&nbsp;${contactList.description}</#if></td>
        <#-- <td><div class="tabletext">${contactListType.get("description",locale)?if_exists}</div></td> -->
        <td>${contactListParty.fromDate?if_exists}</td>
        <td>${contactListParty.thruDate?if_exists}</td>
        <td>${(statusItem.get("description",locale))?if_exists}</td>
        <td>${emailAddress.infoString?if_exists}</td>
        <td>&nbsp;</td>
        <td>
          <#if (contactListParty.statusId?if_exists == "CLPT_ACCEPTED")>            
            <form method="post" action="<@ofbizUrl>updateContactListParty</@ofbizUrl>" name="clistRejectForm${contactListParty_index}">
            <div>
              <#assign productStoreId = Static["org.ofbiz.product.store.ProductStoreWorker"].getProductStoreId(request) />
              <input type="hidden" name="productStoreId" value="${productStoreId?if_exists}" />
              <input type="hidden" name="partyId" value="${party.partyId}"/>
              <input type="hidden" name="contactListId" value="${contactListParty.contactListId}"/>
              <input type="hidden" name="fromDate" value="${contactListParty.fromDate}"/>
              <input type="hidden" name="statusId" value="CLPT_REJECTED"/>
              <input type="submit" value="${uiLabelMap.EcommerceUnsubscribe}" class="smallSubmit"/>
              </div>
            </form>
          <#elseif (contactListParty.statusId?if_exists == "CLPT_PENDING")>
            <form method="post" action="<@ofbizUrl>updateContactListParty</@ofbizUrl>" name="clistAcceptForm${contactListParty_index}">
            <div>
              <input type="hidden" name="partyId" value="${party.partyId}"/>
              <input type="hidden" name="contactListId" value="${contactListParty.contactListId}"/>
              <input type="hidden" name="fromDate" value="${contactListParty.fromDate}"/>
              <input type="hidden" name="statusId" value="CLPT_ACCEPTED"/>
              <input type="text" size="10" name="optInVerifyCode" value="" class="inputBox"/>
              <input type="submit" value="${uiLabelMap.EcommerceVerifySubscription}" class="smallSubmit"/>
              </div>
            </form>
          <#elseif (contactListParty.statusId?if_exists == "CLPT_REJECTED")>
            <form method="post" action="<@ofbizUrl>updateContactListParty</@ofbizUrl>" name="clistPendForm${contactListParty_index}">
            <div>
              <input type="hidden" name="partyId" value="${party.partyId}"/>
              <input type="hidden" name="contactListId" value="${contactListParty.contactListId}"/>
              <input type="hidden" name="fromDate" value="${contactListParty.fromDate}"/>
              <input type="hidden" name="statusId" value="CLPT_PENDING"/>
              <input type="submit" value="${uiLabelMap.EcommerceSubscribe}" class="smallSubmit"/>
              </div>
            </form>
          </#if>
        </td>
      </tr>
      </#list>
    </table>
    <div>
      <form method="post" action="<@ofbizUrl>createContactListParty</@ofbizUrl>" name="clistPendingForm">
        <div>
        <input type="hidden" name="partyId" value="${party.partyId}"/>
        <input type="hidden" name="statusId" value="CLPT_PENDING"/>
        <span class="tableheadtext">${uiLabelMap.EcommerceNewListSubscription}: </span>
        <select name="contactListId" class="selectBox">
          <#list publicContactLists as publicContactList>
            <#-- <#assign publicContactListType = publicContactList.getRelatedOneCache("ContactListType")> -->
            <#assign publicContactMechType = publicContactList.getRelatedOneCache("ContactMechType")?if_exists />
            <option value="${publicContactList.contactListId}">${publicContactList.contactListName?if_exists} <#-- ${publicContactListType.get("description",locale)} --> <#if publicContactMechType?has_content>[${publicContactMechType.get("description",locale)}]</#if></option>
          </#list>
        </select>
        <select name="preferredContactMechId" class="selectBox">
        <#-- <option></option> -->
          <#list partyAndContactMechList as partyAndContactMech>
            <option value="${partyAndContactMech.contactMechId}"><#if partyAndContactMech.infoString?has_content>${partyAndContactMech.infoString}<#elseif partyAndContactMech.tnContactNumber?has_content>${partyAndContactMech.tnCountryCode?if_exists}-${partyAndContactMech.tnAreaCode?if_exists}-${partyAndContactMech.tnContactNumber}<#elseif partyAndContactMech.paAddress1?has_content>${partyAndContactMech.paAddress1}, ${partyAndContactMech.paAddress2?if_exists}, ${partyAndContactMech.paCity?if_exists}, ${partyAndContactMech.paStateProvinceGeoId?if_exists}, ${partyAndContactMech.paPostalCode?if_exists}, ${partyAndContactMech.paPostalCodeExt?if_exists} ${partyAndContactMech.paCountryGeoId?if_exists}</#if></option>
          </#list>
        </select>
        <input type="submit" value="${uiLabelMap.EcommerceSubscribe}" class="smallSubmit"/>
        </div>
      </form>
    </div>
    <label>${uiLabelMap.EcommerceListNote}</label>
  </div>
</div>

<#-- ============================================================= -->
<#if surveys?has_content>
<div class="screenlet">
  <h3>${uiLabelMap.EcommerceSurveys}</h3>
  <div class="screenlet-body">
    <table width="100%" border="0" cellpadding="1">
      <#list surveys as surveyAppl>
        <#assign survey = surveyAppl.getRelatedOne("Survey") />
        <tr>
          <td>&nbsp;</td>
          <td valign="top"><div class="tabletext">${survey.surveyName?if_exists}&nbsp;-&nbsp;${survey.description?if_exists}</div></td>
          <td>&nbsp;</td>
          <td valign="top">
            <#assign responses = Static["org.ofbiz.product.store.ProductStoreWorker"].checkSurveyResponse(request, survey.surveyId)?default(0)>
            <#if (responses < 1)>${uiLabelMap.EcommerceNotCompleted}<#else>${uiLabelMap.EcommerceCompleted}</#if>
          </td>
          <#if (responses == 0 || survey.allowMultiple?default("N") == "Y")>
            <#assign surveyLabel = uiLabelMap.EcommerceTakeSurvey />
            <#if (responses > 0 && survey.allowUpdate?default("N") == "Y")>
              <#assign surveyLabel = uiLabelMap.EcommerceUpdateSurvey />
            </#if>
            <td align="right"><a href="<@ofbizUrl>takesurvey?productStoreSurveyId=${surveyAppl.productStoreSurveyId}</@ofbizUrl>" class="button">${surveyLabel}</a></td>
          <#else>
          &nbsp;
          </#if>
        </tr>
      </#list>
    </table>
  </div>
</div>
</#if>

<#-- ============================================================= -->
<#-- only 5 messages will show; edit the ViewProfile.groovy to change this number -->
${screens.render("component://ecommerce/widget/CustomerScreens.xml#messagelist-include")}

${screens.render("component://ecommerce/widget/CustomerScreens.xml#FinAccountList-include")}

<#-- Serialized Inventory Summary -->
${screens.render('component://ecommerce/widget/CustomerScreens.xml#SerializedInventorySummary')}

<#-- Subscription Summary -->
${screens.render('component://ecommerce/widget/CustomerScreens.xml#SubscriptionSummary')}

<#else>
    <h3>${uiLabelMap.PartyNoPartyForCurrentUserName}: ${userLogin.userLoginId}</h3>
</#if>
