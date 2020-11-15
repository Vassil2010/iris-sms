Class bondar.nexmo.SmsBusinessOperation Extends Ens.BusinessOperation
{

Property Adapter As bondar.nexmo.OutboundAdapter;

Parameter ADAPTER = "bondar.nexmo.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method SendSms(pRequest As Ens.Request, Output pResponse As Ens.Response) As %Status
{
    #dim req As %Net.HttpRequest
	set sc = $$$OK
	
	set req = ##class(%Net.HttpRequest).%New()
	set req.Https = 1
    set req.SSLConfiguration="default"

    Do req.InsertFormData("api_key",..Adapter.%CredentialsObj.Username)
    Do req.InsertFormData("api_secret",..Adapter.%CredentialsObj.Password)


    Do req.InsertFormData("from","IRIS")
    Do req.InsertFormData("text",pRequest.Text)
    Do req.InsertFormData("to",pRequest.To)
    set st = req.Post(..Adapter.SendSmsURL)



	
	$$$TRACE("HTTP POST was executed; status is " _ st)

	
	$$$TRACE(req.HttpResponse.Data.Read())
    do req.HttpResponse.Data.Rewind()
    set response = ##class(%DynamicObject).%FromJSON(req.HttpResponse.Data.Read())
	
	set pResponse = ##class(bondar.nexmo.SmsMessageResponce).%New()
	set pResponse.Text = pRequest.Text
	set pResponse.To = pRequest.To
    set pResponse.MessageId = response.messages.%Get("message-id")
    set pResponse.RemainingBalance = response.messages.%Get("remaining-balance")
	
	quit st
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="bondar.nexmo.SmsMessage">
        <Method>SendSms</Method>
    </MapItem>
</MapItems>
}

}
