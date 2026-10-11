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

right = \relative c' {
  \global
  % Music follows here.
   \set glissandoMap = #'((1 . 1))
   \set fingeringOrientations = #'(right)
   <ef-9 df-8 af-6>1%\glissando
   <ef-6 c-5 af-4>
}

left = \relative c {
  \global
  \set glissandoMap = #'((1 . 1))
  << { 
    \set fingeringOrientations = #'(right)
    <af-3 f'-5>1%\glissando
    <af-2 ef'-3> } \\ { \absolute {
       \set fingeringOrientations = #'(right)
       \hide Stem \teeny \parenthesize df,,4*4-1 \parenthesize af,, -1
  } } >>
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
    \new Staff = "left" \with {
      midiInstrument = "acoustic grand"
    } { \clef bass \left }
  >>
  \layout { }
  \midi {
    \tempo 4=100
  }
}
