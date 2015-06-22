(:: pragma bea:global-element-return element="ns0:WLNGRequestHeader" location="../../SouthBoundInterfaces/spa200/sdp-header.xsd" ::)

declare namespace xf = "http://soa.o2.co.uk/Spa_2_0/transformations/WLNGRequestHeaderNBToSB/";
declare namespace ns0 = "http://www.o2.com/schema/sdp/header/0.1";

declare function xf:WLNGRequestHeaderNBToSB($applicationId as xs:string,$transactionId as xs:string,
    $customerId as xs:string,
    $applicationInstanceId as xs:string)
    as element(ns0:WLNGRequestHeader) {
        <ns0:WLNGRequestHeader>
            <ns0:transactionId>{ $transactionId }</ns0:transactionId>
            <ns0:customerId>{ $customerId }</ns0:customerId>
            <ns0:applicationId>{ $applicationId}</ns0:applicationId>
            <ns0:applicationInstanceId>{ $applicationInstanceId }</ns0:applicationInstanceId>
        </ns0:WLNGRequestHeader>
};

declare variable $applicationId as xs:string external;
declare variable $transactionId as xs:string external;
declare variable $customerId as xs:string external;
declare variable $applicationInstanceId as xs:string external;


xf:WLNGRequestHeaderNBToSB($applicationId,$transactionId,$customerId,$applicationInstanceId)