
% University of Alabama MS/PhD thesis/dissertation LaTeX Class File
%
% Copyright (c) 2012 Paul Kilgo
% The latest version of this file may be obtained from
%   https://github.com/OEP/uathesis
%
% License: LaTeX Project Public License (www.latex-project.org/lppl.txt)
%   Executive summary:
%       This software is copyright but you are granted a license which gives
%       you, the "user" of the software, legal permission to copy, distribute,
%       and/or modify the software. However, if you modify the software and
%       then distribute it (even just locally) you must change the name of the
%       software to avoid confusion.
%
% OR (dual-licensed)
%
% License: GNU Lesser General Public License (www.gnu.org/licenses/lgpl.html)
%
% Author Information:
%   Paul Kilgo
%   The University of Alabama
%   paulkilgo@gmail.com
%
% Any change requests are appreciated if proposed through Github. Any bug
% reporting should also be done through Github as well.
%
% Happy writing!

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{uathesis}

\RequirePackage{ifthen}

\newif\ifthesis
\DeclareOption{thesis}{\thesistrue}
\DeclareOption{dissertation}{\thesisfalse}

\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{report}%
}
\ProcessOptions\relax
\LoadClass[letterpaper,12pt]{report}

% margins
\usepackage[top=1in,bottom=1in,left=1in,right=1in]{geometry}
\usepackage{titlesec}
\usepackage{setspace}
\usepackage{textcase}
\usepackage{tocloft}
\renewcommand{\cftchappresnum}{CHAPTER }
\AtBeginDocument{\addtolength\cftchapnumwidth{\widthof{\bfseries CHAPTER }}}
\renewcommand\cftchapafterpnum{\vskip0.75\baselineskip}
\renewcommand\cftsecafterpnum{\vskip0.75\baselineskip}
\renewcommand\cftsubsecafterpnum{\vskip0.75\baselineskip}
\renewcommand\cftsubsubsecafterpnum{\vskip0.75\baselineskip}


\usepackage{etoolbox}
\patchcmd\thebibliography
 {\labelsep}
 {\labelsep\itemsep=10pt\relax}
 {}
 {\typeout{Couldn't patch the command}}
 %%% End of code to add %%%

\usepackage[style=alttree,nogroupskip,nonumberlist,toc]{glossaries}
\glssetwidest{FPGAWW}

\renewcommand{\glossaryname}{LIST OF ABBREVIATIONS AND SYMBOLS}
\renewcommand{\glsnamefont}[1]{\textbf{#1}}
\renewcommand*{\glossarypreamble}{\vspace{-\baselineskip}}

\renewcommand{\cfttoctitlefont}{\hfill\bfseries\MakeTextUppercase}
\renewcommand{\cftaftertoctitle}{\hfill\hfill}
\renewcommand{\cftchapfont}{ }
\renewcommand{\cftdot}{.}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchappagefont}{}

%\renewcommand{\cftloftitlefont}{\pagebreak\hfill\MakeTextUppercase}
\renewcommand{\cftloftitlefont}{\hfill\bfseries\MakeTextUppercase}
\renewcommand{\cftafterloftitle}{\hfill}

\renewcommand{\cftlottitlefont}{\hfill\bfseries\MakeTextUppercase}
\renewcommand{\cftafterlottitle}{\hfill}

\setlength\cftbeforetoctitleskip{48pt}
\setlength\cftbeforeloftitleskip{58pt}
\setlength\cftbeforelottitleskip{48pt}

\setlength\cftaftertoctitleskip{13pt}
\setlength\cftafterloftitleskip{12pt}
\setlength\cftafterlottitleskip{13pt}

\setlength{\cftbeforechapskip}{0pt}
\setlength{\cftbeforefigskip}{10pt}

%% Title spacings.
\titlespacing{\chapter}{0pt}{2in}{1in}

%% Thesis committee
\newcommand\committee[1]{\renewcommand\@committee{#1}}
\newcommand\@committee{Committee undefined}

%% Adviser
\newcommand\adviser[1]{\renewcommand\@adviser{#1}}
\newcommand\@adviser{Adviser undefined}

%% Candidate degree
\newcommand\degree[1]{\renewcommand\@degree{#1}}
\newcommand\@degree{Undefined Degree}

%% University (if not UA)
\newcommand\university[1]{\renewcommand\@university{#1}}
\newcommand\@university{The University of Alabama}

%% Department
\newcommand\department[1]{\renewcommand\@department{#1}}
\newcommand\@department{Undefined Department}

%% School (in case of undergrad thesis or something)
\newcommand\school[1]{\renewcommand\@school{#1}}
\newcommand\@school{Graduate School}

%% Year of graduation
\newcommand\gradyear[1]{\renewcommand\@gradyear{#1}}
\newcommand\@gradyear{\the\year}

%% Place
\newcommand\place[1]{\renewcommand\@place{#1}}
\newcommand\@place{Tuscaloosa, Alabama}

%% Abstract body text
\renewcommand\abstract[1]{\renewcommand\@abstract{#1}}
\newcommand\@abstract{No abstract body text.}

%% Dedication body text
\newcommand\dedication[1]{\renewcommand\@dedication{#1}}
\newcommand\@dedication{No dedication body text.}

%% Acknowledgments body text
\newcommand\acknowledgments[1]{\renewcommand\@acknowledgments{#1}}
\newcommand\@acknowledgments{No acknowledgments body text.}

%% Rename bibliography
\renewcommand{\bibname}{REFERENCES}


%% Do not add vspace between chapters
%% Hack taken from:
%% http://tex.stackexchange.com
%% /questions/784/how-to-change-the-line-spacing-in-my-list-of-figures
\newcommand*{\noaddvspace}{\renewcommand*{\addvspace}[1]{}}
\addtocontents{lof}{\protect\noaddvspace}
\addtocontents{lot}{\protect\noaddvspace}

% Make the front matter...
\newcommand{\makefrontmatter}{
  \thispagestyle{empty}
  \vspace*{35\p@}
  \begin{center}
  \begin{doublespace}
    \renewcommand{\and}{\NoCaseChange{\\}}
    \MakeTextUppercase{\@title} \linebreak \linebreak
    by \linebreak
    \MakeTextUppercase{\@author}
    \begin{singlespace}
      \MakeTextUppercase{\@adviser, Committee Chair \and \@committee}
    \end{singlespace}

    \hfill \linebreak
    \ifthesis
      A THESIS
    \else
      A DISSERTATION
    \fi
    \hfill \linebreak
    \begin{singlespace}
	  Submitted in partial fulfillment of the requirements \\
      for the degree of \@degree \\
      in the Department of \@department \\
      in the \@school\,of \\
      \@university
    \end{singlespace}
	\hfill \linebreak
	\hfill \linebreak
	\MakeTextUppercase{\@place}
	\hfill \linebreak
	\hfill \linebreak
	\@gradyear
  \end{doublespace}
  \end{center}
  \pagebreak


    \begin{frontmatter}

    \chapter*{ABSTRACT}
    \addcontentsline{toc}{chapter}{ABSTRACT}

    \@abstract

    \chapter*{DEDICATION}
    \addcontentsline{toc}{chapter}{DEDICATION}

    \@dedication

    %% Print everything in the glossary.
    \glsaddall
    \printglossaries
    \glsresetall
    \chapter*{ACKNOWLEDGMENTS}
    \addcontentsline{toc}{chapter}{ACKNOWLEDGMENTS}

    \@acknowledgments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    \clearpage

    \begin{singlespace}
    \tableofcontents
    \end{singlespace}
    \clearpage
    \listoftables
    \addcontentsline{toc}{chapter}{LIST OF TABLES}
    \clearpage
    \addcontentsline{toc}{chapter}{LIST OF FIGURES}
	\singlespacing
    \listoffigures
	\doublespacing

    \end{frontmatter}

}

\newcommand{\makecopyright}{
  \thispagestyle{empty}
  \singlespacing
  \null \vfill
  \begin{center}
    Copyright \@author\,\@gradyear \\
    ALL RIGHTS RESERVED
  \end{center}
}


\newenvironment{frontmatter}{
  \makecopyright
  \pagebreak
  \pagenumbering{roman}
  \setcounter{page}{2}
  \setcounter{chapter}{0}
  \begin{doublespace}
  \renewcommand{\@makechapterhead}[1]
  {%\vspace*{65\p@}
    \begin{center}
      \MakeTextUppercase{ ##1 }
    \end{center}
  }
  \renewcommand{\@makeschapterhead}[1]
  {\vspace*{35\p@}
    \begin{center}
     \MakeTextUppercase{ \textbf{ ##1 } }
    \end{center}
  }
}
{
    \end{doublespace}
}
\newenvironment{body}
{
  \pagebreak
  \pagenumbering{arabic}
  \setcounter{page}{1}
  \setcounter{chapter}{0}
  \begin{doublespace}
  \renewcommand{\@makechapterhead}[2]
  {
    \vspace*{37\p@}%
    \begin{center}
      \MakeTextUppercase{ \textbf{ \@chapapp\space \thechapter } }
      \linebreak
      \MakeTextUppercase{ \textbf{ ##1 } }
    \end{center}
  }

  \renewcommand{\@makeschapterhead}[1]
  {\vspace*{35\p@}
    \begin{center}
      \MakeTextUppercase{ \textbf{ ##1 } }
    \end{center}
  }

  \renewcommand{\section}
  {
    \@startsection{section}{1}{0mm}{4ex}{2ex}{\normalsize\bfseries}
  }

  \renewcommand{\subsection}
  {
    \@startsection{subsection}{1}{0mm}{1mm}{1mm}{\normalsize\bfseries}
  }
}
{
  \end{doublespace}
}

\makeglossaries
