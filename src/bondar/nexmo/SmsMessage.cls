Class bondar.nexmo.SmsMessage Extends Ens.Request
{

Property Text As %String(MAXLEN = 2000);

Property To As %String;

Property VerifyNumber As %Boolean [ InitialExpression = 0 ];

Storage Default
{
<Data name="SmsMessageDefaultData">
<Subscript>"SmsMessage"</Subscript>
<Value name="1">
<Value>Text</Value>
</Value>
<Value name="2">
<Value>To</Value>
</Value>
<Value name="3">
<Value>VerifyNumber</Value>
</Value>
</Data>
<DefaultData>SmsMessageDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
