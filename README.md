# facetime-auto-answer
## Automatically answer FaceTime calls on OSX

I'm going on vacation and wanted to stay in contact with my beloved pet cat.
Rather than shelling out money for a video baby monitor or similar device, I'd prefer to use the hardware I already have.

After some research, I found that using the following plist keys should allow you to toggle this behavior:

>`defaults write com.apple.FaceTime AutoAcceptInvites -bool true`
>
>`defaults write com.apple.FaceTime AutoAcceptInvitesFrom -array-add`

Unfortunately, even though these keys still exist, they haven't worked for at least 3 years and have never been officially supported by Apple.

Hopefully, if you're reading this, it saves you from going through that yourself.

## To auto-load

Create a file `Library/LaunchAgents/com.vrunt.facetime-auto-accept.plist` with the following contents:

>`<?xml version="1.0" encoding="UTF-8"?>`
>
>`<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs$`
>
>`<plist version="1.0">`
>
>`<dict>`
>
>`  <key>Label</key>`
>
>`  <string>com.vrunt.FaceTimeAutoAnswer</string>`
>
>`  <key>Program</key>`
>
>`  <string>/usr/bin/osascript</string>`
>
>`  <key>ProgramArguments</key>`
>
>`  <array>`
>
>`    <string>osascript</string>`
>
>`    <string>/{PATH_TO_SCRIPT}/facetime-auto-answer.scpt</string>`
>
>`  </array>`
>
>`  <key>RunAtLoad</key>`
>
>`  <true/>`
>
>`  <key>KeepAlive</key>`
>
>`  <true/>`
>
>`</dict>`
>
>`</plist>`


Run this command in Terminal: `launchctl load -w com.vrunt.facetime-auto-accept.plist`

Say hi to your pet for me.
