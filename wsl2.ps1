Start-Process powershell.exe -Verb runas
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --set-default-version 2
winget install ubuntu
winget install --id GitHub.cli
$env:PATH += ';C:\Program Files\GitHub CLI'
gh auth login
winget install --id Microsoft.GitCredentialManagerCore
git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-wincred.exe"