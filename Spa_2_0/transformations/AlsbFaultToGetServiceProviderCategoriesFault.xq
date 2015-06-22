(:: pragma bea:global-element-parameter parameter="$fault1" element="ns2:fault" location="../../CommonResources/schemas/alsbfault.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Fault" location="../schemas/commonsoapfault.xsd" ::)

declare namespace xf = "http://soa.o2.co.uk/Spa_2_0/transformations/AlsbFaultToGetServiceProviderCategoriesFault/";
declare namespace ns0 = "http://schemas.xmlsoap.org/soap/envelope/";
declare namespace ns1 = "http://soa.o2.co.uk/sdp/spadata_2";
declare namespace ns3 = "http://soa.o2.co.uk/coredata_1";
declare namespace ns2 = "http://www.bea.com/wli/sb/context";

declare function xf:AlsbFaultToGetServiceProviderCategoriesFault($fault1 as element(ns2:fault),$transactionId as xs:string)
    as element(ns0:Fault) {
        <ns0:Fault>
            <faultcode xmlns:env="http://schemas.xmlsoap.org/soap/envelope">env:Server</faultcode>
            <faultstring>{ data($fault1/ns2:reason) }</faultstring>
            <detail>
                <ns1:getServiceProviderCategoriesFault>
                    <ns3:SOAFaultOriginator>{ data($fault1/ns2:location/ns2:stage) }</ns3:SOAFaultOriginator>
                    <ns3:SOAFaultCode>{ data($fault1/ns2:errorCode) }</ns3:SOAFaultCode>
                    <ns3:faultDescription>{ data($fault1/ns2:reason) }</ns3:faultDescription>
                    <ns3:SOATransactionID>{$transactionId}</ns3:SOATransactionID>
                </ns1:getServiceProviderCategoriesFault>
            </detail>
        </ns0:Fault>
};

declare variable $fault1 as element(ns2:fault) external;
declare variable $transactionId as xs:string external;

xf:AlsbFaultToGetServiceProviderCategoriesFault($fault1,$transactionId)