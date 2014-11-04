\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{analysis}[2014/11/01 Author: Jesse Frohlich; Custom Style for Math 217 Calculus Assignments]

\LoadClass[10pt,a4paper,answers]{exam}
%\unframedsolutions
\RequirePackage[utf8]{inputenc}

\RequirePackage{mathtools} % Used for norm/absolute value/cardinality, includes amsmath
\RequirePackage{amssymb}
\RequirePackage{amsthm}
%\RequirePackage{nath}

\DeclarePairedDelimiter\abs{\lvert}{\rvert}
\DeclarePairedDelimiter\norm{\lVert}{\rVert}

 %Swap the definition of \abs* and \norm*, so that \abs
 %and \norm resizes the size of the brackets, and the
 %starred version does not.
\let\oldabs\abs
\def\abs{\@ifstar{\oldabs}{\oldabs*}}
\let\oldnorm\norm
\def\norm{\@ifstar{\oldnorm}{\oldnorm*}}

\delimitershortfall-1sp % Allow automatic growth of delimiters

\newcounter{questionCounter}
\newcounter{caseCounter}[questionCounter] %The second argument causes first counter to be reset upon the incrementation of the second

\newtheorem{lem}{Lemma}
\theoremstyle{remark}
\newtheorem{case}[caseCounter]{Case}
\theoremstyle{definition}
\newtheorem{q}[questionCounter]{Exercise}

% Standard vector spaces / number fields.
\newcommand{\N}{\mathbb{N}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\RN}{\R^N}
\newcommand{\RM}{\R^M}

\newcommand{\e}{\varepsilon}
\newcommand{\inner}[2]{\left \langle #1, #2 \right \rangle}

% Basic R^N topology
\newcommand{\cl}[1]{\overline{#1}} % Used to denote the closure of a set
\newcommand{\ball}[2]{B_{#1}\left (#2 \right )} % Denotes an open ball centered at #1 with radius #2
\newcommand{\cball}[2]{\cl{B}_{#1}\left(#2 \right )} % The closed ball
\newcommand{\pball}[2]{\dot{B}_{#1}\left(#2 \right )} % The punctured ball

\endinput
