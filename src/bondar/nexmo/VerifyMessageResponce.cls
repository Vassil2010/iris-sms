Class bondar.nexmo.VerifyMessageResponce Extends Ens.Response
{

Property requestId As %String(MAXLEN = 200);

Property code As %String;

Property isVerify As %Boolean;

Storage Default
{
<Data name="VerifyMessageResponceDefaultData">
<Subscript>"VerifyMessageResponce"</Subscript>
<Value name="1">
<Value>requestId</Value>
</Value>
<Value name="2">
<Value>code</Value>
</Value>
<Value name="3">
<Value>isVerify</Value>
</Value>
</Data>
<DefaultData>VerifyMessageResponceDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
