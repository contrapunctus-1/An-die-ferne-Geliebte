\version "2.18.2"

\include "common.ly"

\include "music/voice.ly"
\include "lyrics.ly"

\include "lsr952.ly"
\include "music/guitar.ly"

\header {
  title    = \markup \fontsize #2 "An die ferne Geliebte"
  composer = "Ludwig van Beethoven"
  poet = "Alois Jeitteles"
  arranger = "arr. Kashish"
  copyright = \copyright

}

\score {
  <<
    \new Staff << \new Voice = "voice" { \voice } >>
    \new Lyrics \voiceLyrics
    \new Staff << \new Voice { \guitar } >>
    \new Dynamics { \guitarDynamics }
  >>

  \layout {
    \context {
      \Staff \RemoveEmptyStaves
    }
  }
}
