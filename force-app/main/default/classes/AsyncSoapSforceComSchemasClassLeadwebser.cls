//Generated by wsdl2apex

public class AsyncSoapSforceComSchemasClassLeadwebser {
    public class generateLeadDemoResponse_elementFuture extends System.WebServiceCalloutFuture {
        public String getValue() {
            soapSforceComSchemasClassLeadwebser.generateLeadDemoResponse_element response = (soapSforceComSchemasClassLeadwebser.generateLeadDemoResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.result;
        }
    }
    public class AsyncLeadWebService {
        public String endpoint_x = 'https://ap24.salesforce.com/services/Soap/class/LeadWebService';
        public Map<String,String> inputHttpHeaders_x;
        public String clientCertName_x;
        public Integer timeout_x;
        public soapSforceComSchemasClassLeadwebser.DebuggingHeader_element DebuggingHeader;
        public soapSforceComSchemasClassLeadwebser.AllowFieldTruncationHeader_element AllowFieldTruncationHeader;
        public soapSforceComSchemasClassLeadwebser.CallOptions_element CallOptions;
        public soapSforceComSchemasClassLeadwebser.SessionHeader_element SessionHeader;
        public soapSforceComSchemasClassLeadwebser.DebuggingInfo_element DebuggingInfo;
        private String DebuggingHeader_hns = 'DebuggingHeader=http://soap.sforce.com/schemas/class/LeadWebService';
        private String AllowFieldTruncationHeader_hns = 'AllowFieldTruncationHeader=http://soap.sforce.com/schemas/class/LeadWebService';
        private String CallOptions_hns = 'CallOptions=http://soap.sforce.com/schemas/class/LeadWebService';
        private String SessionHeader_hns = 'SessionHeader=http://soap.sforce.com/schemas/class/LeadWebService';
        private String DebuggingInfo_hns = 'DebuggingInfo=http://soap.sforce.com/schemas/class/LeadWebService';
        private String[] ns_map_type_info = new String[]{'http://soap.sforce.com/schemas/class/LeadWebService', 'soapSforceComSchemasClassLeadwebser'};
        public AsyncSoapSforceComSchemasClassLeadwebser.generateLeadDemoResponse_elementFuture beginGenerateLeadDemo(System.Continuation continuation,String fname,String lname,String myCompany,String myphone,String myemail) {
            soapSforceComSchemasClassLeadwebser.generateLeadDemo_element request_x = new soapSforceComSchemasClassLeadwebser.generateLeadDemo_element();
            request_x.fname = fname;
            request_x.lname = lname;
            request_x.myCompany = myCompany;
            request_x.myphone = myphone;
            request_x.myemail = myemail;
            return (AsyncSoapSforceComSchemasClassLeadwebser.generateLeadDemoResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncSoapSforceComSchemasClassLeadwebser.generateLeadDemoResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/schemas/class/LeadWebService',
              'generateLeadDemo',
              'http://soap.sforce.com/schemas/class/LeadWebService',
              'generateLeadDemoResponse',
              'soapSforceComSchemasClassLeadwebser.generateLeadDemoResponse_element'}
            );
        }
    }
}