\version "2.20.0"

guitarDynamics = {

  \barNumberCheck #1
  s4\p s2 | s2. | s2. | s2. | s2. |
  s2. | s4 s s8\< s\! | s4\> s8\! s s4 | s4 s4.\> s8\! | s4 s\> s\! |

}

melody = \relative c' {
  \common

  \barNumberCheck #1

  s2. | s2. | s2. |
  f8\( aes c4\) c\( |
  f,4 \) bes4. c8 |
  bes4 a aes8\( bes\) |

}

middle = \relative c'' {
  \common

  \barNumberCheck #1
  <bes g ees bes>4 \startModernBarre #6 #5 <bes g> \stopBarre <aes f> |
  <g ees> \startModernBarre #4 #4 <g ees g,> \stopBarre r |
  r <g ees c g> r8 <g ees g,> |
  c,4 <f c> <f ees c> |
  d f g |
  <ees ges>2 f4 |

}

bass = \relative c {
  \common

  \barNumberCheck #1
  ees4 s s |
  s ees r |
  r c r8 bes |
  aes4 aes a-0 |
  bes d\( ees |
  c2 \)

}

guitar = {
  \clef "treble_8"

  <<
    \melody \\
    \voiceThree \middle \\
    \voiceTwo \bass
  >>
}
