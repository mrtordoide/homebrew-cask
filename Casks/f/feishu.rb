cask "feishu" do
  arch arm: "arm64", intel: "x64"

  on_arm do
    version "7.6.8,ed9a8a19"
    sha256 "355842cbcb2e371855511c1e01a6a995e3725b5417d9f9fd2af6893a9d506134"
  end
  on_intel do
    version "7.6.8,41f47904"
    sha256 "3960b161951122e6640707674241f4a52de0947f970102f18f9b235b19c99e74"
  end

  url "https://sf3-cn.feishucdn.com/obj/ee-appcenter/#{version.csv.second}/Feishu-darwin_#{arch}-#{version.csv.first}-signed.dmg",
      verified: "sf3-cn.feishucdn.com/obj/ee-appcenter/"
  name "Feishu"
  desc "Project management software"
  homepage "https://www.feishu.cn/"

  livecheck do
    url "https://www.feishu.cn/api/downloads"
    regex(%r{/(\h+)/Feishu[._-]darwin[._-]#{arch}[._-]v?(\d+(?:\.\d+)+)[._-]signed\.dmg}i)
    strategy :page_match do |page|
      page.scan(regex)
          .map { |match| "#{match[1]},#{match[0]}" }
    end
  end

  auto_updates true

  # Renamed for consistency: app name is different in the Finder and in a shell.
  app "Lark.app", target: "Feishu.app"

  zap trash: [
    # feishu
    "~/Library/Caches/com.bytedance.lark.helper",
    "~/Library/Preferences/com.bytedance.lark.helper.plist",
    # lark
    "~/Library/Caches/com.electron.lark.helper",
    "~/Library/Preferences/com.electron.lark.helper.plist",
    # both
    "~/Library/Caches/com.electron.lark",
    "~/Library/Saved Application State/com.electron.lark.savedState",
  ]
end
