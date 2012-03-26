require 'formula'

class XercesC28 < Formula
  url 'http://mirror.switch.ch/mirror/apache/dist/xerces/c/2/sources/xerces-c-src_2_8_0.tar.gz'
  homepage 'http://xerces.apache.org/xerces-c/install-2.html'
  md5 '5daf514b73f3e0de9e3fce704387c0d2'

  def install
    ENV.deparallelize
    ENV['XERCESCROOT'] = `pwd`.strip
    Dir.chdir "src/xercesc"
    system "./runConfigure -p macosx -c gcc -x g++ -m inmem -n native -t native -r pthread -s -b 64 -P#{prefix}"
    system "make; make"
    system "make install"
  end

  def test
    # This test will fail and we won't accept that! It's enough to just
    # replace "false" with the main program this formula installs, but
    # it'd be nice if you were more thorough. Test the test with
    # `brew test xerces-c-src`. Remove this comment before submitting
    # your pull request!
    system "false"
  end
end
