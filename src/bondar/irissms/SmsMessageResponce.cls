Class bondar.irissms.SmsMessageResponce Extends Ens.Response
{

Property Text As %String(MAXLEN = 2000);

Property To As %String;

Property MessageId As %Status;

Property RemainingBalance As %String;

Storage Default
{
<Data name="SmsMessageResponceDefaultData">
<Subscript>"SmsMessageResponce"</Subscript>
<Value name="1">
<Value>Text</Value>
</Value>
<Value name="2">
<Value>To</Value>
</Value>
<Value name="3">
<Value>MessageId</Value>
</Value>
<Value name="4">
<Value>RemainingBalance</Value>
</Value>
</Data>
<DefaultData>SmsMessageResponceDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
