\version "2.18.2"

common = {
  \time 3/4
  \key ees \major
}

copyright = \markup
\center-column {
  \smaller {
    "The author of this arrangement, contrapunctus/Kashish (xmpp:contrapunctus@jabber.fr), would like to release it into the"
    \raise #1
    \concat {
      \bold "public domain "
      "using the Creative Commons CC0 License - "
      \with-url #"http://creativecommons.org/publicdomain/zero/1.0/"
      {http://creativecommons.org/publicdomain/zero/1.0/}
    }
  }
}
