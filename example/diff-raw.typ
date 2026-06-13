#import "../lib.typ": diff-show

#set page(margin: 2cm)
#show: diff-show

= Block diff

```diff
Dear Paul

Thanks for paying attention.
---
Dear Paul,

Thank you for showing interest.
```

= Inline diff

Inline edits like ```diff Thanks---Thank you``` stay on the same line.

= Custom separator

#show: diff-show.with(block-separator: "\n:::\n", inline-separator: ":::")

```diff
old paragraph

:::
new paragraph
```

And inline ```diff old text:::new text```.
