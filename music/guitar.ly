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
  f8\( aes c4\) c\( |
  f,4\) bes4. c8 |

  \barNumberCheck #6 % ... fernen Triften sehend,
  bes4 a aes8\( bes\) |
  <aes f>4 g <ees' bes ees,>8 <d bes ees,> |

  \barNumberCheck #8 % ... dich, Geliebte, fand.
  q4 <c aes ees>8 <bes g ees> <aes f d> <f d aes> |
  <ees g,>4 \appoggiatura bes8( bes'4.) ees,8 |
  d4 \appoggiatura bes8( bes'4.) d,8 |

}

alto = \relative c'' {
  \common
  \voiceThree

  \barNumberCheck #1 % Auf dem Hügel
  <bes g ees bes>4 \startModernBarre #6 #5 <bes g> \stopBarre <aes f> |
  <g ees> \startModernBarre #4 #4 <g ees g,> \stopBarre \oneVoice r |
  r \voiceThree <g ees c g>^\posIII \oneVoice r8 \voiceThree <g ees g,> |

  \barNumberCheck #4 % ... blaue Nebeland
  c,4 <f c> <f ees c> |
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
  c4 c' bes |
  bes ees s |

  \barNumberCheck #8 % ... dich, Geliebte, fand.

}

bass = \relative c {
  \common
  \voiceTwo

  \barNumberCheck #1 % Auf dem Hügel ...
  ees4 s s |
  s ees \oneVoice r |
  r \voiceTwo c \oneVoice r8 \voiceTwo bes |

  \barNumberCheck #4 % ... blaue Nebeland,
  aes4 aes a-0 |
  bes d ees |

  \barNumberCheck #6 % ... fernen Triften sehend,
  c2 d4 |
  ees2 <g, ees'>4 |

  \barNumberCheck #8 % ... dich, Geliebte, fand.
  aes4 aes8 bes bes bes |
  ees4 <ees g bes ees>2 |
  <ees f aes d>4 <ees f aes bes d>4. d'8 |

}

guitar = <<
  \clef "treble_8"
  % \mergeDifferentlyHeadedOn

  \new Voice = "soprano" \soprano
  \new Voice = "alto" \alto
  \new Voice = "tenor" \tenor
  \new Voice = "bass" \bass
>>
