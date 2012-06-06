require 'formula'

class Fishfish < Formula
  url 'http://ridiculousfish.com/shell/files/fishfish.tar.gz'
  version '0.9.1'
  homepage 'http://ridiculousfish.com/shell/'
  md5 'ebe5fe17f6925b9142aadc8ebae5fba1'

  head 'git://gitorious.org/~ridiculousfish/fish-shell/fishfish.git'

  # Indeed, the head build always builds documentation
  depends_on 'doxygen' => :build if ARGV.build_head?
  depends_on 'autoconf' => :build if MacOS.xcode_version.to_f >= 4.3 and ARGV.build_head?
  depends_on 'readline'
  skip_clean 'share/doc'

  def install
    system "autoconf"
    system "./configure", "--prefix=#{prefix}", "--without-xsel"
    system "make install"
  end

  def caveats; <<-EOS.undent
    You will need to add:
      #{HOMEBREW_PREFIX}/bin/fish
    to /etc/shells. Run:
      chsh -s #{HOMEBREW_PREFIX}/bin/fish
    to make fish your default shell.
    EOS
  end
end
