(:: pragma bea:global-element-parameter parameter="$getServiceProviderDetailsResponse1" element="ns1:getServiceProviderDetailsResponse" location="../../SouthBoundInterfaces/spa200/spa-adapter.xsd" ::)
(:: pragma bea:global-element-return element="ns0:getServiceProviderDetailsResponse" location="../../NorthBoundInterfaces/spadata_2_0.xsd" ::)

declare namespace xf = "http://soa.o2.co.uk/Spa_2_0/transformations/GetServiceProviderDetailsResponseSBToNB/";
declare namespace ns0 = "http://soa.o2.co.uk/sdp/spadata_2";
declare namespace ns1 = "http:/www.o2.com/schema/sdp/service/spa/0.1";
declare namespace ns3 = "http:/www.o2.com/schema/sdp/types/0.1";
declare namespace ns2 = "http://soa.o2.co.uk/sdp/types_1";

declare function xf:GetServiceProviderDetailsResponseSBToNB($getServiceProviderDetailsResponse1 as element(ns1:getServiceProviderDetailsResponse))
    as element(ns0:getServiceProviderDetailsResponse) {
        <ns0:getServiceProviderDetailsResponse>
            <ns0:code>{ data($getServiceProviderDetailsResponse1/ns3:code) }</ns0:code>
            <ns0:description>{ data($getServiceProviderDetailsResponse1/ns3:description) }</ns0:description>
            <ns0:paymentType>{ data($getServiceProviderDetailsResponse1/ns1:paymentType) }</ns0:paymentType>
            <ns0:operatorID>{ data($getServiceProviderDetailsResponse1/ns1:operatorID) }</ns0:operatorID>
        </ns0:getServiceProviderDetailsResponse>
};

declare variable $getServiceProviderDetailsResponse1 as element(ns1:getServiceProviderDetailsResponse) external;

xf:GetServiceProviderDetailsResponseSBToNB($getServiceProviderDetailsResponse1)