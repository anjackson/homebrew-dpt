require 'formula'

class WgetWarc < Formula
  homepage 'http://archiveteam.org/index.php?title=Wget_with_WARC_output'
  url 'https://github.com/downloads/alard/wget-warc/wget-warc-20110809.tar.bz2'
  md5 '5e8bfa47cf0f19a40ed930befc1eb4a2'

  depends_on "openssl" if MacOS.leopard?
  depends_on "libidn" if ARGV.include? "--enable-iri"

  def options
    [["--enable-iri", "Enable iri support."]]
  end

  def install
    args = ["--disable-debug",
            "--prefix=#{prefix}",
            "--sysconfdir=#{etc}",
            "--with-ssl=openssl"]

    args << "--disable-iri" unless ARGV.include? "--enable-iri"

    system "./configure", *args
    system "make install"
  end

  def test
    system "#{bin}/wget -O - www.google.com"
  end
end
