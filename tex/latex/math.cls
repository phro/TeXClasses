\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{math}[2017/10/05 Author: Jesse Frohlich; Custom Style for math
documents]

% TODO: Clean up this mess of a premable.
  % todo: go through each package and probe its necessity
  % todo: reorganize macros into logical groups
  % todo: reorganize macros into *semantic* and *shorthand*
  % todo: remove unused or unhelpful macros
  % todo: simplify code for resized parenthetical statements
  % todo: learn how to pass options to the article class
  % todo: expand functionality for the ellipsoidal list command

%\LoadClass[10pt,a4paper]{article}
\LoadClass[11pt]{scrartcl} % Is this what you want? Maybe...

\RequirePackage[utf8]{inputenc}

\RequirePackage{halloweenmath}

\RequirePackage{xparse}              % The way of the future
\RequirePackage{booktabs}            % For \cmidrule
\RequirePackage{microtype}           % Make things better.
\RequirePackage{fancyhdr}
%\RequirePackage{titling}

\RequirePackage{mathtools}           %  norm/absolute value/cardinality
% includes amsmath
\RequirePackage{amssymb}
\RequirePackage{mathrsfs}            % Pretty calligraphy
\RequirePackage{amsthm}
%\RequirePackage{hyperref}
\RequirePackage{varioref}
\RequirePackage{wrapfig}

\RequirePackage[noabbrev]{cleveref}
%\crefdefaultlabelformat{(#2#1#3)}
\crefformat{enumi}{(#2#1#3)}
\crefrangeformat{enumi}{(#3#1#4) to~(#5#2#6)}
\crefmultiformat{enumi}{(#2#1#3)}%
{,~(#2#1#3)}{,~(#2#1#3)}{,~(#2#1#3)}
\ProvideDocumentCommand{\pfimplies}{m m}
{$\text{\cref{#1}}\Rightarrow\text{\cref{#2}}$} % Use for TFAE's

\RequirePackage[normalem]{ulem}
\RequirePackage{csquotes}            % smart quotes
%\RequirePackage{enumerate}           % Custom enumeration themes
\RequirePackage[shortlabels]{enumitem}           % Custom enumeration themes
\RequirePackage{multicol}
\RequirePackage{textgreek}           % "sigma-algebra"
\RequirePackage{tikz-cd}             % Commutative diagrams
\RequirePackage{bbm}                 % Blackboard bold 1
\RequirePackage{bm}                  % Blackboard bold 1

% Make matrices squish better?
%\RequirePackage[nodisplayskipstretch]{setspace}
%\everydisplay\expandafter{\the\everydisplay\setstretch{1}}% return to singlespacing

%\RequirePackage{mdframed}           % Framed environments
\RequirePackage{tcolorbox}           % Framed environments
\tcbuselibrary{breakable}
%\RequirePackage{txfonts}            % We want the \nll symbol

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
\newtheorem{subcase}{Case}[caseCounter]
\renewcommand{\thesubcase}{\alph{subcase}}
%\numberwithin{subcase}{caseCounter}
\newtheorem*{claim*}{Claim} % For the middle of proofs.
% Reset case counters at the beginning of proofs.
%\usepackage{etoolbox}
\AtBeginEnvironment{proof}{\setcounter{caseCounter}{0}}

\theoremstyle{definition}
\newtheorem{defn}[thm]{Definition}
\newtheorem{eg}[thm]{Example}
\newtheorem{ex}[thm]{Exercise}
\newtheorem*{solution}{Solution}
\newtheorem{prob}[thm]{Problem}
\newtheorem*{prob*}{Problem}
\newtheorem{rem}[thm]{Remark}
\newtheorem*{rem*}{Remark}
%\newtheorem{q}[questionCounter]{Exercise}

\ProvideDocumentCommand{\defi}{m}{\emph{#1}} % the Item being DEFined 

\newenvironment{sol}
  {\begin{tcolorbox}[breakable]\begin{solution}}
  {\end{solution}\end{tcolorbox}}

\ProvideDocumentCommand{\salg}{}{\textsigma-algebra}
\ProvideDocumentCommand{\sfin}{}{\textsigma-finite}

\ProvideDocumentCommand{\Ct}{O{\infty}}{C^#1}
\ProvideDocumentCommand{\Cc}{O{\infty}}{C^#1_{\text c}}

%\ProvideDocumentCommand{\alev}{}{a.e.\ }
%\newcommand{\salg}{$\sigma$-algebra}

\ProvideDocumentCommand{\mcl}{m}{\mathcal{#1}}
\ProvideDocumentCommand{\mbb}{m}{\mathbb{#1}}
\ProvideDocumentCommand{\msc}{m}{\mathscr{#1}}
\ProvideDocumentCommand{\mfk}{m}{\mathfrak{#1}}
\ProvideDocumentCommand{\mit}{m}{\mathit{#1}}

% Standard number fields.
\ProvideDocumentCommand{\N  }{}{\mbb{N}} % Natural
\ProvideDocumentCommand{\Z  }{}{\mbb{Z}} % Integer
\ProvideDocumentCommand{\Q  }{}{\mbb{Q}} % Rational
\ProvideDocumentCommand{\R  }{}{\mbb{R}} % Real
\ProvideDocumentCommand{\C  }{}{\mbb{C}} % Complex
\ProvideDocumentCommand{\F  }{}{\mbb{F}} % Finite
\ProvideDocumentCommand{\K  }{}{\mbb{K}} % Generic
\ProvideDocumentCommand{\HH }{}{\mbb{H}} % Upper-half plane/Quaternion
\ProvideDocumentCommand{\del}{}{\partial}
\ProvideDocumentCommand{\lap}{}{\Delta} % Laplacian



\newcommand{\1}{\mathbbm1}
\newcommand{\I}{\mfk i} % Imaginary constant
%\newcommand{\I}{i} % Imaginary constant

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

% The following is a bad idea.
%\let\oldexp\exp
%\RenewDocumentCommand{\exp}{s m}{
  %\IfBooleanTF{#1}
    %{e^}
    %{\oldexp}
  %}

\DeclareMathOperator{\End}{End}
\DeclareMathOperator{\Aut}{Aut}


% Categories
\ProvideDocumentCommand{\catname}{m}{\mathbf{#1}}
\DeclareMathOperator{\mfld}{\catname{Mfld}}
\DeclareMathOperator{\mfldb}{\catname{Mfld}\pmb\del}
\DeclareMathOperator{\vect}{\catname{Vect}}
\DeclareMathOperator{\Mod}{\catname{Mod}}

\ProvideDocumentCommand{\cN}{}{\mathcal{N}}

\newcommand{\fg}{\mathfrak{g}}
\newcommand{\fh}{\mathfrak{h}}
\newcommand{\fn}{\mathfrak{n}}
\newcommand{\fb}{\mathfrak{b}}
\newcommand{\ghi}{\varphi}
%\newcommand{\A}{\mathcal A}

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

%\RequirePackage{Halloweenmath}
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
\ProvideDocumentCommand{\IIInt} {O{} O{}}{\Operator\iiint    [#1][#2]}
\ProvideDocumentCommand{\Wedge} {O{} O{}}{\Operator\bigwedge [#1][#2]}
%\renewcommand<\rightghost

%\ProvideDocumentCommand{\gt}{}{>}

\ProvideDocumentCommand{\mute}{m}{}

\newcommand{\ocomp}[1]{#1^\perp}
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

\newcommand\LambdaFunction[2][0]{%
\let\tmp\relax
\newcommand\tmp[#1]{#2}\tmp}

% Single-argument version
%\newcommand\LambdaFunction[2][0]{%
%\let\tmp\relax
%\newcommand\tmp[#1]{#2}\tmp}

% Ellipsis list
% Arguments are: term, first value, optional last value, operator, ellipsis type
\ProvideDocumentCommand{\elist}{m m o D,,{,} D..{\dots}}{
 \IfNoValueTF {#3}
  {\LambdaFunction[1]{#1}{#2}#4#5}
  {\LambdaFunction[1]{#1}{#2}#4#5#4\LambdaFunction[1]{#1}{#3}} }

%\ProvideDocumentCommand{\elist}{m m o O{,} O{\dots}}{
 %\IfNoValueTF {#3}
  %{\LambdaFunction[1]{#1}{#2}#4#5}
  %{\LambdaFunction[1]{#1}{#2}#4#5#4\LambdaFunction[1]{#1}{#3}} }

%\ProvideDocumentCommand{\seq}{m O{1}}{\LambdaFunction{#1}}

\DeclareMathOperator{\blo}{\msc{L}}
\DeclareMathOperator{\residue}{res} % residue
\DeclareMathOperator{\Arg}{Arg} % Principle part of argument function

\ProvideDocumentCommand{\sethom}{m m}{\mathscr{F}\pn{#1,#2}}
\ProvideDocumentCommand{\Hom}{O{} m m}
  {\hom_{#1}\pn{#2,#3}} % Don't use this.

\ProvideDocumentCommand{\ob}{O{} m}{\operatorname{Ob}\pn #1{#2}}
% I want the optional argument to correspond to the sizing option as defined in
% \pn. But this doesn't work. I kind of hate TeX.


%\ProvideDocumentCommand{\CHom}{m} % Category
  %{\operatorname{Hom}\pn{#1}}

\ProvideDocumentCommand{\ev}{m}{\operatorname{ev}_{#1}}

\ProvideDocumentCommand{\power}{m}{\mathcal{P}\pn{#1}}
\ProvideDocumentCommand{\hat}{m}{\widehat{#1}}

% The radical ideal.
\ProvideDocumentCommand{\rad}{m}{\sqrt #1}
%\ProvideDocumentCommand{\radical}{m}{\OperatorName rad{#1}}

\DeclareMathOperator{\order}{ord}

%\newcommand{\mono}{\rightarrowtail} % monomorphism
\newcommand{\mono}{\hookrightarrow} % monomorphism
\newcommand{\inc }{\hookrightarrow} % inclusion % DEPRECATE?
\newcommand{\inj }{\hookrightarrow} % injection
\newcommand{\emb }{\hookrightarrow} % embedding
\newcommand{\sur }{\twoheadrightarrow} % epimorphism
\newcommand{\epi }{\twoheadrightarrow} % epimorphism

% todo: implement \rsub and \dsub as "maps under the function to"
% e.g. $y = f(x) \iff x f \rsub y$

% Add the restriction notation here.
% Arguments are size, restriction, then a signed restriction argument.
% This is awful, and the spacing changes from the auto-sizing case to the
% manual case.
\ProvideDocumentCommand{\res}{s tb tB tg tG o o m}
{ \IfBooleanTF {#1} % Starred version; no sizing
  { \IfNoValueTF {#6}
    {{#8}|}
    { \IfNoValueTF {#7}
      {{#8}|_{#6}}
      {{#8}|_{#6}^{#7}}
    }
  }
  {\IfBooleanTF {#2} % Make big
    { \IfNoValueTF {#6}
      {{#8}\bigr|}
      { \IfNoValueTF {#7}
        {{#8}\bigr|_{#6}}
        {{#8}\bigr|_{#6}^{#7}}
      }
    }
    {\IfBooleanTF {#3} % Make Big
      { \IfNoValueTF {#6}
        {{#8}\Bigr|}
        { \IfNoValueTF {#7}
          {{#8}\Bigr|_{#6}}
          {{#8}\Bigr|_{#6}^{#7}}
        }
      }
      {\IfBooleanTF {#4} % Make bigg
        { \IfNoValueTF {#6}
          {{#8}\biggr|}
          { \IfNoValueTF {#7}
            {{#8}\biggr|_{#6}}
            {{#8}\biggr|_{#6}^{#7}}
          }
        }
        {\IfBooleanTF {#5} % Make Bigg
        { \IfNoValueTF {#6}
          {{#8}\Biggr|}
          { \IfNoValueTF {#7}
            {{#8}\Biggr|_{#6}}
            {{#8}\Biggr|_{#6}^{#7}}
          }
        }
          % Auto-size
          { \IfNoValueTF {#6}
            {\left.{#8}\right|}
            { \IfNoValueTF {#7}
              {\left.{#8}\right|_{#6}}
              {\left.{#8}\right|_{#6}^{#7}}
            }
          }
        }
      }
    }
  }
}

% Signed restriction
\ProvideDocumentCommand{\sres}{tb m m}{
  \IfBooleanTF {#1}
  { \IfNoValueTF {#2}
    {{#3}\bigr|}
    {{#3}\bigr|_{#2}}
  }
  { \IfNoValueTF {#2}
    {\left.{#3}\right|}
    {\left.{#3}\right|_{#2}}
  }
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
%\ProvideDocumentCommand{\dual}{m}{{#1}^\vee}
\ProvideDocumentCommand{\dual}{m}{{#1}^*}
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

\ProvideDocumentCommand{\sym}{m}{S_#1} % Symmetric group
%\ProvideDocumentCommand{\sym}{O{} m}{\Sym\pn #1{#2}} % Symmetric group

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
\newcommand{\hty}{\cong} % or \cong

\DeclareMathOperator{\pr}{pr} % projection
\DeclareMathOperator{\im}{im} % Image

\DeclareMathOperator{\upto}{\nearrow} % conv. monotonically to (upwards)
\DeclareMathOperator{\downto}{\searrow} % conv. monotonically to (down)

% Turn this command into another option for \frac (by renewcommand).
\newcommand{\fracl}[2]{\left.{#1}\middle/{#2}\right.}
\newcommand{\e}{\varepsilon}
%\newcommand{\inner}[2]{\left \langle #1, #2 \right \rangle}
%\newcommand{\se}[1]{\left \{ #1 \right \}}
%\newcommand{\pn}[1]{\mathopen{}\left ( #1 \right )}
%\newcommand{\bk}[1]{\left[ #1 \right]}
\ProvideDocumentCommand{\bk}{s tb tB tg tG m}{
  \IfBooleanTF {#1} % Starred version; no sizing
    {[#6]}
    {\IfBooleanTF {#2} % Make big
      {\bigl[#6\bigr]}
      {\IfBooleanTF {#3} % Make Big
        {\Bigl[#6\Bigr]}
        {\IfBooleanTF {#4} % Make bigg
          {\biggl[#6\biggr]}
          {\IfBooleanTF {#5} % Make Bigg
            {\Biggl[#6\Biggr]}
            {\left[#6\right]} % Auto-size
          }
        }
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
\newcommand{\card}{\#}
%\ProvideDocumentCommand{\card}{s tb tB tg tG m}{
  %\IfBooleanTF {#1} % Starred version; no sizing
    %{\lvert#6\rvert}
    %{\IfBooleanTF {#2} % Make big
      %{\bigl\lvert#6\bigr\rvert}
      %{\IfBooleanTF {#3} % Make Big
        %{\Bigl\lvert#6\Bigr\rvert}
        %{\IfBooleanTF {#4} % Make bigg
          %{\biggl\lvert#6\biggr\rvert}
          %{\IfBooleanTF {#5} % Make Bigg
            %{\Biggl\lvert#6\Biggr\rvert}
            %{\left\lvert#6\right\rvert} % Auto-size
          %}
        %}
      %}
    %}
%}

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

\ProvideDocumentCommand{\inner}{s tb tB tg tG m m}{% Inner product
\IfBooleanTF {#1} % Starred version; no sizing
  %{(#6, #7)}
  %{(#6\mid #7)}
  %{\langle#6\mid #7\rangle}
  {\langle#6, #7\rangle}
  {\IfBooleanTF {#2} % Make big
    %{\bigl(#6,#7\bigr)}
    %{\bigl(#6\bigm|#7\bigr)}
    %{\bigl\langle#6\bigm|#7\bigr\rangle}
    {\bigl\langle#6, #7\bigr\rangle}
    {\IfBooleanTF {#3} % Make Big
      %{\Bigl(#6,#7\Bigr)}
      %{\Bigl(#6\Bigm|#7\Bigr)}
      %{\Bigl\langle#6\Bigm|#7\Bigr\rangle}
      {\Bigl\langle#6,#7\Bigr\rangle}
      {\IfBooleanTF {#4} % Make bigg
        %{\biggl(#6,#7\biggr)}
        %{\biggl(#6\biggm|#7\biggr)}
        %{\biggl\langle#6\biggm|#7\biggr\rangle}
        {\biggl\langle#6,#7\biggr\rangle}
        {\IfBooleanTF {#5} % Make Bigg
          %{\Biggl(#6,#7\Biggr)}
          %{\Biggl(#6\Biggm|#7\Biggr)}
          %{\Biggl\langle#6\Biggm|#7\Biggr\rangle}
          {\Biggl\langle#6,#7\Biggr\rangle}
          %{\left(#6,#7\right)} % Auto-size
          %{\left(#6\;\middle|\;#7\right)} % Auto-size
          %{\left\langle#6\;\middle|\;#7\right\rangle} % Auto-size
          {\left\langle#6,#7\right\rangle} % Auto-size
        }
      }
    }
  }
}

\ProvideDocumentCommand{\setb}{s tb tB tg tG m m}{% Setbuilder
\IfBooleanTF {#1} % Starred version; no sizing
  %{\{#6\mid #7\}}
  {\{\,#6:#7\,\}}
  {\IfBooleanTF {#2} % Make big
    %{\bigl\{#6\bigm|#7\bigr\}}
    {\bigl\{\,#6:#7\,\bigr\}}
    {\IfBooleanTF {#3} % Make Big
      %{\Bigl\{#6\Bigm|#7\Bigr\}}
      {\Bigl\{\,#6:#7\,\Bigr\}}
      {\IfBooleanTF {#4} % Make bigg
        %{\biggl\{#6\biggm|#7\biggr\}}
        {\biggl\{\,#6:#7\,\biggr\}}
        {\IfBooleanTF {#5} % Make Bigg
          %{\Biggl\{#6\Biggm|#7\Biggr\}}
          {\Biggl\{\,#6:#7\,\Biggr\}}
          %{\left\{#6\;\middle|\;#7\right\}} % Auto-size
          {\left\{\,#6:#7\,\right\}} % Auto-size
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

\ProvideDocumentCommand{\ms}{}{\perp} % Mutually singular
\ProvideDocumentCommand{\abcts}{}{\ll} % Absolutely continuous

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
%\ProvideDocumentCommand{\ppd}{}{\frac { \partial^{#1}{#2} } {#3} }

\ProvideDocumentCommand{\cent}{}{Z}      % centre
%\ProvideDocumentCommand{\cent}{}{\zeta} % centre

\ProvideDocumentCommand{\tounif}{}{\rightrightarrows}
\ProvideDocumentCommand{\Gr}{m m}{\operatorname{Gr}\pn{#1,#2}}
\DeclareMathOperator{\dom}{dom}   % Domain
\DeclareMathOperator{\cod}{cod}   % Codomain
\DeclareMathOperator{\rank}{rk}   % rank
\DeclareMathOperator{\tr}{tr}     % trace
\DeclareMathOperator{\Lie}{Lie}   % Lie algebra
\DeclareMathOperator{\Gal}{Gal}   % Galois group
\DeclareMathOperator{\Spec}{Spec} % Spectrum
\DeclareMathOperator*{\esssup}{ess\,sup} % essential supremum
\DeclareMathOperator*{\supp}{supp} % support

\newcommand{\cpt}[1]{\overline{#1}} % completion of a space/object

\newcommand{\TVS}{topological vector space}
\newcommand{\NVS}{normed vector space}

% Basic R^N topology

% CLosure of a set or equivalence CLass! :O (bad)
\newcommand{\cl}[1]{\overline{#1}}
\newcommand{\itr}[1]{{#1}^\circ} % Interior of a set
\newcommand{\ball}[2]{B_{#1}\left (#2 \right )} % Denotes an open ball centered at #1 with radius #2
\newcommand{\cball}[2]{\cl{B}_{#1}\left(#2 \right)} % The closed ball
%\newcommand{\pball}[2]{\dot{B}_{#1}\left(#2 \right )} % The punctured ball

\endinput
% ex: filetype=tex
