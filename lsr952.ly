%% http://lsr.di.unimi.it/LSR/Item?id=952
% added by P.P.Schneider on Sept.2014.
% revised by Harm
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LSR workaround:
% #(set! paper-alist (cons '("snippet" . (cons (* 70 mm) (* 140 mm))) paper-alist))
% \paper {
%   #(set-paper-size "snippet")
%   tagline = ##f
% }
% \markup\vspace #.5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Prefix = \markup {
  %% uncomment/comment these lines for C, C slashed, B or B slashed prefix :
  % \roman C
  %\combine \roman C \translate #'(0.65 . -0.25) \override #'(thickness . 1.2) \draw-line #'(0 . 1.8)
  \roman B
  %\combine \roman B \translate #'(0.65 . -0.25) \override #'(thickness . 1.2) \draw-line #'(0 . 1.8)
  %%%%%%%%%%%%
  \hspace #0.2
}

#(define-markup-command (prefix layout props string-qty) (integer?)
  (interpret-markup layout props
    (if (member string-qty (iota 4 2 1))
        #{
           \markup {
             \override #'(font-family . typewriter)
             \concat {
               \fontsize #-4 {
                   \raise #.5 #(number->string string-qty)
                   \hspace #-.2
                   \raise #.2 "/"
                   \hspace #-.2
                   "6"
                 }
               \Prefix
             }
           }
        #}
        #{ \markup\Prefix #})))

startBarre =
#(define-event-function (parser location arg-string-qty str)
  ((integer?) markup?)
  (let* ((pre-fix
           (if arg-string-qty #{ \markup \prefix #arg-string-qty #} Prefix))
         (mrkp (markup #:upright #:concat (pre-fix str #:hspace 0.3))))

    (define (width grob text-string)
      (let* ((layout (ly:grob-layout grob))
             (props (ly:grob-alist-chain
                       grob
                       (ly:output-def-lookup layout 'text-font-defaults))))
      (interval-length
        (ly:stencil-extent
          (interpret-markup layout props (markup text-string))
          X))))
    #{
      \tweak after-line-breaking
        #(lambda (grob)
          (let* ((mrkp-width (width grob mrkp))
                 (line-thickness (ly:staff-symbol-line-thickness grob)))
           (ly:grob-set-nested-property!
             grob
             '(bound-details left padding)
             (+ (/ mrkp-width -4) (* line-thickness 2)))))
      \tweak font-size -2
      \tweak style #'line
      \tweak bound-details.left.text #mrkp
      \tweak bound-details.left.attach-dir -1
      \tweak bound-details.left-broken.text ##f
      \tweak bound-details.left-broken.attach-dir -1
      %% adjust the numeric values to fit your needs:
      \tweak bound-details.left-broken.padding 1.5
      \tweak bound-details.right-broken.padding 0
      \tweak bound-details.right.padding 0.25
      \tweak bound-details.right.attach-dir 2
      \tweak bound-details.right-broken.text ##f
      \tweak bound-details.right.text
        \markup
          \with-dimensions #'(0 . 0) #'(-.3 . 0)
          \draw-line #'(0 . -1)
      \startTextSpan
    #}))

#(define startHalfBarre startBarre)

startModernBarre =
#(define-event-function (parser location fretnum partial)
   (number? number?)
    #{
      \tweak bound-details.left.text
        \markup
          \small \bold \concat {
          %\Prefix
          #(format #f "~@r" fretnum)
          \hspace #.2
          \lower #.3 \fontsize #-2 #(number->string partial)
          \hspace #.5
        }
      \tweak font-size -1
      \tweak font-shape #'upright
      \tweak style #'dashed-line
      \tweak dash-fraction #0.3
      \tweak dash-period #1
      \tweak bound-details.left.stencil-align-dir-y #0.35
      \tweak bound-details.left.padding 0.25
      \tweak bound-details.left.attach-dir -1
      \tweak bound-details.left-broken.text ##f
      \tweak bound-details.left-broken.attach-dir -1
      %% adjust the numeric values to fit your needs:
      \tweak bound-details.left-broken.padding 1.5
      \tweak bound-details.right-broken.padding 0
      \tweak bound-details.right.padding 0.25
      \tweak bound-details.right.attach-dir 2
      \tweak bound-details.right-broken.text ##f
      \tweak bound-details.right.text
        \markup
          \with-dimensions #'(0 . 0) #'(-.3 . 0)
          \draw-line #'(0 . -1)
      \startTextSpan
   #})

stopBarre = \stopTextSpan

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% EXAMPLES
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %%%%%%%%%%%%%%%%% Standard Barré function

% %% Syntax: note \startBarre "text"  notes \stopBarre (text = any fret number)

% \markup \column \italic { "Standard notation:" \vspace #.5 }

% {
%   \clef "G_8"
%   \key d\minor
%   <<
%     \new Voice {
%       \voiceOne a'16[ \startBarre "III"  bes d' bes f'8] \stopBarre
%     }
%     \new Voice { \voiceTwo d2 }
%   >>
% }

% %%%%%%%%%%%%%%%%% Half Barré function with prefix

% %% Syntax: note \startHalfBarre #'string quantity' "text"  notes \stopBarre (text = any fret number)

% \markup
%   \column \italic { \vspace #1 "With string position prefix:" \vspace #.5 }

% {
%   \clef "G_8"
%   \key d\minor
%   <<
%     \new Voice {
%       \voiceOne a'16[ \startHalfBarre #3 "III" bes d' bes f'8] \stopBarre
%     }
%     \new Voice { \voiceTwo d2 }
%   >>
% }

% %%%%%%%%%%%%%%%%% Modern Barré function

% %% Syntax: note \startModernBarre fret-number string-number notes \stopBarre

% \markup \column \italic { \vspace #1 "A more modern approach:" \vspace #.5 }
% {
%   \clef "G_8"
%   \key d\minor
%   <<
%     \new Voice {
%       \voiceOne a'16[ \startModernBarre #3 #3 bes d' bes f'8] \stopBarre
%     }
%     \new Voice { \voiceTwo d2 }
%   >>
% }

% % LSR workaround:
% \markup\vspace #.5
