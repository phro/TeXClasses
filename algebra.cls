\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{algebra}[2014/10/26 Author: Jesse Frohlich; Custom Style for Math 328 Group Theory Assignments]

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

\delimitershortfall-1sp % Allow automatic growth of delimiters


\newcounter{questionCounter}
\newcounter{thmCounter}
% Reset the case counter during new questions
\newcounter{caseCounter}[questionCounter]

\newtheorem{thm}[thmCounter]{Theorem}
\newtheorem{lem}[thmCounter]{Lemma}
\theoremstyle{remark}
\newtheorem{case}[caseCounter]{Case}
\theoremstyle{definition}
\newtheorem{q}[questionCounter]{Exercise}

\newcommand{\Q}{\mathbb{Q}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\gen}[1]{\left \langle #1\right \rangle} % Used for generating sets.
\newcommand{\set}[1]{\left \{ #1 \right \}} % Generate a set
\DeclareMathOperator{\sgn}{sgn}
\DeclareMathOperator{\ord}{ord}

\endinput
