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

chds = \chordmode {
  \set additionalPitchPrefix = "add"
  c1 d:m7.11 e:m6- 
  f:1.3.5.9 g:3.5.11 a:m7
}

right = \relative c'' {
  \global
  r1 <g c> c g c g
}

left = \relative c {
  \global
  <c e g>1 <d f a> <e g b> <f a c> <g b d> <a c e>
}

\score {
  \new PianoStaff \with {
  } <<
    \new ChordNames {
      \chds 
    }
    \new Staff = "right" \with {
      midiInstrument = "acoustic grand"
    } {
      \new Voice = "right" {
        \right
      }
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
