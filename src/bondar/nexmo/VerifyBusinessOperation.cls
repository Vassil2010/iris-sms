Class bondar.nexmo.VerifyBusinessOperation Extends Ens.BusinessOperation
{

Property Adapter As bondar.nexmo.OutboundAdapter;

Parameter ADAPTER = "bondar.nexmo.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method VerifyNumber(pRequest As Ens.Request, Output pResponse As Ens.Response) As %Status
{
    #dim req As %Net.HttpRequest
	set sc = $$$OK
	
	set req = ##class(%Net.HttpRequest).%New()
	set req.Https = 1
    set req.SSLConfiguration="default"

    Do req.InsertFormData("api_key",..Adapter.%CredentialsObj.Username)
    Do req.InsertFormData("api_secret",..Adapter.%CredentialsObj.Password)

    Do req.InsertFormData("number",pRequest.To)
    Do req.InsertFormData("brand","IRIS")
    set st = req.Post(..Adapter.VerifyNumberURL)
    
	
	$$$TRACE("HTTP POST was executed; status is " _ st)

	
	$$$TRACE(req.HttpResponse.Data.Read())
    do req.HttpResponse.Data.Rewind()
    set responseData = ##class(%DynamicObject).%FromJSON(req.HttpResponse.Data.Read())
	
	set pResponse = ##class(bondar.nexmo.VerifyMessageResponce).%New()
	set pResponse.requestId = responseData.%Get("request_id")
	
	quit st
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="bondar.nexmo.SmsMessage">
        <Method>VerifyNumber</Method>
    </MapItem>
</MapItems>
}

}
