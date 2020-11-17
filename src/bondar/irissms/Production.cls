Class bondar.irissms.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="bondar.irissms.Production" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="SmsService" Category="" ClassName="bondar.irissms.SmsBusinessService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="VerifyNumberProc" Category="" ClassName="bondar.irissms.VerifyNumberProc" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="CheckBusinessOperation" Category="" ClassName="bondar.irissms.CheckBusinessOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">nexmo</Setting>
  </Item>
  <Item Name="SmsOperation" Category="" ClassName="bondar.irissms.SmsBusinessOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">nexmo</Setting>
  </Item>
  <Item Name="VerifyBusinessOperation" Category="" ClassName="bondar.irissms.VerifyBusinessOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">nexmo</Setting>
  </Item>
  <Item Name="WorkflowOperation" Category="" ClassName="EnsLib.Workflow.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
</Production>
}

}
