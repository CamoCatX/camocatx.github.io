require 'cssminify2'

compressor = CSSminify2.new
compressor.compress(File.read("/_sass/base.scss"))
# => minified CSS
