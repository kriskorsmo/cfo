<cfcomponent>

   <cfset THIS.name = "CFO" />
   <cfset THIS.clientManagement = true />
   <cfset THIS.sessionManagement = true />
   <cfset THIS.setClientCookies = true />
   <cfset THIS.sessionTimeout = createTimespan( 0, 1, 0, 0 ) />
   <cfset THIS.datasource = "CFO" />

   <cffunction name="onApplicationStart">
      <cfreturn true />
   </cffunction>

</cfcomponent>