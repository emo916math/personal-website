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
  \key af \major
  \omit Staff.TimeSignature
  \cadenzaOn
}

right = \relative c'' {
  \global
  <c af f c>1 q <df af f df>
}

left = \relative c {
  \global
  << {\teeny <f, c' f> <ef bf' ef> <df af' df> } \\ { f, ef df } >>
}

\score {
  \new PianoStaff \with {
  } <<
    \new Staff = "right" \with {
      midiInstrument = "acoustic grand"
    } {
      \new Voice = "right" {
        \right
      }
    }
    \new Dynamics {
      s1 s s1
    }
    \new Staff = "left" \with {
      midiInstrument = "acoustic grand"
    } { \clef bass \left }
  >>
  \layout { }
  \midi {
    \tempo 4=100
  }
}
