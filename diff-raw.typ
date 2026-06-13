#import "diff-function.typ": diff-string

#let split-diff-text(text, separator) = {
  let body = text.trim()
  let pos = body.position(separator)
  if pos == none {
    panic("diff must contain separator: " + repr(separator))
  }
  (
    body.slice(0, pos).trim(),
    body.slice(pos + separator.len()).trim(),
  )
}

#let diff-from-text(
  input,
  separator: "\n---\n",
  format-plus: x => text(x, fill: blue, weight: "bold"),
  format-minus: x => strike(text(x, fill: red, size: 0.75em)),
  split-regex: "[^A-Za-z0-9]",
) = {
  let (old, new) = split-diff-text(input, separator)
  diff-string(
    old,
    new,
    format-plus: format-plus,
    format-minus: format-minus,
    split-regex: split-regex,
  )
}

#let diff-show(
  body,
  separator: none,
  block-separator: "\n---\n",
  inline-separator: "---",
  format-plus: x => text(x, fill: blue, weight: "bold"),
  format-minus: x => strike(text(x, fill: red, size: 0.75em)),
  split-regex: "[^A-Za-z0-9]",
) = {
  show raw.where(lang: "diff"): it => {
    let sep = if separator != none {
      separator
    } else if it.block {
      block-separator
    } else {
      inline-separator
    }
    diff-from-text(
      it.text,
      separator: sep,
      format-plus: format-plus,
      format-minus: format-minus,
      split-regex: split-regex,
    )
  }
  body
}
