\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{math}[2016/5/24 Author: Jesse Frohlich; Custom Style for math documents]

\LoadClass[10pt,a4paper]{article}
\RequirePackage[utf8]{inputenc}

\RequirePackage{mathtools} % Used for norm/absolute value/cardinality, includes amsmath
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{varioref}
\RequirePackage{cleveref}

\DeclarePairedDelimiter\abs{\lvert}{\rvert}
\DeclarePairedDelimiter\norm{\lVert}{\rVert}

% Swap the definition of \abs* and \norm*, so that \abs
% and \norm resizes the size of the brackets, and the
% starred version does not.
\let\oldabs\abs
\def\abs{\@ifstar{\oldabs}{\oldabs*}}
\let\oldnorm\norm
\def\norm{\@ifstar{\oldnorm}{\oldnorm*}}

% Remove the undesired spaces introduced when \left and \right are used.
\let\originalleft\left
\let\originalright\right
\renewcommand{\left}{\mathopen{}\mathclose\bgroup\originalleft}
\renewcommand{\right}{\aftergroup\egroup\originalright}

\delimitershortfall-1sp % Allow automatic growth of delimiters


\newcounter{questionCounter}
% Reset the case counter during new questions
\newcounter{caseCounter}[questionCounter]

\newtheorem{thm}{Theorem}
\newtheorem{lem}[thm]{Lemma}
\newtheorem{cor}{Corollary}[thm]

\theoremstyle{remark}
\newtheorem{case}[caseCounter]{Case}
\theoremstyle{definition}
\newtheorem{q}[questionCounter]{Exercise}

% Standard number fields.
\newcommand{\N}{\mathbb{N}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\RN}{\R^N}
\newcommand{\RM}{\R^M}

% Classic Groups
\DeclareMathOperator{\GL}{GL}
\DeclareMathOperator{\Gl}{\mathfrak{gl}}
\DeclareMathOperator{\SL}{SL}
\DeclareMathOperator{\Sl}{\mathfrak{sl}}
\DeclareMathOperator{\SO}{SO}
\DeclareMathOperator{\So}{\mathfrak{so}}

\newcommand{\gen}[1]{\left \langle #1\right \rangle} % Used for generating sets.
\newcommand{\set}[1]{\left \{ #1 \right \}} % Surround in braces.
\newcommand{\inv}[1]{#1^{-1}} % Invert something
\newcommand{\nsg}{\triangleleft} % Normal subgroup shortcut
\newcommand{\G}{\mathcal G} % I don't know if this would be used enough to be justified.
\newcommand{\idx}[2]{\left [ #1 : #2 \right ]} % For the index of a group. Is this overkill?
\DeclareMathOperator{\sgn}{sgn}
\DeclareMathOperator{\ord}{ord}

\newcommand{\e}{\varepsilon}
\newcommand{\inner}[2]{\left \langle #1, #2 \right \rangle}
\newcommand{\se}[1]{\left \{ #1 \right \}}
\newcommand{\pn}[1]{\left ( #1 \right )}
\newcommand{\bk}[1]{\left [ #1 \right ]}

\newcommand{\pd}[2]{\frac {\partial #1} {\partial #2}}
\newcommand{\ppd}[3]{\frac { \partial^{#1}{#2} } {#3} }

\DeclareMathOperator{\dom}{dom} % Domain

% Basic R^N topology
\newcommand{\cl}[1]{\overline{#1}} % Used to denote the closure of a set
\newcommand{\ball}[2]{B_{#1}\left (#2 \right )} % Denotes an open ball centered at #1 with radius #2
\newcommand{\cball}[2]{\cl{B}_{#1}\left(#2 \right )} % The closed ball
%\newcommand{\pball}[2]{\dot{B}_{#1}\left(#2 \right )} % The punctured ball

\endinput
% ex: filetype=tex
