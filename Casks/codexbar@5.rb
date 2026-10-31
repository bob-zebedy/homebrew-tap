cask "codexbar@5" do
  version "5.2.0"
  sha256 "59922243bef760523555c469338dad42a543aec5fc622efb7e1a8d54c7bc5632"

  url "https://codexbar.zabrian.app/download/CodexBar-v#{version}.dmg"
  name "CodexBar"
  desc "Menu bar dashboard for Codex account status, quota, and usage"
  homepage "https://github.com/bob-zebedy/CodexBar"

  livecheck do
    url "https://codexbar.zabrian.app/appcast.xml"
    strategy :sparkle do |items|
      items.filter_map(&:short_version).select { |version| version.start_with?("5.") }
    end
  end

  auto_updates true
  conflicts_with cask: "bob-zebedy/tap/codexbar"
  depends_on macos: :sequoia

  app "CodexBar.app"

  uninstall quit: "app.zabrian.codexbar"

  zap trash: [
    "~/Library/Application Support/CodexBar Data",
    "~/Library/Caches/app.zabrian.codexbar",
    "~/Library/HTTPStorages/app.zabrian.codexbar",
    "~/Library/HTTPStorages/app.zabrian.codexbar.binarycookies",
    "~/Library/Preferences/app.zabrian.codexbar.plist",
    "~/Library/Saved Application State/app.zabrian.codexbar.savedState",
  ]

  caveats <<~EOS
            CodexBar requires Codex CLI or Codex.app to be installed and logged in.
          EOS
end
