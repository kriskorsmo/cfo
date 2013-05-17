<cfcomponent output="false">

   <!---- init ---->
   <cffunction name="init" returntype="any">
      <cfset INSTANCE = {} />
      <cfset INSTANCE.dao = createObject('component', 'PeopleDAO').init() />
      <cfreturn this />
   </cffunction>

   <!---- getAll ---->
   <cffunction name="getAll" returntype="People[]">
      <cfset var collection = [] />
      <cfset var obj = '' />
      <cfset var qry = '' />
      <cfset var i = 0 />

      <cfquery name="qry">
         SELECT   ID,
                  firstName,
                  lastName,
                  age,
                  dateCreated
         FROM     people
      </cfquery>

      <cfloop from="1" to="#qry.recordcount#" index="i">
         <cfset obj = createObject('component', 'People').init() />
         <cfset obj.setID(qry.ID[i]) />
         <cfset obj.setfirstName(qry.firstName[i]) />
         <cfset obj.setlastName(qry.lastName[i]) />
         <cfset obj.setage(qry.age[i]) />
         <cfset obj.setdateCreated(qry.dateCreated[i]) />
         <cfset arrayAppend(collection, obj) />
      </cfloop>

      <cfreturn collection />
   </cffunction>

   <!---- getAll_paged ---->
   <cffunction name="getAll_paged" returntype="People[]">
      <cfargument name="start" type="numeric" required="true" />
      <cfargument name="count" type="numeric" required="true" />
      <cfset var collection = [] />
      <cfset var obj = '' />
      <cfset var qry = '' />
      <cfset var i = 0 />
      <cfset var end=0 />

      <cfquery name="qry">
         SELECT   ID,
                  firstName,
                  lastName,
                  age,
                  dateCreated
         FROM     people
      </cfquery>

      <cfif (ARGUMENTS.start + ARGUMENTS.count - 1) GTE qry.recordcount >
         <cfset end =  qry.recordcount />
      <cfelse>
         <cfset end= ARGUMENTS.start + ARGUMENTS.count - 1 />
      </cfif>

      <cfloop from="#ARGUMENTS.start#" to="#end#" index="i">
         <cfset obj = createObject('component', 'People').init() />
         <cfset obj.setID(qry.ID[i]) />
         <cfset obj.setfirstName(qry.firstName[i]) />
         <cfset obj.setlastName(qry.lastName[i]) />
         <cfset obj.setage(qry.age[i]) />
         <cfset obj.setdateCreated(qry.dateCreated[i]) />
         <cfset arrayAppend(collection, obj) />
      </cfloop>

      <cfreturn collection />
   </cffunction>

   <!---- count ---->
   <cffunction name="count" returntype="numeric">
      <cfset var qry = "" />

      <cfquery name="qry">
         SELECT   COUNT(ID) AS total
         FROM     people
      </cfquery>

      <cfreturn qry.total[1] />
   </cffunction>

</cfcomponent>
