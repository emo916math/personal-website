\version "2.20.0"
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
  \key e \major
  \omit Staff.TimeSignature
  \time 4/1
}

rightOne = \relative a' {
  \global
  <a b>1^~1^~1
}

rightTwo = \relative b {
  \global
  <b ds>1\glissando <cs e>\glissando <ds fs>
}

\score {
  
    \new Staff = "right" \with {
      midiInstrument = "acoustic grand"
    } <<
      \new Voice = "rightOne" {
        \rightOne
      } \\
      \new Voice = "rightTwo" {
        \rightTwo
      }
    >>
  \layout { }
  \midi {
    \tempo 4=100
  }
}
