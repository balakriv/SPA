(:: pragma bea:global-element-parameter parameter="$fault" element="ns0:Fault" location="../schemas/backendsoapfault.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Fault" location="../schemas/commonsoapfault.xsd" ::)

declare namespace ns4 = "http:/www.o2.com/schema/sdp/types/0.1";
declare namespace xf = "http://soa.o2.co.uk/Spa_2_0/transformations/SPABackendFaultToSPAAdapterFault/";
declare namespace ns0 = "http://schemas.xmlsoap.org/soap/envelope/";
declare namespace ns1 = "http://soa.o2.co.uk/sdp/spadata_2";
declare namespace ns3 = "http://soa.o2.co.uk/coredata_1";
declare namespace ns2 = "http:/www.o2.com/schema/sdp/service/spa/0.1";

declare function xf:SPABackendFaultToSPAAdapterFault($fault as element(ns0:Fault),
    $transactionId as xs:string,
    $operationName as xs:string,
   	$configXML as element(*))
    as element(ns0:Fault) {
        <ns0:Fault>
           <faultcode xmlns:env="http://schemas.xmlsoap.org/soap/envelope">env:Server</faultcode>
            <faultstring>{ data($fault/faultstring) }</faultstring>
            <detail>
            {
            	if($operationName="getServiceProviderDetails") then
                <ns1:getServiceProviderDetailsFault>
                    <ns3:SOAFaultOriginator>{data($configXML/originator)}</ns3:SOAFaultOriginator>
                    <ns3:SOAFaultCode>{ data($fault/detail/ns2:getServiceProviderDetailsFault/ns4:code) }</ns3:SOAFaultCode>
                    <ns3:faultDescription>{ data($fault/detail/ns2:getServiceProviderDetailsFault/ns4:description) }</ns3:faultDescription>
                    <ns3:SOATransactionID>{ $transactionId }</ns3:SOATransactionID>
                </ns1:getServiceProviderDetailsFault>
                
            	else if($operationName="getServiceProviderCategories") then
                <ns1:getServiceProviderCategoriesFault>
                    <ns3:SOAFaultOriginator>{data($configXML/originator)}</ns3:SOAFaultOriginator>
                    <ns3:SOAFaultCode>{ data($fault/detail/ns2:getServiceProviderCategoriesFault/ns4:code) }</ns3:SOAFaultCode>
                    <ns3:faultDescription>{ data($fault/detail/ns2:getServiceProviderCategoriesFault/ns4:description) }</ns3:faultDescription>
                    <ns3:SOATransactionID>{ $transactionId }</ns3:SOATransactionID>
                </ns1:getServiceProviderCategoriesFault>
                
                else ""
            }
            </detail>
        </ns0:Fault>
};

declare variable $fault as element(ns0:Fault) external;
declare variable $transactionId as xs:string external;
declare variable $operationName as xs:string external;
declare variable $configXML as element(*) external;

xf:SPABackendFaultToSPAAdapterFault($fault,
    $transactionId,
    $operationName,
    $configXML)