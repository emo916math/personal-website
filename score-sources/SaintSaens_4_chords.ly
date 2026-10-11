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
  \time 4/1
}

rightOne = \relative a' {
  \global
  <d bf~ f~ bf,>1 <ef bf~ f~ c> <f bf,~ f^~ d> <g bf, f ef>
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
