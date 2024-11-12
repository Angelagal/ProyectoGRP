<@import location="component://opentaps-common/webapp/common/includes/lib/opentapsFormMacros.ftl"/>

<#-- TODO: probably some kind of permission checking to see that this userLogin can view such and such reports -->
<div class="tabletext" style="margin-bottom: 30px;">
<#-- ><h4>usuario:Admin contrase&ntildea:password</h4></br> -->
<#assign hostname = request.getServerName()/>
<table style="width: 100%;">
<tr>
  <td style="vertical-align: top; width: 35%;">

     <#-- CONTABLES HCGZ -->
    <@displayReportGroup group="CONAC_CONTABLES" nameOnly=true>
      <li>
                        <a href="http://30.0.0.71:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3AContables%3AEF0.prpt/viewer" target="_blank">
                            ${uiLabelMap.EF0}
                        </a>
                    </li>
                    <#--<li>
                        <a href="http://30.0.0.71:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3AContables%3AEF1.1%2BEstado%2Bde%2BSituaci%25C3%2583%25C2%25B3n%2BFinanciera.prpt/viewer" target="_blank">
                            EF1.1 Estado de Situacion Financiera
                        </a>
                    </li>
                    <li>
                        <a href="http://30.0.0.71:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3AContables%3AEF1.2%2BEstado%2Bde%2BSituacion%2BFinanciera%2BAnual.prpt/viewer" target="_blank">
                            ${uiLabelMap.AccountingEF1_2}
                        </a>
                    </li>
                    <li>
                        <a href="http://30.0.0.71:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3AContables%3AEF3.1%2BEstado%2Bde%2BActividades.prpt/viewer" target="_blank">
                            ${uiLabelMap.EF31}
                        </a>
                    </li>
                    <li>
                        <a href="http://30.0.0.71:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3AContables%3AEF3.2%2BEstado%2Bde%2BActividades%2BAnual.prpt/viewer" target="_blank">
                            ${uiLabelMap.EF32}
                        </a>
                    </li>-->     
    </@displayReportGroup>

  </td>
</tr>

</table>
</div>