xquery version "1.0" encoding "utf-8";

(:
 : Licensed under the Apache License, Version 2.0 (the "License");
 : you may not use this file except in compliance with the License.
 : You may obtain a copy of the License at
 :
 :     http://www.apache.org/licenses/LICENSE-2.0
 :
 : Unless required by applicable law or agreed to in writing, software
 : distributed under the License is distributed on an "AS IS" BASIS,
 : WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 : See the License for the specific language governing permissions and
 : limitations under the License.
 :)

(:~
 : This library module provides BaseX specific XQuery implementation features
 : such as HTTP GET and POST requests and XML parsing.
 : @author Andy Bunce
 :)

module namespace impl = "http://basex.org/http";

declare default function namespace "http://www.w3.org/2005/xpath-functions";
declare default element namespace "http://www.w3.org/Protocols/rfc2616"; 

declare namespace http = "http://expath.org/ns/http-client"; 


(:~ URL encoding for HTTP requests. :)
declare variable $impl:URL_ENCODED 	as xs:string := "application/x-www-form-urlencoded";


(:~
 : The HTTP binding for query operation.
 : @param $request
 : @return the normalised response.
 :)
declare function impl:http-request($request as element(http:request))
				as item()*
{
http:send-request($request)
};


(:~
 : Converts the implementation specific representation of the HTTP response into
 : a generic HTTP representation which uses the same structure as XProc's c:response element.
 : @param $response
 : @return an http:response element
 :)
declare function impl:normalise-response($response as item()*) 
	as element(http:response) 
{
$response
}; 


(:~
 : Parses a string as XML, returning one or more document nodes.
 : @param $string Input to be unquoted.
 : @return an XML document node. 
 :)
declare function impl:unquote($string as xs:string) 
		as document-node() 
{
	fn:parse-xml($string)
}; 


(:~
 : Parses a string as XML, returning one or more document nodes.
 : @param $string Input to be unquoted.
 : @return an XML document node. 
 :)
declare function impl:quote($node as node()) 
		as xs:string 
{
	fn:serialize($node)
}; 





(:~
 : Extract the head of the HTTP resonse data.
 : @param $response
 : @return the head of the HTTP response data.
 :)
declare function impl:get-response-head($response as item()*) 
		as element(http:response)
{
	subsequence($response, 1, 1)
};


(:~
 : Extract the body of the HTTP resonse data.
 : @param $response
 : @return a sequence of zero or more HTTP response body items.
 :)
declare function impl:get-response-body($response as item()*) 
		as item()?
{
		subsequence($response, 2, 1)
};

