%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV - RESUME CLASS FILE
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% This class file defines the structure and design of the template. 
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]

\LoadClass[11pt,letterpaper]{article} % Font size and paper type

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements
\usepackage[dvipsnames]{xcolor} % Colors
\usepackage{graphicx} % For photo
\sloppy
\pagestyle{empty} % Suppress page numbers

% --- Color palette ---
\definecolor{accent}{RGB}{0, 102, 179}       % Deep blue for name & section titles
\definecolor{rulecolor}{RGB}{0, 102, 179}    % Blue horizontal rules
\definecolor{subtext}{RGB}{80, 80, 80}       % Dark grey for secondary text

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}} % Defines the \name command to set name
\def \@name {} % Sets \@name to empty by default

% \photo command to specify a profile picture file
\def \photo#1{\def\@photo{#1}}

\def \addressSep {~~\textcolor{subtext}{$|$}~~} % Separator between contact items

% Up to four address lines can be specified
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax
\let \@addressfour \relax

% \address command fills address slots in order
\def \address #1{
  \@ifundefined{@addresstwo}{
    \def \@addresstwo {#1}
  }{
  \@ifundefined{@addressthree}{
    \def \@addressthree {#1}
  }{
  \@ifundefined{@addressfour}{
    \def \@addressfour {#1}
  }{
    \def \@addressone {#1}
  }}}
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep\ }
    \centerline{\textcolor{subtext}{#1}}
  \endgroup
  \par
  \addressskip
}

% \printheader prints name + photo side by side, then contact lines
\def \printheader {
  % --- Name + photo row ---
  \noindent
  \@ifundefined{@photo}{%
    % No photo: just center the name
    \begin{center}
      {\namesize\bf\textcolor{accent}{\MakeUppercase{\@name}}}
    \end{center}
  }{%
    % Photo on right, name centered in the remaining space
    \begin{minipage}[c]{0.78\textwidth}
      \begin{center}
        {\namesize\bf\textcolor{accent}{\MakeUppercase{\@name}}}
      \end{center}
    \end{minipage}%
    \hfill
    \begin{minipage}[c]{0.18\textwidth}
      \raggedleft
      \includegraphics[width=\textwidth,height=0.14\textheight,keepaspectratio,
        clip,trim=0 0 0 0]{\@photo}%
    \end{minipage}%
  }
  \nameskip\par
  % --- Contact / address lines ---
  \@ifundefined{@addressone}{}{\printaddress{\@addressone}}%
  \@ifundefined{@addresstwo}{}{\printaddress{\@addresstwo}}%
  \@ifundefined{@addressthree}{}{\printaddress{\@addressthree}}%
  \@ifundefined{@addressfour}{}{\printaddress{\@addressfour}}%
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document  % Begin document
  \printheader
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1]{ % 1 input argument - section name
  \sectionskip
  \textcolor{accent}{\MakeUppercase{\bf #1}} % Section title in accent color
  \sectionlineskip
  {\color{rulecolor}\hrule} % Colored horizontal line
  \begin{list}{}{ % List for each individual item in the section
    \setlength{\leftmargin}{1.5em} % Margin within the section
  }
  \item[]
}{
  \end{list}
}

%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSubsection}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
 {\bf #1} \hfill {#2} % Bold company name and date on the right
 \ifthenelse{\equal{#3}{}}{}{ % If the third argument is not specified, don't print the job title and location line
  \\
  {\em #3} \hfill {\em #4} % Italic job title and location
  }\smallskip
  \begin{list}{$\cdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
   \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
  }{
  \end{list}
  \vspace{0.5em} % Some space after the list of bullet points
}

% The below commands define the whitespace after certain things in the document
\def\namesize{\huge} % Size of the name at the top of the document
\def\addressskip{\smallskip} % The space between the two address (or phone/email) lines
\def\sectionlineskip{\medskip} % The space above the horizontal line for each section 
\def\nameskip{\medskip} % The space after your name at the top
\def\sectionskip{\medskip} % The space after the heading section

