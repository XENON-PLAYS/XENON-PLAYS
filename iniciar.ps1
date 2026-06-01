# Exemplo de provisionamento de script administrativo legítimo
$TaskName = "ManutencaoSistema"
$ScriptPath = "C:\ProgramData\Scripts\amigo.ps1"

# Define a ação apontando diretamente para o interpretador e o arquivo
$Action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -ExecutionPolicy Bypass -File $ScriptPath"

# MODIFICADO: Define o gatilho para iniciar logo ao ligar/inicializar o PC
$Trigger = New-ScheduledTaskTrigger -AtStartup

# Registra a tarefa no escopo do sistema
Register-ScheduledTask -TaskName $TaskName -Action $Action -Trigger $Trigger
