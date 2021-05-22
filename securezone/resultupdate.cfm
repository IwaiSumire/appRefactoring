<cfdump var="#form#">

<cfif "#cookie.c_authority_id#" EQ 3 >

     <meta http-equiv="refresh" content="0;url=resultupdateBut.cfm?badChange=yes">
    
     <cfelse>
          <cfquery datasource="sample">
               update suggestion
               set result_id = #result_id#
               where suggestion_id = #suggestion_id#
          </cfquery>


      <cflocation  url="./top.cfm">リダイレクト--->

           
</cfif>



