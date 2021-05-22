<cfquery datasource="sample" name="delete">
select employee.login_id
from employee
join suggestion
on employee.login_id = suggestion.login_id
where 
suggestion_id = #suggestion_id#
</cfquery>


<cfif "#cookie.c_authority_id#" EQ 1 || "#cookie.clogin_id#" EQ "#delete.login_id#">

 
<cfquery datasource="sample">
    delete from suggestion
    where suggestion_id = #suggestion_id#
</cfquery>

<cflocation  url="./top.cfm">



<cfelse>

    <meta http-equiv="refresh" content="0;url=deleteBut.cfm?badDelete=yes">

</cfif>





