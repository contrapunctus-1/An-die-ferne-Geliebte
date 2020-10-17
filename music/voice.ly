\version "2.18.2"

voice = \relative c'' {
  \set Staff.instrumentName = "Voice"
  \common

  \barNumberCheck #1 % Auf dem Hügel
  r4 bes bes |
  bes4. c8 d ees |
  ees4 g,8 r aes g |

  \barNumberCheck #4 % ... blaue Nebeland
  f aes c4 c |
  f, bes4. c8 |

  \barNumberCheck #6 % ... fernen Triften sehend,
  bes4 a aes8 bes |
  aes4 g ees'8 d |

  \barNumberCheck #8 % ... dich, Geliebte, fand.
  d4( c8) bes aes f |
  ees4 r r |
  r2. |

}
