cask "manager" do
  arch arm: "arm64", intel: "x64"

  version "23.12.7.1215"
  sha256 :no_check

  url "https://github.com/Manager-io/Manager/releases/download/#{version}/Manager-osx-#{arch}.dmg",
      verified: "github.com/Manager-io/Manager/"
  name "Manager.io"
  desc "Free accounting software for Windows, Mac OS and Linux"
  homepage "https://www.manager.io/"

  app "Manager.app"

  zap trash: [
    "~/.local/share/Manager",
  ]
end
