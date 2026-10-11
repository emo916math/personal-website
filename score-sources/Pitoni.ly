\version "2.20.0"
\language "english"

\header {
  % Remove default LilyPond tagline
  tagline = ##f
}

TimeKey = { \time 3/4 \key a \minor \partial 4 }
rst = { \oneVoice r4 \voiceOne }

SopMusic = \transpose d d { \relative d' {
 % \oneVoice R1*2 \voiceOne
  gs4 | a a b | c c b | \time 3/2 a2 a a4.( gs8) | \time 3/4 a2. \bar "|."
}}
AltoMusic = \transpose d d { \relative d' {
  e4 | e e g | g g g | e2 f e | e2. 
}}
TenorMusic = \transpose d d { \relative a {
  b4 | c c d | e e d | c2 d b | cs2. 
}}
BassMusic = \transpose d d { \relative d {
  e4 | a a g | c c g | a2 d, e | a,2.
}}
VerseOne = \lyricmode {
  ex -- ul -- tent,
  ex -- ul -- tent in re -- ge su -- o.
}

\score {
  \new ChoirStaff <<
     \new Staff <<
        \clef "treble"
        \new Voice = "Sop" { \voiceOne \TimeKey \SopMusic }
        \new Voice = "Alto" { \voiceTwo \AltoMusic }
     >>
     \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "Sop" { \VerseOne }
     \new Staff <<
        \clef "bass"
        \new Voice = "Tenor" { \voiceOne \TimeKey \TenorMusic }
        \new Voice = "Bass" { \voiceTwo \BassMusic }
     >>
  >>
}

