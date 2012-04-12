require 'formula'

class Tika < Formula
  url 'http://www.apache.org/dyn/closer.cgi/tika/tika-app-1.1.jar'
  homepage 'http://tika.apache.org/'
  md5 'c69f77dc7f10ab240ed1939687a45574'
  sha1 '6c442b0b4b4dfa2d80c78ecaa70b9a5be8a86991'
  # version '1.1'

  # depends_on 'cmake'

  def install
    lib.install ['tika-app-#{version}.jar']
    myStr = <<-EOF
#!/bin/sh
java -jar #{prefix/lib/tika-app-#{version}.jar
EOF
    aFile = File.new("tika", "w")
    aFile.write(myStr)
    aFile.close
    bin.install ['tika']
  end

  def test
    # This test will fail and we won't accept that! It's enough to just
    # replace "false" with the main program this formula installs, but
    # it'd be nice if you were more thorough. Test the test with
    # `brew test opffs`. Remove this comment before submitting
    # your pull request!
    system "tika"
  end
end
