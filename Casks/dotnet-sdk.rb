cask 'dotnet-sdk' do
  version '2.2.104'
  sha256 'ed4c1c70661a5f65615659880b8615d611ea31aea6270d491c52042116424e49' # DevSkim: ignore DS173237

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
