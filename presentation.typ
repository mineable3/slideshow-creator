// Sets the metadata on the pdf
#set document(
  title: [Presentation Template],
  author: "Emmet Spaeth",
  description: [A template presentation in typst],
  keywords: ("informative", "keywords"),
  date: auto
)

// Sets up the page
#set page(
  // This is the 16:9 ratio
  width: 1920pt,
  height: 1090pt, // Technically it's 1080, but 1090 leaves no gaps

  // Shows up as white, but is "transparent" when printing (uses no ink)
  fill: none,

  // Numbering the pages
  //numbering: "1",
  footer: [
    #set align(right)

    #set text(
      font: "Libertinus Serif",
      style: "normal",
      fill: black,
      size: 48pt,
      weight: "regular",
    )

    #place(
      right,
      dx: 5%,
      dy: -50pt,
      context [
        #counter(page).display(
          "1/1",
          both: true,
        )
      ]
    )
  ],

  margin: (
    y: 2.0cm,
  )
)


#let title_slide(title, subtitle: none, author: none) = {
  let _title = {
    set text(
      size: 140pt,
      font: "arial",
      fill: white,
      weight: "bold",
    )

    set align(center)

    block(
      width: 100%,
      height: 100%,
      radius: 10%,
      inset: 20pt,
      fill: rgb("#0074d9"),
      align(horizon)[#par(leading:0.3em)[#title]]
    )
  }

  let _subtitle = {
    set text(
      style: "oblique",
      size: 70pt,
    )

    set align(left + top)

    grid(
      columns: 2,
      column-gutter: 100pt,
      block(none),
      par(leading: 0.3em)[#subtitle]
    )
  }

  let _author = {
    set text(
      style: "italic",
      size: 48pt,
    )

    set align(left + bottom)

    if subtitle != none {
      grid(
        columns: 2,
        rows: 2,
        column-gutter: 100pt,
        row-gutter: 40pt,

        block(none),
        block(none),
        block(none),
        author
      ) 
    } else {
      grid(
        columns: 2,
        rows: 2,
        column-gutter: 100pt,

        block(none),
        block(none),
        block(none),
        author
      )
    }
  }

  set align(center + top)

  grid(
    rows: (60%, 10%, 15%),
    columns: 90%,
    row-gutter: (50pt, 25pt),
    //stroke: 5pt,

    _title,

    if subtitle != none {
      _subtitle
    },

    if author != none {
      _author
    },
  )
}

#let text_slide(title, body) = {
  let _title = {
    set text(
      size: 64pt,
      font: "arial",
      fill: white,
      weight: "bold",
    )

    set align(center)

    block(
      width: 100%,
      height: 100%,
      radius: 10%,
      inset: 20pt,
      fill: rgb("#0074d9"),

      align(horizon + left)[
        #grid(
          columns: (2%, 98%),
          none,
          align(horizon + left)[#par(leading:0.3em)[#title]]
        )
      ]
    )
  }

  let _body = {
    set text(
      size: 48pt,
      font: "arial",
      fill: black,
    )

    set align(left)

    grid(
      columns: (2%, 98%),
      none,
      body,
    )
  }

  set align(top)
  grid(
    rows: (20%, 70%),
    row-gutter: 5%,
    //stroke: 5pt,
    _title,
    _body,
  )
}

#let double_text_slide(title, body1, body2) = {
  let _title = {
    set text(
      size: 64pt,
      font: "arial",
      fill: white,
      weight: "bold",
    )

    set align(center)

    block(
      width: 100%,
      height: 100%,
      radius: 10%,
      inset: 20pt,
      fill: rgb("#0074d9"),

      align(horizon + left)[
        #grid(
          columns: (2%, 98%),
          none,
          align(horizon + left)[#par(leading:0.3em)[#title]]
        )
      ]
    )
  }

  let _body1 = {
    set text(
      size: 48pt,
      font: "arial",
      fill: black,
    )

    set align(left)

    grid(
      columns: (2%, 98%),
      none,
      body1,
    )
  }

  let _body2 = {
    set text(
      size: 48pt,
      font: "arial",
      fill: black,
    )

    set align(left)

    grid(
      columns: (2%, 98%),
      none,
      body2,
    )
  }
  set align(top)
  grid(
    rows: (20%, 70%),
    row-gutter: 5%,
    //stroke: 5pt,
    _title,
    grid(
      columns: 2,
      _body1,
      _body2,
    ),
  )
}

#let section_slide(title) = {
  let _title = {
    set text(
      size: 64pt,
      font: "arial",
      fill: white,
      weight: "bold",
    )

    set align(horizon + center)

    block(
      width: 100%,
      height: 30%,
      radius: 10%,
      inset: 20pt,
      fill: rgb("#0074d9"),

      align(horizon + center)[#par(leading:0.3em)[#title]]
    )
  }

  _title
}

#title_slide(
  "PID controllers",
  subtitle: "A short, concise, subtitle",
  author: "Emmet Spaeth and Spaeth Emmet",
)

#pagebreak()

#text_slide(
  "Random CS jabber",
  lorem(100),
)

#pagebreak()

#section_slide("BBLs and other interests")

#pagebreak()

#double_text_slide(
  "Thingy majigy",
  lorem(50),
  lorem(50),
)

#text_slide(
  "Random CS jabber " + lorem(10),
  lorem(50),
)

#pagebreak()

#text_slide(
  lorem(8),
  lorem(60),
)

#pagebreak()

#title_slide(
  "A really long and drawn out title about PID controllers",
  subtitle: "A very cool thing that I am building. It takes a very large subtitle comment to explain exactly",
  author: "Emmet Spaeth and Spaeth Emmet",
)

#pagebreak()

#double_text_slide(
  "Thingy majigy",
  lorem(50),
  lorem(50),
)

