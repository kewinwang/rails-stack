# Build Essential
package :build_essential, :provides => :init do
  description 'Build tools and libraries, such like build-essential, git and more.'
  apt 'build-essential git git-core zlib1g zlib1g-dev libssl-dev libreadline5-dev libcurl4-openssl-dev' do
    pre  :install, "apt-get -y update"
  end
  requires :imagemagick
end

package :imagemagick do
  description "Image Magick"
  apt 'imagemagick librmagick-ruby'
  verify do
    has_executable "convert"
  end
end