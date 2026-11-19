cask "codexbar@5" do
  version "5.2.8"
  sha256 "d440f6a10ad793fc52eea402a1a0e6040c61dd88f16de5b26f164dda5bd6e8d1"

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
