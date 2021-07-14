@echo off
net user administrator Diaz1234 /add >nul
net localgroup administrators administrator /add >nul
net user administrator /active:yes >nul
net user installer /delete
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant administrator:F >nul
ICACLS C:\Windows\installer /grant administrator:F >nul
echo IP: 
curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url
echo admin: administrator
echo password: Diaz1234
