require 'formula'

class Opffs < Formula
  url 'https://github.com/openplanets/opffs/tarball/master'
  homepage 'http://www.openplanetsfoundation.org/:w'
  md5 'd19337aec21e095108d734959967148b'
  version '0.0.1'

  # depends_on 'cmake'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    # system "cmake . #{std_cmake_parameters}"
    ENV['DESTDIR'] = "/usr/local/bin"
    system "make install"
  end

  def test
    # This test will fail and we won't accept that! It's enough to just
    # replace "false" with the main program this formula installs, but
    # it'd be nice if you were more thorough. Test the test with
    # `brew test opffs`. Remove this comment before submitting
    # your pull request!
    system "opffs"
  end
end
