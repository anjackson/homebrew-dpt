require 'formula'

class Phantomjs < Formula
  url "https://phantomjs.googlecode.com/files/phantomjs-1.5.0-source.tar.gz"
  head "https://github.com/ariya/phantomjs.git"
  homepage 'http://www.phantomjs.org/'
  sha1 "4a70170c854e8e56f39e1e3786a1875af0f76afd"

  depends_on 'qt'

  def install
    system "./build.sh"
    #bin.install "bin/phantomjs"
  end
end
