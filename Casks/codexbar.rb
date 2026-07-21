cask "codexbar" do
  version "3.4.0"
  sha256 "5365cedd342776639db7f9cdf282677a495cb6eebe0dca65ea2e3e289ce59333"

  url "https://codexbar.zabrian.app/download/CodexBar-v#{version}.dmg",
      verified: "codexbar.zabrian.app/"
  name "CodexBar"
  desc "Menu bar dashboard for Codex account status, quota, and usage"
  homepage "https://github.com/bob-zebedy/CodexBar"

  livecheck do
    url "https://codexbar.zabrian.app/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sequoia

  app "CodexBar.app"

  uninstall quit: "app.zabrian.codexbar"

  zap trash: [
    "~/Library/Caches/app.zabrian.codexbar",
    "~/Library/HTTPStorages/app.zabrian.codexbar",
    "~/Library/Preferences/app.zabrian.codexbar.plist",
    "~/Library/Saved Application State/app.zabrian.codexbar.savedState",
  ]

  caveats <<~EOS
            CodexBar requires Codex CLI or Codex.app to be installed and logged in.
          EOS
end
