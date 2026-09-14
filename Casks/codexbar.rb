cask "codexbar" do
  version "4.0.1"
  sha256 "2e265932981eca711644867ea454ff9c9c57e9c01c2618d1a4cde299666cc95d"

  url "https://codexbar.zabrian.app/download/CodexBar-v#{version}.dmg"
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
