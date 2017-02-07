# wso2Dss
A simple wso2 project using DSS.

A proxy service receives a SOAP request with the following format:
```xml
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
   <soapenv:Header/>
   <soapenv:Body>
   	<wso2:request xmlns:wso2="https://10.1.2.68:9443/carbon">
   		<wso2:department>{department_id}</wso2:department>
   	</wso2:request>
   </soapenv:Body>
</soapenv:Envelope>
```

Queries a database with the following format:
```sql
Employee
  ID
  NAME
  DEPARTMENT_ID
  EMAIL
  ROLE
```
And returns a list of employees for department_id.It also saves the result of the query in a csv file.

### Initial configuration
You need to configure the ESB to use the VFS transport for processing the files.
Edit the **<ESB_HOME>/repository/conf/axis2/axis2.xml** file and uncomment the VFS sender as follows:
```xml
<transportSender name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportSender"/>
```
And change the path for the output file in **<PROJECT_HOME>/src/main/synapse-config/proxy-services/EmployeeProxy.xml**.