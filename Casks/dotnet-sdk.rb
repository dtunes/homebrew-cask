cask 'dotnet-sdk' do
  version '2.2.104'
  sha256 '4494b2084d6fba0e7e708faee1237b3a596bc6030cdb81579a24df85ec651d72' # DevSkim: ignore DS173237

  url "https://download.visualstudio.microsoft.com/download/pr/3fb2ae01-c8c5-4d0a-9102-31c8c3386bc5/94b144257db9c52405d7f7e03adc31a9/dotnet-sdk-#{version}-osx-gs-x64.pkg"
  appcast 'https://www.microsoft.com/net/download/macos'
  name '.NET Core SDK'
  homepage 'https://www.microsoft.com/net/core#macos'

  conflicts_with cask: [
                         'dotnet',
                         'dotnet-preview',
                         'dotnet-sdk-preview',
                       ]
  depends_on macos: '>= :sierra'

  pkg "dotnet-sdk-#{version}-osx-gs-x64.pkg"

  uninstall pkgutil: 'com.microsoft.dotnet.*',
            delete:  [
                       '/etc/paths.d/dotnet',
                       '/etc/paths.d/dotnet-cli-tools',
                     ]

  zap trash: '~/.nuget'
end
