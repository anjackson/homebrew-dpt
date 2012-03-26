require 'formula'

class PhantomjsBin < Formula
  url "https://phantomjs.googlecode.com/files/phantomjs-1.5.0-macosx-static.zip"
  head "https://github.com/ariya/phantomjs.git"
  homepage 'http://www.phantomjs.org/'
  sha1 "b87152ce691e7ed1937d30f86bc706a408d47f64"

  def install
    bin.install "bin/phantomjs"
    bin.install "bin/Info.plist"
  end
end
