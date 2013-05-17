<cfcomponent output="false">

   <!---- properties ---->
   <cfproperty name="ID" type="numeric" />
   <cfproperty name="firstName" type="string" />
   <cfproperty name="lastName" type="string" />
   <cfproperty name="age" type="numeric" />
   <cfproperty name="dateCreated" type="date" /> 

   <cfset INSTANCE = {} />
   <cfset INSTANCE.ID = "" />
   <cfset INSTANCE.firstName = "" />
   <cfset INSTANCE.lastName = "" />
   <cfset INSTANCE.age = "" />
   <cfset INSTANCE.dateCreated = "" />

   <!---- init ---->
   <cffunction name="init" returntype="any">
      <cfreturn this />
   </cffunction>

   <!---- ID accesor ---->
   <cffunction name="getID" access="remote" output="false" returnType="Any">
      <cfreturn INSTANCE.ID />
   </cffunction>
   <cffunction name="setID" access="remote" output="false" returnType="void">
      <cfargument name="value" required="true" type="any" />
      <cfset INSTANCE.ID = ARGUMENTS.value />
   </cffunction>

   <!---- firstName accesor ---->
   <cffunction name="getfirstName" access="remote" output="false" returnType="Any">
      <cfreturn INSTANCE.firstName />
   </cffunction>
   <cffunction name="setfirstName" access="remote" output="false" returnType="void">
      <cfargument name="value" required="true" type="any" />
      <cfset INSTANCE.firstName = ARGUMENTS.value />
   </cffunction>

   <!---- lastName accesor ---->
   <cffunction name="getlastName" access="remote" output="false" returnType="Any">
      <cfreturn INSTANCE.lastName />
   </cffunction>
   <cffunction name="setlastName" access="remote" output="false" returnType="void">
      <cfargument name="value" required="true" type="any" />
      <cfset INSTANCE.lastName = ARGUMENTS.value />
   </cffunction>

   <!---- age accesor ---->
   <cffunction name="getage" access="remote" output="false" returnType="Any">
      <cfreturn INSTANCE.age />
   </cffunction>
   <cffunction name="setage" access="remote" output="false" returnType="void">
      <cfargument name="value" required="true" type="any" />
      <cfset INSTANCE.age = ARGUMENTS.value />
   </cffunction>

   <!---- dateCreated accesor ---->
   <cffunction name="getdateCreated" access="remote" output="false" returnType="Any">
      <cfreturn INSTANCE.dateCreated />
   </cffunction>
   <cffunction name="setdateCreated" access="remote" output="false" returnType="void">
      <cfargument name="value" required="true" type="any" />
      <cfset INSTANCE.dateCreated = ARGUMENTS.value />
   </cffunction>

</cfcomponent>
