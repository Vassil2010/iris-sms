Class bondar.Test
{

ClassMethod SendSms(telNumber = "", smsText = "") As %Status
{
    Set tSC = ##class(Ens.Director).CreateBusinessService("SmsService",.tService)   
    If ($IsObject(tService)) {
        set input = ##class(bondar.nexmo.SmsMessage).%New()
        set input.To = telNumber
        set input.Text = smsText
        Set tSC = tService.ProcessInput(input,.output)
    }
    return tSC
}

ClassMethod VerifyNumber(telNumber = "") As %Status
{
    Set tSC = ##class(Ens.Director).CreateBusinessService("SmsService",.tService)   
    If ($IsObject(tService)) {
        set input = ##class(bondar.nexmo.SmsMessage).%New()
        set input.To = telNumber
        set input.VerifyNumber = $$$YES
        Set tSC = tService.ProcessInput(input,.output)
    }
    if $IsObject(output) {
        write !,"isVerify="_output.isVerify
    } else {

        write !,"Not Object"
    }
    return tSC
}

}
