\version "2.20.0"

melody = \relative c'' {
  \common

  \barNumberCheck #1
  s2. | s2. | s2. | s2. |

}

middle = \relative c' {
  \common

  \barNumberCheck #1
  s2. | s2. | s2. | s2. |

}

bass = \relative c, {
  \common

  \barNumberCheck #1
  s2. | s2. | s2. | s2. |

}

guitar = {
  \clef "treble_8"

  <<
    \melody \\
    \voiceThree \middle \\
    \voiceTwo \bass
  >>
}
