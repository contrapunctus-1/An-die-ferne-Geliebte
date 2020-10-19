\version "2.20.0"

pos =
#(define-event-function
  (parser location position)
  (markup?)
  #{
    \markup \small \bold #position
  #}
)

posIII = \markup \small \bold "III"
posIV = \markup \small \bold "IV"
posVI = \markup \small \bold "VI"

guitarDynamics = {

  \barNumberCheck #1 % Auf dem Hügel
  s4\p s2 | s2. | s2. | s2. | s2. |
  s2. | s4 s s8\< s\! | s4\> s8\! s s4 | s4 s4.\> s8\! | s4 s\> s\! |

}

soprano = \relative c' {
  \common
  \voiceOne

  \barNumberCheck #1 % Auf dem Hügel
  s2. | s2. | s2. |

  \barNumberCheck #4 % ... blaue Nebeland
  f8-3^\posIV \( aes c4\) c\( |
  f,4\) bes4. c8 |

  \barNumberCheck #6 % ... fernen Triften sehend,
  bes4 a aes8\( bes\) |
  <aes f>4 \startModernBarre #3 #3 g \stopBarre <ees' bes>8 <d bes> |

  \barNumberCheck #8 % ... dich, Geliebte, fand.
  q4 <c ees,>8 <bes g ees> <aes f d> <f d aes> |
  <ees g,>4 \appoggiatura bes8( bes'4.) ees,8 |
  d4 \appoggiatura bes8( bes'4.) d,8 |

}

alto = \relative c'' {
  \common
  \voiceThree

  \barNumberCheck #1 % Auf dem Hügel
  <bes g ees bes>4 \startModernBarre #6 #5 <bes g> \stopBarre <aes-2 f-3> |
  <g-3 ees-4> <g ees g,>^\posVI \oneVoice r |
  r \voiceThree <g ees c g>^\posIII \oneVoice r8 \voiceThree <g-2 ees-3>^\posVI |

  \barNumberCheck #4 % ... blaue Nebeland
  c,4-2 <f c> <f ees> |
  d f g |

  \barNumberCheck #6 % ... fernen Triften sehend,
  <ees ges>2 f4 |
  s2. |

  \barNumberCheck #8 % ... dich, Geliebte, fand.
  s2. |

}

tenor = \relative c {
  \common
  \voiceThree

  \barNumberCheck #1 % Auf dem Hügel
  s2. | s2. | s2. |

  \barNumberCheck #4 % ... blaue Nebeland
  s2. | s2. |

  \barNumberCheck #6 % ... fernen Triften sehend,
  c4 c' \parenthesize bes |
  bes ees s |

  \barNumberCheck #8 % ... dich, Geliebte, fand.

}

bass = \relative c {
  \common
  \voiceTwo

  \barNumberCheck #1 % Auf dem Hügel ...
  ees4 s s |
  s ees \oneVoice r |
  r \voiceTwo c \oneVoice r8 \voiceTwo bes-1 |

  \barNumberCheck #4 % ... blaue Nebeland,
  aes4-1 aes a-0 |
  bes d ees |

  \barNumberCheck #6 % ... fernen Triften sehend,
  c2 d4 |
  ees2
  \set Staff.ottavation = #"8vb"
  \once \override Staff.OttavaBracket.direction = #DOWN
  \set Voice.middleCPosition = #1
  g4 |

  \barNumberCheck #8 % ... dich, Geliebte, fand.
  aes4 aes8 bes bes
  \unset Staff.ottavation
  \unset Voice.middleCPosition
  bes, |
  ees4 <ees g bes ees>2 |
  <f aes d>4 <ees aes d f>4. d'8 |

}

guitar = <<
  \clef "treble_8"
  % \mergeDifferentlyHeadedOn

  \new Voice = "soprano" \soprano
  \new Voice = "alto" \alto
  \new Voice = "tenor" \tenor
  \new Voice = "bass" \bass
>>
