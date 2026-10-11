\version "2.20.0"
\language "english"

\header {
  tagline = ##f
}

real = { \once \set suggestAccidentals = ##f }
m = \melisma 
me = \melismaEnd

\paper {
  #(set-paper-size "letter")
}

global = {
  \key g \dorian
  \time 3/4
  \set suggestAccidentals = ##t
}

tenorOne = \relative g {
  \global
  \dynamicUp
  g2\m bf8^"*" c^"*" \me | d4.\m c8^"*" d4\me | e2^"*" d4^"*" | c^"*"\m d8 f e^"*" d | f4\me \oneVoice r 
}

tenorTwo = \relative g {
  \global
  \dynamicUp
  d2\m f8 g\me | a4.\m g8 a4\me | b2 a4 | g\m a8 c b a | c4\me s 
}

scoreATenorVoiceI = {
  \global
  \dynamicUp
  <<\tenorOne \tenorTwo>>
}

verse = \lyricmode {
  Su -- mens il -- _ lud A -- ve
  Ga -- bri -- e -- lis o -- re,
  fun -- da nos in pa -- ce,
  mu -- tans He -- vae no -- men. 
}

bass = \relative c {
  \global
  \dynamicUp
  g2\m d'8 e\me | d8\m f4^"*" e8 d4\me | g2\m f4 | e d g | f2
}



\score {
  \new ChoirStaff <<
    \new Staff \with {
      midiInstrument = "choir aahs"
    } <<
      \clef "treble_8"
      \new Voice = "tenor1" { \voiceOne \tenorOne }
      \new Voice = "tenor2" { \voiceTwo \tenorTwo }
    >>
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "tenor1" \verse
    \new Staff \with {
      midiInstrument = "choir aahs"
    } {
      \clef bass
      \new Voice = "bass" \bass
    }
  >>
  \layout { }
  \midi {
    \tempo 4=100
  }
}