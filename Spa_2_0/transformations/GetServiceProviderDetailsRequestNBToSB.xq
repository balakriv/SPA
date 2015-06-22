(:: pragma bea:global-element-parameter parameter="$getServiceProviderDetails1" element="ns1:getServiceProviderDetails" location="../../NorthBoundInterfaces/spadata_2_0.xsd" ::)
(:: pragma bea:global-element-return element="ns0:getServiceProviderDetails" location="../../SouthBoundInterfaces/spa200/spa-adapter.xsd" ::)

(: 10/03/2010 		0.3 		Pankaj Kumar 			Added checks for applicationReference and subMerchId as a part of SDP-SOA Alignment:)

declare namespace xf = "http://soa.o2.co.uk/Spa_2_0/transformations/GetServiceProviderDetailsRequestNBToSB/";
declare namespace ns0 = "http:/www.o2.com/schema/sdp/service/spa/0.1";
declare namespace ns1 = "http://soa.o2.co.uk/sdp/spadata_2";
declare namespace xcore = "http://soa.o2.co.uk/coredata_1";

declare function xf:GetServiceProviderDetailsRequestNBToSB($getServiceProviderDetails1 as element(ns1:getServiceProviderDetails),$header as element(*),$configXML as element(*))
    as element(ns0:getServiceProviderDetails) {
        <ns0:getServiceProviderDetails>
            {
	        	if(string-length(data($getServiceProviderDetails1/ns1:applicationReference))=xs:integer(data($configXML/maxApplicationReferenceLimit))) then
	            <ns0:applicationReference>{ data($getServiceProviderDetails1/ns1:applicationReference) }</ns0:applicationReference>
	            else if(string-length(data($getServiceProviderDetails1/ns1:applicationReference))>xs:integer(data($configXML/maxApplicationReferenceLimit))) then
	            <ns0:applicationReference>{ substring(data($getServiceProviderDetails1/ns1:applicationReference),xs:integer(data($configXML/minApplicationReferenceLimit)),xs:integer(data($configXML/maxApplicationReferenceLimit))) }</ns0:applicationReference>
	            else
	            <ns0:applicationReference>{ substring(data($header/xcore:SOATransactionID),xs:integer(data($configXML/minApplicationReferenceLimit)),xs:integer(data($configXML/maxApplicationReferenceLimit))) }</ns0:applicationReference>
            }
            <ns0:msisdn>{ data($getServiceProviderDetails1/ns1:msisdn) }</ns0:msisdn>
            {
	            if(data($getServiceProviderDetails1/ns1:subMerchId)) then
	            <ns0:subMerchId>{ data($getServiceProviderDetails1/ns1:subMerchId) }</ns0:subMerchId>
	            else
	            <ns0:subMerchId>{ concat(data($header/xcore:providerID),data($configXML/delimiter),data($header/xcore:applicationID)) }</ns0:subMerchId>
            }
        </ns0:getServiceProviderDetails>
};

declare variable $getServiceProviderDetails1 as element(ns1:getServiceProviderDetails) external;
declare variable $header as element(*) external;
declare variable $configXML as element(*) external;

xf:GetServiceProviderDetailsRequestNBToSB($getServiceProviderDetails1,$header,$configXML)