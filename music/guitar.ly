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
  \set fingeringOrientations = #'(right)

  \barNumberCheck #1 % Auf dem Hügel
  s2. | s2. | s2. |

  \barNumberCheck #4 % ... blaue Nebeland
  <f-3>8^\posIV \( aes c4\) c\( |
  f,4\) s2 |

  \barNumberCheck #6 % ... fernen Triften sehend,
  s2. |
  s2 <ees'-4 bes-3>8 <d-1 bes-3> |

  \barNumberCheck #8 % ... dich, Geliebte, fand.
  q4 <c ees,>8 <bes g ees> <aes f d> <f d aes> |
  <ees g,>4 \appoggiatura bes8( bes'4.) ees,8 |
  d4 \appoggiatura bes8( bes'4.) d,8 |

  \barNumberCheck #11 % Weit bin ich ...
  f8 <aes, f> q <g e> <bes g> <aes f> |
  <g' ees>8 r <g bes,>8 r16 q q8 r |
  r4 <g ees>8 r16 q <ees' aes, ees>8 <g, ees> |
  <f c>8 r q8 r16 q <c' f, ees c>8 r |
  <f, d>8 r <bes f>8 r16 q <bes g>8 r |
  r4 <a ges>8 r16 <ges' aes, ges> <f aes, f>8 r |
  r4 g,8 r16 f' <ees ees,>8 <d ees,> |
  << \relative c'' { d4\( c8\) <bes ees,> <aes d,> <f d aes> | } \\ \relative c' { ees4. s | } >>
  <ees, g,>4 \appoggiatura bes8 bes'4.-> e,8 |
  <d aes f>4 \appoggiatura bes8 bes'4.-> d,8 |

}

alto = \relative c'' {
  \common
  \voiceThree
  \set fingeringOrientations = #'(right)

  \barNumberCheck #1 % Auf dem Hügel
  <bes g ees bes>4 \startModernBarre #6 #5 <bes g> \stopBarre <aes-2 f-3> |
  <g-3 ees-4> <g ees g,>^\posVI \oneVoice r |
  r \voiceThree <g ees c g>^\posIII \oneVoice r8 \voiceThree <g-2 ees-3>^\posVI |

  \barNumberCheck #4 % ... blaue Nebeland
  <c,-2>4 <f c> <f ees> |
  d f g |

  \barNumberCheck #6 % ... fernen Triften sehend,
  <ees ges>2 f4 |
  f4 s2 |

  \barNumberCheck #8 % ... dich, Geliebte, fand.
  s2. |

}

tenor = \relative c {
  \common
  \voiceThree
  \set fingeringOrientations = #'(right)

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
  \set fingeringOrientations = #'(right)

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
  <g-0>4 |

  \barNumberCheck #8 % ... dich, Geliebte, fand.
  aes4 aes8 bes bes
  \unset Staff.ottavation
  \unset Voice.middleCPosition
  bes, |
  ees4 <ees g bes ees>2 \startModernBarre #6 #5 |
  <f aes d>4 <ees aes d-2 f>4. d'8 \stopBarre |

  \barNumberCheck #11 % Weit bin ich ...
  f8 <aes, f>8 q <g e> <bes g> <aes f> |
  <g ees> r ees8 r16 ees ees,8 r |
  r4 c''8 r16 c c,8 bes |
  aes8 r aes'8 r16 <aes aes,> <a a,>8 r |
  <bes bes,>8 r <bes d,>8 r16 q <bes ees,>8 r |
  r4 <ees c>8 r16 <c c,> <d bes d,>8 r |
  r4 ees8 r16 <bes g> q8 q |
  << \relative c' {
    bes8 b c <bes g bes,> <aes f bes> <bes, bes,>
  }
     \\ \relative c {
       aes4. s |
     } >>
  <ees ees,>4 <ees bes g ees>8 r16 <g ees> <bes ees>8 r |
  <ees, ees,>4 <d aes f ees>8 r16 <f d> <aes f>8 d |
}

guitar = <<
  \clef "treble_8"
  % \mergeDifferentlyHeadedOn

  \new Voice = "soprano" \soprano
  \new Voice = "alto" \alto
  \new Voice = "tenor" \tenor
  \new Voice = "bass" \bass
>>
