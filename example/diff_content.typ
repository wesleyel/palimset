#import "@preview/js:0.1.3": *
#import "../src/lib.typ": *

#show: js

#let a = [
  こんにちは，世界！
  あいうえおHello, world!
  #text(fill: green, [かき$ sin $くけこ])
  #set text(size: 15pt)
  こんばんは
  これはテストです．
  これは削除した行です
]

#let b = [
  こんばんは，世間！
  あいうえおHello, world!
  #text(fill: green, [かき$ sin $くこけ])
  #set text(size: 15pt)
  こんばんは
  これはテストです．
  $
    H(X) = integral p(x) log p(x) space "d" x
  $
  これは追加した行です
]

#diff-content(a, b)
