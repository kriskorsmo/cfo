<cfcomponent output="false">

   <!---- init ---->
   <cffunction name="init" returntype="any">
      <cfreturn this />
   </cffunction>

   <!---- create ---->
   <cffunction name="create" returntype="any">
      <cfargument name="firstName" type="string" required="false" />
      <cfargument name="lastName" type="string" required="false" />
      <cfargument name="age" type="numeric" required="false" />
      <cfargument name="dateCreated" type="date" required="false" default="#createODBCDateTime(now())#" />

      <cfset var qry="" />
      <cfquery name="qry">
         INSERT INTO people
         ( 
            <cfif structKeyExists(ARGUMENTS,"firstName")>
               firstName,
            </cfif> 
            <cfif structKeyExists(ARGUMENTS,"lastName")>
               lastName,
            </cfif> 
            <cfif structKeyExists(ARGUMENTS,"age")>
               age,
            </cfif> 
            <cfif structKeyExists(ARGUMENTS,"dateCreated")>
               dateCreated
            </cfif> 
         )
         VALUES
         ( 
            <cfif structKeyExists(ARGUMENTS,"firstName")>
               <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#ARGUMENTS.firstName#" null="false" />,
            </cfif> 
            <cfif structKeyExists(ARGUMENTS,"lastName")>
               <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#ARGUMENTS.lastName#" null="false" />,
            </cfif> 
            <cfif structKeyExists(ARGUMENTS,"age")>
               <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#ARGUMENTS.age#" null="false" />,
            </cfif> 
            <cfif structKeyExists(ARGUMENTS,"dateCreated")>
               <cfqueryparam cfsqltype="CF_SQL_TIMESTAMP" value="#ARGUMENTS.dateCreated#" null="false" />
            </cfif> 
         );
         SELECT @@IDENTITY AS newID;
      </cfquery>

      <cfreturn qry.newID />
   </cffunction>

   <!---- read ---->
   <cffunction name="read" returntype="People">
      <cfargument name="id" type="any" required="true" />

      <cfset var obj = createObject('component', 'People').init() />
      <cfset var i = 1 />

      <cfset var qry="" />
      <cfquery name="qry">
         SELECT   ID,
                  firstName,
                  lastName,
                  age,
                  dateCreated
         FROM     people
         WHERE    ID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#ARGUMENTS.ID#" null="false" />
      </cfquery>

      <cfset obj.setID(qry.ID[i]) />
      <cfset obj.setfirstName(qry.firstName[i]) />
      <cfset obj.setlastName(qry.lastName[i]) />
      <cfset obj.setage(qry.age[i]) />
      <cfset obj.setdateCreated(qry.dateCreated[i]) />

      <cfreturn obj />
   </cffunction>

   <!---- update ---->
   <cffunction name="update" returntype="void">
      <cfargument name="ID" type="numeric" required="true" /> 
      <cfargument name="firstName" type="string" required="false" /> 
      <cfargument name="lastName" type="string" required="false" /> 
      <cfargument name="age" type="numeric" required="false" /> 
      <cfargument name="dateCreated" type="date" required="false" default="#createODBCDateTime(now())#" />

      <cfset var qry="" />
      <cfquery name="qry">
         UPDATE   people
         SET      DateCreated = <cfqueryparam cfsqltype="CF_SQL_TIMESTAMP" value="#ARGUMENTS.DateCreated#" />
                  <cfif structKeyExists(ARGUMENTS,"firstName")>
                  ,firstName = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#ARGUMENTS.firstName#" null="false" />
                  </cfif>
                  <cfif structKeyExists(ARGUMENTS,"lastName")>
                  ,lastName = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#ARGUMENTS.lastName#" null="false" />
                  </cfif>
                  <cfif structKeyExists(ARGUMENTS,"age")>
                  ,age = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#ARGUMENTS.age#" null="false" />
                  </cfif>
         WHERE    ID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#ARGUMENTS.ID#" null="false" />
      </cfquery>

      <cfreturn />
   </cffunction>

   <!---- delete ---->
   <cffunction name="delete" returntype="void">
      <cfargument name="ID" type="numeric" required="true" />
      <cfset var qry="" />
      <cfquery name="qry">
         DELETE FROM people
         WHERE       ID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#ARGUMENTS.ID#" null="false" />
      </cfquery>

      <cfreturn />
   </cffunction>

</cfcomponent>
