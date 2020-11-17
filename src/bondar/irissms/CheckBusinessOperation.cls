Class bondar.irissms.CheckBusinessOperation Extends Ens.BusinessOperation
{

Property Adapter As bondar.irissms.OutboundAdapter;

Parameter ADAPTER = "bondar.irissms.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method CheckNumber(pRequest As bondar.irissms.VerifyMessage, Output pResponse As bondar.irissms.VerifyMessageResponce) As %Status
{
    #dim req As %Net.HttpRequest
	set sc = $$$OK
	
	set req = ##class(%Net.HttpRequest).%New()
	set req.Https = 1
    set req.SSLConfiguration="default"

    Do req.InsertFormData("api_key",..Adapter.%CredentialsObj.Username)
    Do req.InsertFormData("api_secret",..Adapter.%CredentialsObj.Password)

    Do req.InsertFormData("request_id",pRequest.requestId)
    Do req.InsertFormData("code",pRequest.code)
    set st = req.Post(..Adapter.VerifyCheckURL)
    
	
	$$$TRACE("HTTP POST was executed; status is " _ st)

	
	$$$TRACE(req.HttpResponse.Data.Read())
    do req.HttpResponse.Data.Rewind()
    set responseData = ##class(%DynamicObject).%FromJSON(req.HttpResponse.Data.Read())
	
	set pResponse = ##class(bondar.irissms.VerifyMessageResponce).%New()
    if responseData.%Get("status")=0 {
	    set pResponse.isVerify = $$$YES
    } else {
        set pResponse.isVerify = $$$NO
    }
	
	quit st
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="bondar.irissms.VerifyMessage">
        <Method>CheckNumber</Method>
    </MapItem>
</MapItems>
}

}
