(:: pragma bea:global-element-return element="ns0:SDPRequestHeader" location="../../SouthBoundInterfaces/spa200/sdp-header.xsd" ::)

declare namespace xf = "http://soa.o2.co.uk/Spa_2_0/transformations/SDPRequestHeaderNBToSB/";
declare namespace ns0 = "http://www.o2.com/schema/sdp/header/0.1";

declare function xf:SDPRequestHeaderNBToSB($applicationReferenceId as xs:string,
    $applicationId as xs:string)
    as element(ns0:SDPRequestHeader) {
        <ns0:SDPRequestHeader>
            <ns0:applicationReference>{ $applicationReferenceId }</ns0:applicationReference>
            <ns0:subMerchantId>{ $applicationId }</ns0:subMerchantId>
        </ns0:SDPRequestHeader>
};

declare variable $applicationReferenceId as xs:string external;
declare variable $applicationId as xs:string external;

xf:SDPRequestHeaderNBToSB($applicationReferenceId,
    $applicationId)