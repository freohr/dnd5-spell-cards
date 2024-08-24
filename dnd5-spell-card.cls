\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dnd5-spell-card}[2024-07-25 Cards for monsters in the 13th Age RPG]

\LoadClass[a4paper]{article}
\RequirePackage[landscape,left=0.6cm,right=0.9cm,top=0.7cm,bottom=0cm]{geometry}

\RequirePackage[super]{nth}
\RequirePackage{calc}
\RequirePackage{enumitem}
\RequirePackage{etoolbox}
\RequirePackage{hanging}
\RequirePackage{ifthen}
\RequirePackage{intcalc}
\RequirePackage{stringstrings}
\RequirePackage{xargs}
\RequirePackage{xstring}

\usepackage{fontspec}
\setmainfont{Bookinsanity}
\newfontfamily\titlefontface{Mr Eaves}

\newcommand{\titlefont}[1][1]{\large}
\newcommand{\headerfont}[1][1]{\normalsize}
\newcommand{\bodyfont}[1][1]{\small}

\RequirePackage[skip=10pt, indent=0pt]{parskip}

\pagestyle{empty}

\setlist[itemize]{label=,noitemsep,itemindent=-0.5cm,left=0pt}

\hbadness=10000

\newcounter{cardCount}
\newcommand{\spellCard}[1]
{
  \stepcounter{cardCount}
  \ifnumgreater{\intcalcMod{\value{cardCount}}{6}}{2}{
    \vspace{0.5cm}
  }{}
  \parbox[t][9.5cm]{9cm}{
    #1
  }%
  \quad%
}

\newcommand{\spellName}[1]{ 
  {\titlefont\titlefontface\textbf{\textsc{\textbf{#1}}}\\}
  \def\internalName{#1}
}

\newcommand{\spellLevel}[2]{
  \textit{\nth{#1}-level #2}
}

\newcommand{\spellTrait}[2]{
\item \textbf{#1:} #2
}

\newcommand{\spellTraits}[4]{
  \vspace{7pt}
  \begin{hangparas}{10pt}{1}
    \begin{itemize}
      \spellTrait{Casting Time}{#1}
      \spellTrait{Range}{#2}
      \spellTrait{Components}{#3}
      \spellTrait{Duration}{#4}
    \end{itemize}
  \end{hangparas}
}

\newcommandx{\spellDescription}[2][2]{
  \vspace{7pt}
  #1 \par
  \notblank{#2}{\hspace{10pt}\textbf{\textit{At Higher Levels:}} #2}{}
}
