CURRENT="`pwd`"

echo 'Ask for the administrator password upfront'
sudo -v

echo 'Keep-alive: update existing `sudo` time stamp until `.osx` has finished'
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo 'Menu bar: disable transparency'
defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool true

echo 'Menu bar: show remaining battery time (on pre-10.8); hide percentage'
defaults write com.apple.menuextra.battery ShowPercent -string "NO"
defaults write com.apple.menuextra.battery ShowTime -string "YES"

echo 'Set highlight color to green'
defaults write NSGlobalDomain AppleHighlightColor -string '0.764700 0.976500 0.568600'

echo 'Expand save panel by default'
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo 'Expand print panel by default'
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

echo 'Save to disk (not to iCloud) by default'
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

echo 'Disable the “Are you sure you want to open this application?” dialog'
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo 'Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window'
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

echo 'Check for software updates daily, not just once per week'
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

echo 'Restart automatically if the computer freezes'
systemsetup -setrestartfreeze on

echo 'Set a blazingly fast keyboard repeat rate'
defaults write NSGlobalDomain KeyRepeat -int 0

echo 'Disable auto-correct'
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo 'Save screenshots to the desktop'
defaults write com.apple.screencapture location -string "$HOME/Desktop"

echo 'Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)'
defaults write com.apple.screencapture type -string "png"

echo 'Finder: show hidden files by default'
defaults write com.apple.finder AppleShowAllFiles -bool true

echo 'Finder: show all filename extensions'
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo 'Display full POSIX path as Finder window title'
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

echo 'Disable the warning when changing a file extension'
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo 'Avoid creating .DS_Store files on network volumes'
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo 'Automatically open a new Finder window when a volume is mounted'
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

echo 'Use list view in all Finder windows by default Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`'
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

echo 'Disable the warning before emptying the Trash'
defaults write com.apple.finder WarnOnEmptyTrash -bool false

echo 'Empty Trash securely by default'
defaults write com.apple.finder EmptyTrashSecurely -bool true

echo 'Enable spring loading for all Dock items'
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

echo 'Show indicator lights for open applications in the Dock'
defaults write com.apple.dock show-process-indicators -bool true

echo 'Don’t animate opening applications from the Dock'
defaults write com.apple.dock launchanim -bool true

echo 'Set dock tile size'
defaults write com.apple.dock tilesize -int 60

echo 'set dock tile large size'
defaults write com.apple.dock largesize -int 85

echo 'autohide dock'
defaults write com.apple.dock autohide -bool true

echo 'remove delay'
defaults write com.apple.dock autohide-delay -float 0

echo 'Speed up Mission Control animations'
defaults write com.apple.dock expose-animation-duration -float 0.1

echo 'Don’t group windows by application in Mission Control'
defaults write com.apple.dock expose-group-by-app -bool false

echo 'Disable local Time Machine backups'
hash tmutil &> /dev/null && sudo tmutil disablelocal

echo 'Allow text selection in the Quick Look window'
defaults write com.apple.finder QLEnableTextSelection -bool true

echo 'Disable the sudden motion sensor as it’s not useful for SSDs'
sudo pmset -a sms 0

echo 'Disable the crash reporter'
defaults write com.apple.CrashReporter DialogType -string "none"

echo 'Stop iTunes from responding to the keyboard media keys'
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

echo 'Require password immediately after sleep or screen saver begins'
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo 'Don’t display the annoying prompt when quitting iTerm'
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

echo 'Disable natural scrolling'
defaults write -g com.apple.swipescrolldirection -bool false

echo 'Disable useless dashboard'
defaults write com.apple.dashboard mcx-disabled -boolean YES && killall Dock
