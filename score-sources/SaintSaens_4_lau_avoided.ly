\version "2.25.18"
\language "english"

\header {
  % Remove default LilyPond tagline
  tagline = ##f
}

down = { \change Staff = "left" }
up = { \change Staff = "right" }

\paper {
  #(set-paper-size "letter")
}

global = {
  \key bf \major
  \omit Staff.TimeSignature
  \time 1/1
}

rightOne = \relative a' {
  \global
  <c bf f a,>1
}

\score {
  
    \new Staff = "right" \with {
      midiInstrument = "acoustic grand"
    } <<
      \new Voice = "rightOne" {
        \rightOne
      }
    >>
  \layout { }
  \midi {
    \tempo 4=100
  }
}
