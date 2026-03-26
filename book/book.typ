#set document(title: [Population genetics notes], author: "Kevin Thornton")

// Page break before every section (H1) heading
#show heading.where(level: 1, outlined: true): it => {
	pagebreak()
	it
}

#place(top + center, {
  title()
  v(5pt)
  "Kevin Thornton"
  v(5pt)
  "UC Irvine"
})

#pagebreak()

#outline(depth: 1)

#include "frequencies.typ"
#include "hwe.typ"
