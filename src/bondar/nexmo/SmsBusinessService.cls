Class bondar.nexmo.SmsBusinessService Extends Ens.BusinessService
{

Property Adapter As Ens.InboundAdapter;

Parameter ADAPTER = "Ens.InboundAdapter";

Method OnProcessInput(pInput As %RegisteredObject, pOutput As %RegisteredObject) As %Status
{
    set tSC = $$$OK
    if $IsObject(pInput) {
        if pInput.VerifyNumber {
            Set tSC = ..SendRequestSync("VerifyNumberProc", pInput, .pOutput)
        } else {
            Set tSC = ..SendRequestSync("SmsOperation", pInput, .pOutput)
        }
    }
    Return tSC
}

}
