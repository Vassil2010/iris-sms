Class bondar.irissms.OutboundAdapter Extends Ens.OutboundAdapter
{

Property SendSmsURL As %String;

Property VerifyNumberURL As %String;

Property VerifyCheckURL As %String;

Parameter SETTINGS = "Credentials";

Method OnInit() As %Status
{
    Set ..SendSmsURL="https://rest.nexmo.com/sms/json" 
    Set ..VerifyNumberURL= "https://api.nexmo.com/verify/json"
    Set ..VerifyCheckURL = "https://api.nexmo.com/verify/check/json"
    Quit $$$OK
}

}
