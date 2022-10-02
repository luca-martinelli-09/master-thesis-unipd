% -------------------------------------------------------------------
%  @LaTeX-class-file{
%     filename        = "DEIThesis.cls",
%     codetable       = "ISO/ASCII",
%     keywords        = "LaTeX, UniPD, Padua, Thesis, DEI",
%     docstring       = "Class for a DEI thesis."
% --------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{DEIThesis}[DEI Thesis Class]

% -- OPTIONS --
% Pass as option the sections you want to show in the thesis

\newif\if@showwatermark\@showwatermarkfalse
\newif\if@showdedication\@showdedicationfalse
\newif\if@showfigures\@showfiguresfalse
\newif\if@showtables\@showtablesfalse
\newif\if@showalgorithms\@showalgorithmsfalse
\newif\if@showcodes\@showcodesfalse
\newif\if@showacronyms\@showacronymsfalse
\newif\if@showacknowledgments\@showacknowledgmentsfalse

\DeclareOption{watermark}{\@showwatermarktrue}
\DeclareOption{dedication}{\@showdedicationtrue}
\DeclareOption{figures}{\@showfigurestrue}
\DeclareOption{tables}{\@showtablestrue}
\DeclareOption{algorithms}{\@showalgorithmstrue}
\DeclareOption{codes}{\@showcodestrue}
\DeclareOption{acronyms}{\@showacronymstrue}
\DeclareOption{acknowledgments}{\@showacknowledgmentstrue}

\ProcessOptions\relax

% -- GENERAL SETUP --

% type
\LoadClass[12pt,a4paper,twoside,openright]{book}

% page geometry
\RequirePackage[
  headheight=2cm,
  top=3.5cm,
  bottom=3.5cm,
  inner=2.5cm,
  outer=3.5cm,
  footskip=1.5cm,
  footnotesep=1cm,
  twoside,
  a4paper
]{geometry}

% export in PDF/X, PDF/A, etc...
\RequirePackage{etoolbox}
\RequirePackage{colorprofiles}
\RequirePackage[a-2b,mathxmp]{pdfx}[\today]

% language, font and encodings
\RequirePackage{newpxtext,newpxmath}
\RequirePackage[T1]{fontenc}
\RequirePackage[english]{babel}


% -- USEFUL PACKAGES --

% spacings (\onehalfsize, \doublesize)
\RequirePackage{setspace}

% Enumerations
\RequirePackage{calc}
\RequirePackage{enumitem}

% indent first line of paragraph
\RequirePackage{indentfirst}

% captions
\RequirePackage[labelfont=bf]{caption}
\RequirePackage{subcaption}

% footnotes
\RequirePackage{footnote}
\RequirePackage[bottom]{footmisc}

% mathematics
\RequirePackage{amsmath}

% links
\RequirePackage{hyperref}
\RequirePackage{url}

% colors
\RequirePackage{color}

% graphics
\RequirePackage{graphicx}

% algorithms
\RequirePackage{algorithm}
\RequirePackage{algorithmic}

% code snippets
\RequirePackage{listings}

% plots, drawings etc...
\RequirePackage{tikz}
\usetikzlibrary{shapes.geometric, arrows.meta}
\RequirePackage{dirtree}

% references
\RequirePackage[autostyle]{csquotes}
\RequirePackage[
    backend=biber,
    style=alphabetic,
    sorting=ynt
]{biblatex}
\addbibresource{references.bib}

%% imports
\RequirePackage{import}

% tables
\RequirePackage{tabularx}
\RequirePackage{xltabular}
\RequirePackage{longtable}
\RequirePackage{booktabs}

% sideways images
\RequirePackage{rotating}

\RequirePackage[htt]{hyphenat}


% -- DEFINITIONS --

% university
\def\university#1{\gdef\@university{#1}}

% master name
\def\mastername#1{\gdef\@mastername{#1}}

% academic Year
\def\academicYear#1{\gdef\@academicYear{#1}}

% student ID
\def\studentId#1{\gdef\@studentId{#1}}

% advisor
\def\advisor#1{\gdef\@advisor{#1}}

% co-advisor (if one)
\def\coadvisor#1{\gdef\@coadvisor{#1}}
\def\coadvisorsUniversity#1{\gdef\@coadvisorsUniversity{#1}}

% university of Padova color
\definecolor{UniPDColor}{RGB}{155, 0, 20}

%% -- CUSTOM COMMANDS --

\newcount\cmdcounter
\newcommand{\clone}[2]{%
\cmdcounter=0
\loop\ifnum\cmdcounter<#1
#2%
\advance \cmdcounter 1
\repeat
}

\newcommand{\etc}{etc}

% -- LINKS SETUP --

% set all links to black color
\hypersetup{
  colorlinks,
  citecolor=black,
  filecolor=black,
  linkcolor=black,
  urlcolor=black
}



% -- ITEMS AND ENUMARATIONS --

% reduce spacing for items and enumerations
\setlist[enumerate]{itemsep=0pt}
\setlist[itemize]{itemsep=0pt}

% italic for quotes
\let\savedquote\quote
\let\endsavedquote\endquote
\renewenvironment{quote}
    {\itshape\savedquote}
    {\endsavedquote}



% -- HEADERS AND FOOTERS --

% custom headers and footers
\RequirePackage{fancyhdr}

% custom title style
\RequirePackage{titlesec}

% remove headers and footers in blank pages
\RequirePackage{scrextend}

% box for titles
\RequirePackage{adjustbox}

% style for chapters
\titleformat{\chapter}[display]
{\Huge\filleft}
{
  \minsizebox{!}{70pt}{\colorbox{UniPDColor}{\color{white} \thechapter}}
}
{1.2ex}
{}

% style for sections
\titleformat{\section}[hang]
{\Large}
{
  \colorbox{UniPDColor}{\color{white} \thesection}
}
{1ex}
{\scshape}

% style for subsections
\titleformat{\subsection}[hang]
{\large}
{
  \colorbox{UniPDColor}{\color{white} \thesubsection}
}
{1ex}
{\scshape}

% style for subsubsections
\titleformat{\subsubsection}[hang]
{\normalsize}
{}
{0ex}
{\bfseries\scshape}

% remove line headers
\renewcommand{\headrulewidth}{0ex}

% style for headers and footers
\newcommand{\setfancyhf} {
  \fancyhf{}
  \fancyhead[RO]{{\footnotesize\leftmark}}
  \fancyhead[LE]{{\footnotesize\rightmark}}
  \fancyfoot[RE, LO]{}
  \fancyfoot[C]{\thepage}
}



% -- FRONTMATTER --

\renewcommand{\frontmatter} {
    
  % set roman page numbering
  \pagenumbering{roman}

  % set page style
  \pagestyle{fancy}

  % create cover
  \maketitle

  % reset fancy headers
  \setfancyhf

  % set head witdth
  \setlength{\headwidth}{\textwidth}

  % custom titles
  \renewcommand{\listfigurename}{List of Figures}
  \renewcommand{\listtablename}{List of Tables}
  \renewcommand{\listalgorithmname}{List of Algorithms}
  \renewcommand{\lstlistingname}{Code} % Caption name of code snippets
  \renewcommand{\lstlistlistingname}{List of Code Snippets}
  \def\listacronymname{List of Acronyms}

  \def\abstractname{Abstract}
  \def\abstractnameit{Sommario}

  \renewcommand{\bibname}{References}

  \def\acknowledgmentsname{Acknowledgments}

  % insert dedication page
  \if@showdedication
    \dedicationpage
  \fi

  % insert abstract
  \abstractpage

  % insert table of contents
  \tableofcontents
  \cleardoublepage

  % insert list of figures
  \if@showfigures
    \listoffigures
    \addcontentsline{toc}{chapter}{\listfigurename}
    \cleardoublepage
  \fi

  % insert list of tables
  \if@showtables
    \listoftables
    \addcontentsline{toc}{chapter}{\listtablename}
    \cleardoublepage
  \fi

  % insert list of algorithms
  \if@showalgorithms
    \listofalgorithms
    \addcontentsline{toc}{chapter}{\listalgorithmname}
    \cleardoublepage
  \fi

  % insert list of code snippets
  \if@showcodes
    \lstlistoflistings
    \addcontentsline{toc}{chapter}{\lstlistlistingname}
    \cleardoublepage
  \fi

  % insert list of abbreviations/acronyms
  \if@showacronyms
    \acronyms
  \fi
}



% -- TITLE/COVER --

% insert watermark
\RequirePackage{watermark}

\renewcommand{\maketitle} {
  %set custom geometry
  \newgeometry{
    top=1.5cm,
    bottom=2cm,
    inner=2cm,
    outer=2cm,
    headheight=3.5cm,
    includehead,
    includefoot,
  }

  % set head witdth
  \setlength{\headwidth}{\textwidth}

  % set watermark
  \if@showwatermark
    \thiswatermark{
      \centering
      \put(-380,-700) {
        \includegraphics[width=1.4\linewidth]{res/unipdbg}
      }
    }
  \fi

  % set academic year in footer
  \cfoot{\normalsize\textsc{Academic Year \\ \@academicYear}}

  % set brands in header
  \lhead{
    \includegraphics[height=3cm]{res/ltunipd}
  }
  \rhead{
    \includegraphics[height=3cm]{res/dei}
  }

  % content
  \begin{center}

    % master name
    \null \vspace{\stretch{2}}
    \normalsize\textsc{
      Master Thesis in \@mastername
    } \\

    % title
    \onehalfspacing
    \vspace{3ex}
    \LARGE\textbf{\@title} \\
    \vspace{\stretch{3}}

    % authors, advisors etc...
    \doublespacing

    \begin{flushleft}
      \small
      \textsc{Master Candidate} \hfill \textsc{Supervisor} \\
      \large{\textbf{\@author}} \hfill \large{\textbf{\@advisor}} \\
      \small
      \textbf{Student ID \@studentId} \hfill \textbf{\@university} \\
      % insert co-advisor if not empty
      \ifx\@coadvisor\empty \else
        \hfill \\
        \hfill \textsc{Co-supervisor} \\
        \hfill \large{\textbf{\@coadvisor}} \\
        \small
        \hfill \textbf{\@coadvisorsUniversity} \\
      \fi
    \end{flushleft}

    \vspace{\stretch{1}} \null
  \end{center}

  % restore defaults
  \cleardoublepage
  \restoregeometry
  \onehalfspacing
}



% -- DEDICATION --

\newcommand{\dedicationpage} {
  % set empty style for this page (no headers and footers)
  \thispagestyle{empty}

  \phantomsection
  
  \null \vspace{\stretch{1}}

  \begin{flushright}
    \input{frontmatter/dedication}
  \end{flushright}

  \vspace{\stretch{4}} \null
  
  % insert pages for alignment
  \cleardoublepage
}



% -- ACRONYMS/ABBREVIATIONS --

\RequirePackage{acronym}

% custom style for acronyms
\newcommand{\acronyms}{
  \phantomsection
  \addcontentsline{toc}{chapter}{\listacronymname}
  \chapter*{\listacronymname}
  \input{frontmatter/glossary}
  \cleardoublepage
}



% -- ABSTRACT --

\newenvironment{abstract}[1][en] {
  % get argument (en/it)
  \def\it{it}
  \def\arg{#1}

  \null \vfill
  \begin{center}
    \bfseries
    
    % set title in english or italian
    \ifx\arg\it
      \abstractnameit
    \else
      \abstractname
    \fi
  \end{center}
} {
  \vfill \null
}

\newcommand{\abstractpage} {
  % set empty style for this page (no headers and footers)
  \thispagestyle{empty}

  % english version
  \input{frontmatter/abstract}
  
  % italian version
  \cleardoublepage
  \thispagestyle{empty}
  \input{frontmatter/sommario}
}



% -- MAIN MATTER --

\renewcommand{\mainmatter} {
  \cleardoublepage

  % reset page counter
  \setcounter{page}{1}

  % set arabic page numbering
  \pagenumbering{arabic}

  % reset chapter counter
  \setcounter{chapter}{0}
}



% -- BACKMATTER --

\renewcommand{\backmatter}{
  \cleardoublepage
  \phantomsection

  % add references
  \addcontentsline{toc}{chapter}{\bibname}
  \printbibliography

  \if@showacknowledgments
    \cleardoublepage
    \phantomsection

    % add acknowledgments
    \addcontentsline{toc}{chapter}{\acknowledgmentsname}
    \acknowledgments
  \fi
}



% -- ACKNOWLEDGMENTS --
\newcommand{\acknowledgments} {
  \phantomsection
  \chapter*{\acknowledgmentsname}
  \input{frontmatter/thanks}
}


% -- CODE SNIPPETS --

% Colors for code snippets highlights
\definecolor{commentsColor}{RGB}{36, 161, 156}
\definecolor{numColor}{RGB}{71, 96, 114}
\definecolor{stringColor}{RGB}{205, 63, 62}
\definecolor{kwColor}{RGB}{248, 6, 204}
\definecolor{bgCodeColor}{RGB}{255, 249, 249}

% Style of code snippets
\lstdefinestyle{codeSnippet} {
  backgroundcolor=\color{bgCodeColor},
  commentstyle=\color{commentsColor},
  keywordstyle=\color{kwColor},
  numberstyle=\tiny\color{numColor},
  stringstyle=\color{stringColor},
  basicstyle=\ttfamily\footnotesize,
  breakatwhitespace=false,         
  breaklines=true,                 
  captionpos=b,                    
  keepspaces=true,                 
  numbers=left,                    
  numbersep=5pt,                  
  showspaces=false,                
  showstringspaces=false,
  showtabs=false,                  
  tabsize=2
}

\lstset{style=codeSnippet}