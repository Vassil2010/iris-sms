Class bondar.irissms.VerifyMessage Extends Ens.Request
{

Property requestId As %String(MAXLEN = 200);

Property code As %String;

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
</Data>
<DefaultData>VerifyMessageResponceDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
