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
  \key c \major
  \omit Staff.TimeSignature
  \cadenzaOn
}

right = \relative c, {
  \global
  % Music follows here.
   \down g g' d' g b \up d f g a b cs? d ef?
}

left = \relative c' {
  \global
  s4*13
}

numbers = \lyricmode {
  "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
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
    \new Lyrics \lyricsto "right" {
      \numbers
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
