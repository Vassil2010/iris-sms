Class App.Installer
{

XData setup
{
<Manifest>
  <Default Name="Namespace" Value="IRISAPP"/>
  <Default Name="app" Value="irisapp" />

  <Namespace Name="${Namespace}" Code="${Namespace}" Data="${Namespace}" Create="yes" Ensemble="1">

    <Configuration>
      <Database Name="${Namespace}" Dir="/opt/${app}/data" Create="yes" Resource="%DB_${Namespace}"/>
    </Configuration>
    <CSPApplication Url="/csp/${app}" Directory="${cspdir}${app}"  ServeFiles="1" Recurse="1" MatchRoles=":%DB_${Namespace}" AuthenticationMethods="32"
       
    />
  </Namespace>
  <Namespace Name="USER">
    <Invoke Class="App.Installer" Method="enableAnalytics" CheckStatus="1">
    </Invoke>
  </Namespace>
</Manifest>
}

ClassMethod setup(ByRef pVars, pLogLevel As %Integer = 3, pInstaller As %Installer.Installer, pLogger As %Installer.AbstractLogger) As %Status [ CodeMode = objectgenerator, Internal ]
{
  #; Let XGL document generate code for this method. 
  Quit ##class(%Installer.Manifest).%Generate(%compiledclass, %code, "setup")
}

ClassMethod enableAnalytics() As %Status
{
  try {
    set ns = $NameSpace
    zn "%SYS"
    for webName = "/csp/irisapp" {
      set webProperties("DeepSeeEnabled") = 1
      set sc = ##class(Security.Applications).Modify(webName, .webProperties)
    }
    set $NameSpace = ns
  } catch ex {
    return ex.AsStatus()
  }
  return $$$OK
}

}
