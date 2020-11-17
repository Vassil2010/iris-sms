/// 
Class bondar.irissms.VerifyNumberProc Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='bondar.irissms.SmsMessage' response='bondar.irissms.VerifyMessageResponce' height='2000' width='2000' >
<context>
<property name='requestId' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='250' />
</parameters>
</property>
<property name='code' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
</context>
<sequence xend='200' yend='550' >
<call name='SendCode' target='VerifyBusinessOperation' async='0' timeout='"PT5M"' xpos='200' ypos='250' >
<request type='bondar.irissms.SmsMessage' >
<assign property="callrequest.To" value="request.To" action="set" />
<assign property="callrequest.VerifyNumber" value="request.VerifyNumber" action="set" />
<assign property="callrequest.Text" value="request.Text" action="set" />
</request>
<response type='bondar.irissms.VerifyMessageResponce' >
<assign property="context.requestId" value="callresponse.requestId" action="set" />
</response>
</call>
<call name='WorkflowOperation' target='WorkflowOperation' async='0' timeout='"PT5M"' xpos='200' ypos='350' >
<request type='EnsLib.Workflow.TaskRequest' >
<assign property="callrequest.%Subject" value="request.To" action="set" />
<assign property="callrequest.%FormFields" value="&quot;Code&quot;" action="set" />
<assign property="callrequest.%UserName" value="&quot;Admin&quot;" action="set" />
</request>
<response type='EnsLib.Workflow.TaskResponse' >
<assign property="context.code" value="callresponse.%FormValues.GetAt(&quot;Code&quot;)" action="set" />
</response>
</call>
<call name='CheckCode' target='CheckBusinessOperation' async='0' timeout='"PT5M"' xpos='200' ypos='450' >
<request type='bondar.irissms.VerifyMessage' >
<assign property="callrequest.requestId" value="context.requestId" action="set" />
<assign property="callrequest.code" value="context.code" action="set" />
</request>
<response type='bondar.irissms.VerifyMessageResponce' >
<assign property="response.isVerify" value="callresponse.isVerify" action="set" />
</response>
</call>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
