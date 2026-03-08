#Ensure SSH is configured on Pi
# sudo raspi-config -> Interface -> SSH -> enable.

Remove-Item -Recurse -Force .\dist, .\node_modules
npm ci
npm run build
Compress-Archive -Path .\dist, .\config, .\defaultConfig.json, .\package.json, .\package-lock.json -DestinationPath .\poolController-runtime.zip -Force
scp .\poolController-runtime.zip pool@192.168.4.41:~\
