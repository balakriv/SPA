(:: pragma bea:global-element-parameter parameter="$getServiceProviderCategoriesResponse1" element="ns1:getServiceProviderCategoriesResponse" location="../../SouthBoundInterfaces/spa200/spa-adapter.xsd" ::)
(:: pragma bea:global-element-return element="ns0:getServiceProviderCategoriesResponse" location="../../NorthBoundInterfaces/spadata_2_0.xsd" ::)

declare namespace xf = "http://soa.o2.co.uk/Spa_2_0/transformations/GetServiceProviderCategoriesResponseSBToNB/";
declare namespace ns0 = "http://soa.o2.co.uk/sdp/spadata_2";
declare namespace ns1 = "http:/www.o2.com/schema/sdp/service/spa/0.1";
declare namespace ns3 = "http:/www.o2.com/schema/sdp/types/0.1";
declare namespace ns2 = "http://soa.o2.co.uk/sdp/types_1";

declare function xf:GetServiceProviderCategoriesResponseSBToNB($getServiceProviderCategoriesResponse1 as element(ns1:getServiceProviderCategoriesResponse))
    as element(ns0:getServiceProviderCategoriesResponse) {
        <ns0:getServiceProviderCategoriesResponse>
            <ns0:code>{ data($getServiceProviderCategoriesResponse1/ns3:code) }</ns0:code>
            <ns0:description>{ data($getServiceProviderCategoriesResponse1/ns3:description) }</ns0:description>
            <ns0:spidDescription>{ data($getServiceProviderCategoriesResponse1/ns1:spidDescription) }</ns0:spidDescription>
            <ns0:spid>{ data($getServiceProviderCategoriesResponse1/ns1:spid) }</ns0:spid>
            <ns0:paymentType>{ data($getServiceProviderCategoriesResponse1/ns1:paymentType) }</ns0:paymentType>
            <ns0:barringCodes>{ data($getServiceProviderCategoriesResponse1/ns1:barringCodes) }</ns0:barringCodes>
            <ns0:category>{ data($getServiceProviderCategoriesResponse1/ns1:category) }</ns0:category>
            <ns0:status>{ data($getServiceProviderCategoriesResponse1/ns1:status) }</ns0:status>
            <ns0:operatorID>{ data($getServiceProviderCategoriesResponse1/ns1:operatorID) }</ns0:operatorID>
            <ns0:puk>{ data($getServiceProviderCategoriesResponse1/ns1:puk) }</ns0:puk>
        </ns0:getServiceProviderCategoriesResponse>
};

declare variable $getServiceProviderCategoriesResponse1 as element(ns1:getServiceProviderCategoriesResponse) external;

xf:GetServiceProviderCategoriesResponseSBToNB($getServiceProviderCategoriesResponse1)