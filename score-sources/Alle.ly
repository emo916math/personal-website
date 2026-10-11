\version "2.20.0"
\language "english"

\header {
  % Remove default LilyPond tagline
  tagline = ##f
}

\paper {
  #(set-paper-size "letter")
}

global = {
  \key d \dorian
  \numericTimeSignature
  \time 6/8
}

tenorOne = \relative c' {
  \global
  d4. c | d4 c8 b4 c8^"*" | d4. c16 b a4 | a4.
}

tenorTwo = \relative c' {
  \global
  a4. r | a g | a r | d 
}

bass = \relative c {
  \global
  d4. f4 e8^\markup{"*"} | d4. e | d r | d
}

tenorOneVerse = \lyricmode {
  Al -- le psal -- li -- te cum lu -- _ _ _ ya.
}

tenorTwoVerse = \lyricmode {
  Al -- _ _ _""
}

bassVerse = \lyricmode {
  % Lyrics follow here.
  Al -- le -- _ lu -- _ ya. Al-
}

\score {
  \new ChoirStaff <<
    \new Staff = "tt" \with {
      midiInstrument = "choir aahs"
    } <<
      \clef "treble_8"
      \new Voice = "tenor1" { \voiceOne \tenorOne }
      \new Voice = "tenor2" { \voiceTwo \tenorTwo }
    >>
    \new Lyrics \with {
      alignAboveContext = "tt"
      \override VerticalAxisGroup #'staff-affinity = #DOWN
    } \lyricsto "tenor1" \tenorOneVerse
    \new Lyrics \lyricsto "tenor2" \tenorTwoVerse
    \new Staff \with {
      midiInstrument = "choir aahs"
    } {
      \clef bass
      \new Voice = "bass" \bass
    }
    \new Lyrics \lyricsto "bass" \bassVerse
  >>
  \layout { }
  \midi {
    \tempo 4=100
  }
}
