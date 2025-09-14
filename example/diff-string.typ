#import "@preview/js:0.1.3": *
#import "../src/lib.typ": *

#show: js

#let a = "world, こんばんは"
#let b = "hello, こんにちは"

#diff-string(a, b)
