(:: pragma bea:global-element-parameter parameter="$getServiceProviderCategories1" element="ns1:getServiceProviderCategories" location="../../NorthBoundInterfaces/spadata_2_0.xsd" ::)
(:: pragma  parameter="$header" type="anyType" ::)
(:: pragma bea:global-element-return element="ns0:getServiceProviderCategories" location="../../SouthBoundInterfaces/spa200/spa-adapter.xsd" ::)

(: 10/03/2010 		0.3 		Pankaj Kumar 			Added checks for applicationReference and subMerchId as a part of SDP-SOA Alignment:)

declare namespace xf = "http://soa.o2.co.uk/Spa_2_0/transformations/GetServiceProviderCategoriesRequestNBToSB/";
declare namespace ns0 = "http:/www.o2.com/schema/sdp/service/spa/0.1";
declare namespace ns1 = "http://soa.o2.co.uk/sdp/spadata_2";
declare namespace xcore = "http://soa.o2.co.uk/coredata_1";

declare function xf:GetServiceProviderCategoriesRequestNBToSB($getServiceProviderCategories1 as element(ns1:getServiceProviderCategories)
	,$header as element(*)
	,$configXML as element(*))
    as element(ns0:getServiceProviderCategories) {
        <ns0:getServiceProviderCategories>
           {
	        	if(string-length(data($getServiceProviderCategories1/ns1:applicationReference))=xs:integer(data($configXML/maxApplicationReferenceLimit))) then
	            <ns0:applicationReference>{ data($getServiceProviderCategories1/ns1:applicationReference) }</ns0:applicationReference>
	            else if(string-length(data($getServiceProviderCategories1/ns1:applicationReference))>xs:integer(data($configXML/maxApplicationReferenceLimit))) then
	            <ns0:applicationReference>{ substring(data($getServiceProviderCategories1/ns1:applicationReference),xs:integer(data($configXML/minApplicationReferenceLimit)),xs:integer(data($configXML/maxApplicationReferenceLimit))) }</ns0:applicationReference>
	            else
	            <ns0:applicationReference>{ substring(data($header/xcore:SOATransactionID),xs:integer(data($configXML/minApplicationReferenceLimit)),xs:integer(data($configXML/maxApplicationReferenceLimit))) }</ns0:applicationReference>
            }
            <ns0:msisdn>{ data($getServiceProviderCategories1/ns1:msisdn) }</ns0:msisdn>
            {
	            if(data($getServiceProviderCategories1/ns1:subMerchId)) then
	            <ns0:subMerchId>{ data($getServiceProviderCategories1/ns1:subMerchId) }</ns0:subMerchId>
	            else
	            <ns0:subMerchId>{ concat(data($header/xcore:providerID),data($configXML/delimiter),data($header/xcore:applicationID)) }</ns0:subMerchId>
            }
        </ns0:getServiceProviderCategories>
};

declare variable $getServiceProviderCategories1 as element(ns1:getServiceProviderCategories) external;
declare variable $header as element(*) external;
declare variable $configXML as element(*) external;

xf:GetServiceProviderCategoriesRequestNBToSB($getServiceProviderCategories1,$header,$configXML)