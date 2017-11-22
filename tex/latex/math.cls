\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{math}[2017/10/05 Author: Jesse Frohlich; Custom Style for math documents]

%\LoadClass[10pt,a4paper]{article}
\LoadClass[11pt,letterpaper]{article} % Is this what you want? Maybe...

\RequirePackage[utf8]{inputenc}

\RequirePackage{xparse}              % The way of the future
\RequirePackage{booktabs}            % For \cmidrule
\RequirePackage{microtype}           % Make things better.

\RequirePackage{mathtools}           %  norm/absolute value/cardinality
% includes amsmath
\RequirePackage{amssymb}
\RequirePackage{mathrsfs}            % Pretty calligraphy
\RequirePackage{amsthm}
%\RequirePackage{hyperref}
\RequirePackage{varioref}
\RequirePackage[noabbrev]{cleveref}
\RequirePackage[normalem]{ulem}
\RequirePackage{csquotes}            % smart quotes
\RequirePackage{enumerate}           % Custom enumeration themes
\RequirePackage{multicol}
\RequirePackage{textgreek}           % "sigma-algebra"
\RequirePackage{tikz-cd}             % Commutative diagrams
\RequirePackage{bbm}                 % Blackboard bold 1
\RequirePackage{bm}                  % Blackboard bold 1
%\RequirePackage{txfonts}             % We want the \nll symbol

% Use this form with latex or pdflatex to include inline LaTeX code by default:
\usepackage[inline]{asymptote}

%\DeclareOption{noabbrev}{\PassOptionsToClass{\CurrentOption}{cleveref}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax


%\DeclarePairedDelimiter\abs{\lvert}{\rvert}
\DeclarePairedDelimiter\ord{\lvert}{\rvert}
%\DeclarePairedDelimiter\norm{\lVert}{\rVert}

% Swap the definition of \abs* and \norm*, so that \abs
% and \norm resizes the size of the brackets, and the
% starred version does not.
%\let\oldabs\abs
%\def\abs{\@ifstar{\oldabs}{\oldabs*}}
\let\oldord\ord
\def\ord{\@ifstar{\oldord}{\oldord*}}
%\let\oldnorm\norm
%\def\norm{\@ifstar{\oldnorm}{\oldnorm*}}

% Remove the undesired spaces introduced when \left and \right are used.
\let\originalleft\left
\let\originalright\right
\renewcommand{\left}{\mathopen{}\mathclose\bgroup\originalleft}
\renewcommand{\right}{\aftergroup\egroup\originalright}

\delimitershortfall-1sp % Allow automatic growth of delimiters


% Reset the case counter during new questions
\newcounter{questionCounter}

% \newtheorem {refrence name}
%             [counter name (default ref. name)]
%             {display name}
%             [numberby section]
% Everything should be numbered. It makes referring by others much
% easier.
\newtheorem{thm}{Theorem}
\newtheorem{lem}[thm]{Lemma}
\newtheorem{conj}[thm]{Conjecture}
\newtheorem{claim}[thm]{Claim}
\newtheorem{fact}[thm]{Fact}
\newtheorem{facts}[thm]{Facts}
\newtheorem{prop}[thm]{Proposition}
\newtheorem{cor}[thm]{Corollary}
\newtheorem{qn}[thm]{Question}
% Don't do this. There are enough numbers out there you don't need to use
% subnumbering. -- Eric Woolgar
%     |  |  |  |  |  |
%     V  V  V  V  V  V
%\newtheorem{cor}{Corollary}[thm]

\theoremstyle{remark}
\newcounter{caseCounter}[thm] % Reset cases with each claim
\newtheorem{case}[caseCounter]{Case}
\newtheorem*{claim*}{Claim} % For the middle of proofs.
% Reset case counters at the beginning of proofs.
%\usepackage{etoolbox}
\AtBeginEnvironment{proof}{\setcounter{caseCounter}{0}}

\theoremstyle{definition}
\newtheorem{defn}[thm]{Definition}
\newtheorem{eg}[thm]{Example}
\newtheorem{ex}[thm]{Exercise}
\newtheorem{prob}[thm]{Problem}
\newtheorem*{prob*}{Problem}
\newtheorem{rem}[thm]{Remark}
%\newtheorem{q}[questionCounter]{Exercise}

\ProvideDocumentCommand{\salg}{}{\textsigma-algebra}
\ProvideDocumentCommand{\sfin}{}{\textsigma-finite}

%\ProvideDocumentCommand{\alev}{}{a.e.\ }
%\newcommand{\salg}{$\sigma$-algebra}

% Standard number fields.
\ProvideDocumentCommand{\N  }{}{\mathbb{N}} % Natural
\ProvideDocumentCommand{\Z  }{}{\mathbb{Z}} % Integer
\ProvideDocumentCommand{\Q  }{}{\mathbb{Q}} % Rational
\ProvideDocumentCommand{\R  }{}{\mathbb{R}} % Real
\ProvideDocumentCommand{\C  }{}{\mathbb{C}} % Complex
\ProvideDocumentCommand{\K  }{}{\mathbb{K}} % Generic
\ProvideDocumentCommand{\HH }{}{\mathbb{H}} % Upper-half plane/Quaternion
\ProvideDocumentCommand{\del}{}{\partial}

\ProvideDocumentCommand{\mcl}{m}{\mathcal{#1}}
\ProvideDocumentCommand{\mbb}{m}{\mathbb{#1}}
\ProvideDocumentCommand{\msc}{m}{\mathscr{#1}}
\ProvideDocumentCommand{\mfk}{m}{\mathfrak{#1}}

\newcommand{\1}{\mathbbm1}
\newcommand{\I}{\mfk i}

% Classic Groups
\DeclareMathOperator{\GL}{GL}
\DeclareMathOperator{\Gl}{\mathfrak{gl}}
\DeclareMathOperator{\SL}{SL}
\DeclareMathOperator{\Sl}{\mathfrak{sl}}
\DeclareMathOperator{\SO}{SO}
\DeclareMathOperator{\U}{U}
\DeclareMathOperator{\SU}{SU}
\DeclareMathOperator{\Or}{O}
\DeclareMathOperator{\So}{\mathfrak{so}}

\DeclareMathOperator{\spn}{span}

\DeclareMathOperator{\End}{End}
\DeclareMathOperator{\Aut}{Aut}

\DeclareMathOperator{\F}{\mathbb{F}}

\DeclareMathOperator{\mfld}{\mathbf{Mfld}}
\DeclareMathOperator{\mfldb}{\mathbf{Mfld}\pmb\del}

\ProvideDocumentCommand{\cN}{}{\mathcal{N}}

\newcommand{\fg}{\mathfrak{g}}
\newcommand{\fh}{\mathfrak{h}}
\newcommand{\fn}{\mathfrak{n}}
\newcommand{\fb}{\mathfrak{b}}
\newcommand{\ghi}{\varphi}
\newcommand{\A}{\mathcal A}

\newcommand*{\diffdchar}{d}
% or {ⅆ}, or {\mathrm{d}}, or whatever standard you’d like to adhere to
\newcommand*{\dd}{\mathop{\diffdchar\!}}

\newcommand{\Tensor}[3][]{#2 \otimes_{#1} #3}
\newcommand{\Fusion}[3][]{#2 \boxtimes_{#1} #3}

%\let\oldproof\proof
%\let\endoldproof\endproof
%\renewenvironment{proof}[2][1]{%
  %\oldproof[#1]\renewcommand*{\qedsymbol}{#2}%
%}{\endoldproof}

\ProvideDocumentCommand{\Operator}{m o o}{
  \IfValueTF{#2}
    {\IfValueTF{#3}
      {#1_{#2}^{#3}}
      {#1_{#2}}
    }
    {#1}
}

%\usepackage{halloween math}
% There should really be another argument for what the operator is
% acting on, but that's a lot more typing I really don't care to do.
\ProvideDocumentCommand{\Sum}   {O{} O{}}{\Operator\sum      [#1][#2]}
\ProvideDocumentCommand{\Dsum}  {O{} O{}}{\Operator\bigoplus [#1][#2]}
\ProvideDocumentCommand{\Prod}  {O{} O{}}{\Operator\prod     [#1][#2]}
\ProvideDocumentCommand{\Tprod} {O{} O{}}{\Operator\bigotimes[#1][#2]}
\ProvideDocumentCommand{\Coprod}{O{} O{}}{\Operator\coprod   [#1][#2]}
\ProvideDocumentCommand{\Dunion}{O{} O{}}{\Operator\bigsqcup [#1][#2]}
\ProvideDocumentCommand{\Union} {O{} O{}}{\Operator\bigcup   [#1][#2]}
\ProvideDocumentCommand{\Inter} {O{} O{}}{\Operator\bigcap   [#1][#2]}
\ProvideDocumentCommand{\Int}   {O{} O{}}{\Operator\int      [#1][#2]}
\ProvideDocumentCommand{\IInt}  {O{} O{}}{\Operator\iint     [#1][#2]}
%\renewcommand<\rightghost

%\ProvideDocumentCommand{\gt}{}{>}

\ProvideDocumentCommand{\mute}{m}{}

\ProvideDocumentCommand{\comp}{o m}{
  \IfNoValueTF {#1}
  % Eventually have this detect if () or {} were used, and
  {{#2}^{\mathsf c}}
           % parenthesize accordingly.
  {\left.{#1}\middle\backslash{#2}\right.}
}
\ProvideDocumentCommand{\trp}{m}{
  %{{#1}^\top}
  {{#1}^{\mathsf T}}
  %{{#1}^t}
  %{{#1}^\intercal}
}
% TODO: Add union, intersection, coproduct, etc.

\ProvideDocumentCommand{\lt}{}{<}
\ProvideDocumentCommand{\gt}{}{>}
\ProvideDocumentCommand{\eq}{}{=}
\ProvideDocumentCommand{\defeq}{}
  %{
  %\mathrel{\vcenter{\baselineskip0.5ex \lineskiplimit0pt
  %\hbox{\scriptsize.}\hbox{\scriptsize.}}}%
  %=}
  {\coloneqq}
\ProvideDocumentCommand{\eqdef}{}{\eqqcolon}
% Only show parentheses if an argument is given.
\ProvideDocumentCommand{\affine}{m O{} O{}}{\mathbb{A}^{#1}#2{#3}}

\ProvideDocumentCommand{\sethom}{m m}{\mathscr{F}\pn{#1,#2}}
\ProvideDocumentCommand{\Hom}{O{} m m}
  {\hom_{#1}\pn{#2,#3}}

%\ProvideDocumentCommand{\CHom}{m} % Category
  %{\operatorname{Hom}\pn{#1}}

\ProvideDocumentCommand{\ev}{m}{\operatorname{ev}_{#1}}

\ProvideDocumentCommand{\power}{m}{\mathcal{P}\pn{#1}}
\ProvideDocumentCommand{\hat}{m}{\widehat{#1}}

% The radical ideal.
\ProvideDocumentCommand{\rad}{m}{\sqrt #1}
%\ProvideDocumentCommand{\radical}{m}{\OperatorName rad{#1}}

%TODO: define \acts for actions

\newcommand{\mono}{\rightarrowtail} % monomorphism
\newcommand{\inc}{\hookrightarrow} % monomorphism
\newcommand{\epi}{\twoheadrightarrow} % epimorphism
\newcommand{\st}{\middle\vert} % such that. But it doesn't work right.

% Add the restriction notation here.
\ProvideDocumentCommand{\res}{o m}{
  \IfNoValueTF {#1}
  {\left.{#2}\right|}
  {{#2}|_{#1}}
}

% Universal Enveloping Algebra
\newcommand{\uea}[1]{\mathfrak{U}{#1}}
\newcommand{\id}[1][]{\operatorname{id}_{#1}}
\ProvideDocumentCommand{\id}{o}{
  \IfNoValueTF {#1}
    {\operatorname{id}}
    {\operatorname{id}_{#1}}
}
\ProvideDocumentCommand{\inv}{sm}{% Invert something
  \IfBooleanTF{#1}
  {\frac1{#2}}
  {#2^{-1}}
}


% Is this a bad notation to choose?
%\DeclareMathOperator{\PP}{\mathbb{P}}
\ProvideDocumentCommand{\PP}{o m}{
  \IfNoValueTF {#1}
  {\mathbb P^{#2}}
  {\mathbb P^{#2}\pn{#1}} % Version 1
  %{{#1}\mathbb P^{#2}} % Version 2
  %{\mathbb P_{#1}^{#2}} % Version 3
}
%\newcommand{\dual}[1]{{#1}^*}
\ProvideDocumentCommand{\dual}{m}{{#1}^\vee}
\ProvideDocumentCommand{\transverse}{}{\mathbin{\pitchfork}}
\ProvideDocumentCommand{\cc}{m}{\overline{#1}}
%\newcommand{\dual}[1]{{#1}^\vee}
\ProvideDocumentCommand{\symdif}{}{\triangle}

% How does one renew a math operator?
%\DeclareMathOperator{\Re}{Re}
%\DeclareMathOperator{\Im}{Im}

% TODO: Add \iso symbol with only one bar, etc.
%\newcommand{\set}[1]{\left \{ #1 \right \}} % Surround in braces.
% Normal subgroup shortcut. Good and semantic.
% TODO: Normalizer notation
\newcommand{\nsg}{\triangleleft}
% I don't know if this would be used enough to be justified. Yeah, not really.
\newcommand{\G}{\mathcal G}
\newcommand{\cen}[1]{Z\pn{#1}}
% For the index of a group. Is this overkill? NEVER!! Plus, indices
% appear surprisingly often. %
\newcommand{\idx}[2]{\left [ #1 : #2 \right ]}
\DeclareMathOperator{\sgn}{sgn}
\DeclareMathOperator{\Sym}{Sym}
%\DeclareMathOperator{\ord}{ord} % Vertical bars

\newcommand{\under}{\backslash}
\newcommand{\acts}{\circlearrowright} % Action
\newcommand{\stca}{\circlearrowleft} % Action
%\newcommand{\acts}{{}^\curvearrowright} % Action
%\newcommand{\stca}{{}^\curvearrowleft} % Action
\newcommand{\subgrp}{<} % fix

%\newcommand{\iso}{\simeq} % or \cong
\newcommand{\iso}{\cong} % or \cong
\newcommand{\homeo}{\cong} % or \cong

\DeclareMathOperator{\pr}{pr} % projection
\DeclareMathOperator{\im}{im} % Image

\DeclareMathOperator{\upto}{\nearrow} % conv. monotonically to (upwards)
\DeclareMathOperator{\downto}{\searrow} % conv. monotonically to (down)

% Turn this command into another option for \frac (by renewcommand).
\newcommand{\fracl}[2]{\left.{#1}\middle/{#2}\right.}
\newcommand{\e}{\varepsilon}
\newcommand{\inner}[2]{\left \langle #1, #2 \right \rangle}
%\newcommand{\se}[1]{\left \{ #1 \right \}}
%\newcommand{\pn}[1]{\mathopen{}\left ( #1 \right )}
%\newcommand{\bk}[1]{\left[ #1 \right]}
\ProvideDocumentCommand{\bk}{s tB tb m}{
  \IfBooleanTF {#1} % Starred version; no sizing
    {[#4]}
    {\IfBooleanTF {#2} % Make Big
      {\Bigl[#4\Bigr]}
      {\IfBooleanTF {#3} % Make big
        {\bigl[#4\bigr]}
        {\left[#4\right]} % Auto-size
      }
    }
}
\ProvideDocumentCommand{\pn}{s tb tB tg tG m}{
  \IfBooleanTF {#1} % Starred version; no sizing
    {(#6)}
    {\IfBooleanTF {#2} % Make big
      {\bigl(#6\bigr)}
      {\IfBooleanTF {#3} % Make Big
        {\Bigl(#6\Bigr)}
        {\IfBooleanTF {#4} % Make bigg
          {\biggl(#6\biggr)}
          {\IfBooleanTF {#5} % Make Bigg
            {\Biggl(#6\Biggr)}
            {\left(#6\right)} % Auto-size
          }
        }
      }
    }
}
\ProvideDocumentCommand{\norm}{s tb tB tg tG o m}{ % add optional subscript argument
  \IfBooleanTF {#1} % Starred version; no sizing
    {\lVert#7\rVert}
    {\IfBooleanTF {#2} % Make big
      {\bigl\lVert#7\bigr\rVert}
      {\IfBooleanTF {#3} % Make Big
        {\Bigl\lVert#7\Bigr\rVert}
        {\IfBooleanTF {#4} % Make bigg
          {\biggl\lVert#7\biggr\rVert}
          {\IfBooleanTF {#5} % Make Bigg
            {\Biggl\lVert#7\Biggr\rVert}
            {\left\lVert#7\right\rVert} % Auto-size
          }
        }
      }
    }
  \IfNoValueF{#6}{_{#6}}
}
\ProvideDocumentCommand{\abs}{s tb tB tg tG m}{
  \IfBooleanTF {#1} % Starred version; no sizing
    {\lvert#6\rvert}
    {\IfBooleanTF {#2} % Make big
      {\bigl\lvert#6\bigr\rvert}
      {\IfBooleanTF {#3} % Make Big
        {\Bigl\lvert#6\Bigr\rvert}
        {\IfBooleanTF {#4} % Make bigg
          {\biggl\lvert#6\biggr\rvert}
          {\IfBooleanTF {#5} % Make Bigg
            {\Biggl\lvert#6\Biggr\rvert}
            {\left\lvert#6\right\rvert} % Auto-size
          }
        }
      }
    }
}
% Used for generating sets.
\ProvideDocumentCommand{\gen}{s tb tB tg tG m}{
  \IfBooleanTF {#1} % Starred version; no sizing
    {\langle#6\rangle}
    {\IfBooleanTF {#2} % Make big
      {\bigl\langle#6\bigr\rangle}
      {\IfBooleanTF {#3} % Make Big
        {\Bigl\langle#6\Bigr\rangle}
        {\IfBooleanTF {#4} % Make bigg
          {\biggl\langle#6\biggr\rangle}
          {\IfBooleanTF {#5} % Make Bigg
            {\Biggl\langle#6\Biggr\rangle}
            {\left\langle#6\right\rangle} % Auto-size
          }
        }
      }
    }
}
\ProvideDocumentCommand{\set}{s tb tB tg tG m}{
\IfBooleanTF {#1} % Starred version; no sizing
  {\{#6\}}
  {\IfBooleanTF {#2} % Make big
    {\bigl\{#6\bigr\}}
    {\IfBooleanTF {#3} % Make Big
      {\Bigl\{#6\Bigr\}}
      {\IfBooleanTF {#4} % Make bigg
        {\biggl\{#6\biggr\}}
        {\IfBooleanTF {#5} % Make Bigg
          {\Biggl\{#6\Biggr\}}
          {\left\{#6\right\}} % Auto-size
        }
      }
    }
  }
}

\ProvideDocumentCommand{\setb}{s tb tB tg tG m m}{% Setbuilder
\IfBooleanTF {#1} % Starred version; no sizing
  {\{#6\mid #7\}}
  {\IfBooleanTF {#2} % Make big
    {\bigl\{#6\bigm|#7\bigr\}}
    {\IfBooleanTF {#3} % Make Big
      {\Bigl\{#6\Bigm|#7\Bigr\}}
      {\IfBooleanTF {#4} % Make bigg
        {\biggl\{#6\biggm|#7\biggr\}}
        {\IfBooleanTF {#5} % Make Bigg
          {\Biggl\{#6\Biggm|#7\Biggr\}}
          {\left\{#6\;\middle|\;#7\right\}} % Auto-size
        }
      }
    }
  }
}
% Why doesn't this work? Why is TeX so ugly?
%\ProvideDocumentCommand{\pn}{s e{bBgG} m}{
  %\IfValue {#1} {(#6)}
  %\IfValue {#2} {\bigl(#6\bigr)}
  %\IfValue {#3} {\Bigl(#6\Bigr)}
  %\IfValue {#4} {\biggl(#6\biggr)}
  %\IfValue {#5} {\Biggl(#6\Biggr)}
%}

\newcommand{\liebk}[2]{\left[ #1,#2 \right]} % Use \leftm,\rightm?

\ProvideDocumentCommand{\borel}{m}{\mathcal{B}_{#1}}
%\DeclareMathOperator{\Grass}{Gr} % Grasmannian
\ProvideDocumentCommand{\eR}{}{\overline{\R}}

\ProvideDocumentCommand{\npd}{s O{} m}{ % Non-partial derivatives
  \IfBooleanTF#1
  {\fracl{d #2}{d #3}}
  {\frac {d #2}{d #3}}
}
\ProvideDocumentCommand{\pd}{s O{} m}{
  \IfBooleanTF#1
  {\fracl{\partial #2}{\partial #3}}
  {\frac {\partial #2}{\partial #3}}
}
%\ProvideDocumentCommand{\ppd}[3]{\frac { \partial^{#1}{#2} } {#3} }

\ProvideDocumentCommand{\tounif}{}{\rightrightarrows}
\ProvideDocumentCommand{\Gr}{m m}{\operatorname{Gr}\pn{#1,#2}}
\DeclareMathOperator{\dom}{dom}   % Domain
\DeclareMathOperator{\cod}{cod}   % Codomain
\DeclareMathOperator{\rank}{rk}   % rank
\DeclareMathOperator{\tr}{tr}     % trace
\DeclareMathOperator{\Lie}{Lie}   % Lie algebra
\DeclareMathOperator{\Spec}{Spec} % Spectrum
\DeclareMathOperator*{\esssup}{ess\,sup}
\DeclareMathOperator*{\supp}{supp}

\newcommand{\cpt}[1]{\overline{#1}} % completion of a space/object

% Basic R^N topology

% CLosure of a set or equivalence CLass! :O (bad)
\newcommand{\cl}[1]{\overline{#1}}
\newcommand{\itr}[1]{{#1}^\circ} % Interior of a set
\newcommand{\ball}[2]{B_{#1}\left (#2 \right )} % Denotes an open ball centered at #1 with radius #2
\newcommand{\cball}[2]{\cl{B}_{#1}\left(#2 \right)} % The closed ball
%\newcommand{\pball}[2]{\dot{B}_{#1}\left(#2 \right )} % The punctured ball
\newcommand{\card}{\#}

\endinput
% ex: filetype=tex
