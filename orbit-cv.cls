\ProvidesClass{orbit-cv}[2017/07/10 résumé class]
\LoadClass{memoir}

%% © Martín Varela, 2017
%% Author: Martín Varela (martin@varela.fi)
%% Inspired by the Hugo Orbit theme, by Pavel Kanyshev
%% © Pavel Kanyshev, 2016
%% https://github.com/aerohub/hugo-orbit-theme
%% Some code based on the TwentySecondsCV class, by Carmine Spagnuolo
%% https://github.com/spagnuolocarmine/TwentySecondsCurriculumVitae-LaTex
%% © Carmine Spagnuolo, 2016

\NeedsTeXFormat{LaTeX2e}
%%%%%%%%%%%
% Packages
%%%%%%%%%%%

\RequirePackage[T1]{fontenc}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{fontawesome}
\RequirePackage{parskip}
\RequirePackage{fontspec}
\RequirePackage{datatool}
\RequirePackage{atbegshi}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{memoir}
}
\ProcessOptions\relax
\RequirePackage[compact]{titlesec}


%%%%%%%%%%%%%%
% Profile data
%%%%%%%%%%%%%%

\DTLnewdb{contact}
\DTLnewdb{education}
\DTLnewdb{cvlanguages}
\DTLnewdb{interests}
\DTLnewdb{skills}


\newcommand{\addContact}[2]{
  \DTLnewrow{contact}%
   \DTLnewdbentry{contact}{icon}{#1}%
   \DTLnewdbentry{contact}{contactData}{#2}%
}

\newcommand{\ListContacts}{
  \vspace{0.3cm}
  \raggedright
  \footnotesize
  \renewcommand{\dtlheaderformat}[1]{}
  \renewcommand{\arraystretch}{1.6}
  \DTLdisplaydb{contact}
  \vspace{0.5cm}
  \normalsize
}


\newcommand{\addEducation}[3]{
   \DTLnewrow{education}%
   \DTLnewdbentry{education}{degree}{#1}%
   \DTLnewdbentry{education}{institute}{#2}%
   \DTLnewdbentry{education}{dates}{#3}%
}

\newcommand{\dispEdu}[3]{#1\par
  {\addfontfeatures{Color=sidebarsubdued}#2, #3 \par
    \addfontfeatures{Color=sidecolor}  \vspace{0.25cm}}}

\newcommand{\ListEducation}{
  EDUCATION\par
  \vspace{0.3cm}

  \raggedright
  \footnotesize

\DTLforeach{education}{\degree=degree,\institute=institute,\dates=dates}{
  \dispEdu{\degree}{\institute}{\dates}
  }

  \vspace{0.5cm}
  \normalsize
}


\newcommand{\addLanguage}[2]{
   \DTLnewrow{cvlanguages}%
   \DTLnewdbentry{cvlanguages}{cvlanguage}{#1}%
   \DTLnewdbentry{cvlanguages}{level}{#2}%
}

\newcommand{\dispLang}[2]{#1
  {\addfontfeatures{Color=sidebarsubdued}(#2)}\par
  \addfontfeatures{Color=sidecolor}\vspace{0.25cm}}

\newcommand\ListLanguages{
  LANGUAGES\par
  \vspace{0.3cm}
  \raggedright
  \footnotesize
  \DTLforeach{cvlanguages}{\cvlanguage=cvlanguage,\level=level}{
    \dispLang{\cvlanguage}{\level}
  }
  \vspace{0.5cm}
  \normalsize
}


\newcommand{\addInterest}[1]{
   \DTLnewrow{interests}%
   \DTLnewdbentry{interests}{interest}{#1}%
}


\newcommand{\dispInterest}[1]{#1\par \vspace{0.25cm}}
\newcommand{\ListInterests}{
  INTERESTS\par
  \vspace{0.3cm}
  \raggedright
  \footnotesize

  \DTLforeach{interests}{\interest=interest}{
    \dispInterest{\interest}
  }
}

\newlength{\skillBarLength}
\setlength{\skillBarLength}{7.5cm}
\newcommand{\doSkill}[1]{
\begin{tikzpicture}
\fill [fill=sidecolor] (0,0) rectangle (\the\skillBarLength,.25);
\fill [fill=sidebarbtm] (0,0) rectangle (#1*\the\skillBarLength,.25);
\end{tikzpicture}
}

\newcommand{\addSkill}[2]{
   \DTLnewrow{skills}%
   \DTLnewdbentry{skills}{skill}{#1}%
   \DTLnewdbentry{skills}{level}{\doSkill{#2}}%
}

\newcommand{\ListSkills}{
  \par
  \renewcommand{\dtlheaderformat}[1]{}
  \renewcommand{\arraystretch}{1.3}
  \DTLdisplaydb{skills}
  \vspace{0.5cm}
}
%%%%%%%%%%%%%%%% 
%Section Spacing
%%%%%%%%%%%%%%%%

\setlength\parindent{0pt}

%%%%%%%%
% Colors
%%%%%%%%

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{RGB}{70,76,67}
\definecolor{sidecolor}{HTML}{E7E7E7}
\definecolor{sidebartop}{HTML}{287489}
\definecolor{sidebarbtm}{HTML}{3298B4}
\definecolor{sidebarsubdued}{RGB}{158,197,205}
\definecolor{textsubdued}{RGB}{133,152,183}


\newcommand{\colorschemeTwo}{
\definecolor{sidebartop}{RGB}{74,102,106}
\definecolor{sidebarbtm}{RGB}{94,156,138}
\definecolor{sidebarsubdued}{RGB}{196,220,212}
\definecolor{textsubdued}{RGB}{133,183,152}
}

\newcommand{\colorschemeThree}{
\definecolor{sidebartop}{RGB}{81,129,72}
\definecolor{sidebarbtm}{RGB}{106,169,92}
\definecolor{sidebarsubdued}{RGB}{183,230,182}
\definecolor{textsubdued}{RGB}{133,183,152}
}

\newcommand{\colorschemeFour}{
\definecolor{sidebartop}{RGB}{94,49,76}
\definecolor{sidebarbtm}{RGB}{124,61,98}
\definecolor{sidebarsubdued}{RGB}{136,104,128}
\definecolor{textsubdued}{RGB}{183,133,152}
}

\newcommand{\colorschemeFive}{
\definecolor{sidebartop}{RGB}{170,111,43}
\definecolor{sidebarbtm}{RGB}{225,144,54}
\definecolor{sidebarsubdued}{RGB}{220,180,140}
\definecolor{textsubdued}{RGB}{199,160,120}
}

\newcommand{\colorschemeSix}{
\definecolor{sidebartop}{RGB}{53,67,77}
\definecolor{sidebarbtm}{RGB}{67,86,99}
\definecolor{sidebarsubdued}{RGB}{131,143,161}
\definecolor{textsubdued}{RGB}{131,143,161}
}
%%%%%%%
% Fonts
%%%%%%%
\setmainfont[Ligatures=TeX]{Roboto Light}



%%%%%%%%%%%%%%%%%%%%%%%
% (not quite)Sectioning
%%%%%%%%%%%%%%%%%%%%%%%
\titleformat{\section}[display]{}{}{0pt}
{\setmainfont{Roboto Black}\color{sidebartop}}
{\setmainfont[Ligatures=TeX,Color=darkgray]{Roboto Light}}


%%%%%%%%%
% SideBar
%%%%%%%%%

%%% Lifted from TwentySeconds CV
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newcommand{\imsize}{\linewidth}
\newlength\imagewidth
\newlength\imagescale
\renewcommand{\imsize}{0.618\linewidth}
\pgfmathsetlength{\imagewidth}{5cm}%
\pgfmathsetlength{\imagescale}{\imagewidth/600}%

\newcommand{\profilepic}[1]{\renewcommand{\givenprofilepic}{#1}}
\newcommand{\cvname}[1]{\renewcommand{\givencvname}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\givencvjobtitle}{#1}}

\newcommand{\givencvname}{REQUIRED!}
\newcommand{\givenprofilepic}{}
\newcommand{\givencvjobtitle}{}

\newcommand*\icon[1]{\tikz[baseline=(char.base)]{
            \node[shape=circle,draw,inner sep=1pt, fill=mainblue,mainblue,text=white] (char) {#1};}}
\newcommand*\round[2]{%
  %\tikz[baseline=(char.base)]\node[anchor=north west, draw,rectangle, rounded corners, inner sep=1.6pt, minimum size=5.5mm,
  \tikz[baseline=(char.base)]\node[anchor=north west, draw,rectangle, rounded
  corners, inner sep=1.6pt, minimum size=5.5mm, minimum height=5mm,
    text height=3.6mm,  fill=#2,#2,text=white](char){#1} ;}

%%% TSCV stuff above

  
\newcommand{\workexp}[4]{
  { \textbf{#1}} \hfill \addfontfeatures{Color=textsubdued} #2 \par
  {\color{textsubdued}{#3}}\par
  \addfontfeatures{Color=darkgray}
  #4\par 
  \vspace{0.25cm} 
}

\newcommand{\project}[3]{
  \textbf{\href{#1}{#2}}\par
  #3\par
  \vspace{0.25cm}
}
  
\newcommand{\publication}[3]{
  \textbf{#1}\par
  {\addfontfeatures{Color=textsubdued}#2\par
  #3}\par
  \vspace{0.25cm}
  \addfontfeatures{Color=darkgray}
}


\newlength{\sidebarOffset}
\setlength{\sidebarOffset}{3cm}
\newlength{\sidebarTopHeight}
\setlength{\sidebarTopHeight}{6.7cm}

%% For some reason can't get this to work, complains
%% about missing units, so it's hard-coded for now
%\let\textBlockOffset{16.5cm}

\newcommand{\dosidebar}
{
%\newpage
\begin{textblock}{4}[0,0](16.6,0)

\begin{tikzpicture}[remember picture,overlay]
   	 \node [rectangle, fill=sidebarbtm, anchor=north, minimum width=6.90cm, minimum height=\paperheight+1cm] (box) at (\sidebarOffset,0.5cm){};
\end{tikzpicture}

\centering
\vspace{3mm}
\end{textblock}
}

\newcommand{\doprofile}
% This vbox is necessary to use the atbegshi stuff, otherwise it complains about
% some ``improper \prevdepth'''
{\vbox{
\begin{textblock}{4}[0,0](16.6,0)

\begin{tikzpicture}[remember picture,overlay]
   	 \node [rectangle, fill=sidebarbtm, anchor=north, minimum width=6.90cm, minimum height=\paperheight+1cm] (box) at (\sidebarOffset,0.5cm){};
   	 \node [rectangle, fill=sidebartop, anchor=north, minimum width=6.90cm, minimum height=\sidebarTopHeight] (box) at (\sidebarOffset,0.5cm){};
\end{tikzpicture}

\begin{flushleft}
\hspace{13pt}
\begin{tikzpicture}[x=\imagescale,y=-\imagescale]
    \clip (420/2, 420/2) circle (400/2);
        \node[anchor=north west, inner sep=0pt, outer sep=0pt] at (0,0) {\includegraphics[width=3.5cm]{\givenprofilepic}};
\end{tikzpicture}

\centering
\vspace{3mm}
{\Huge \setmainfont[Color=sidecolor]{Roboto
    Black}\givencvname{}\setmainfont[Ligatures=TeX,Color=sidecolor]{Roboto Light}}

\addfontfeatures{Color=sidebarsubdued}
\givencvjobtitle
\addfontfeatures{Color=sidecolor}
\color{sidecolor}

\ListContacts{}

\ListEducation{}

\ListLanguages{}

\ListInterests{}

\end{flushleft}

\end{textblock}}
\setmainfont[Ligatures=TeX,Color=darkgray]{Roboto Light}
 }

\pagestyle{empty}

%%%%%%%%%%
% Geometry
%%%%%%%%%%
\RequirePackage[right=7.3cm,top=1.5cm,left=1cm,bottom=1.5cm,nohead,nofoot,asymmetric,bindingoffset=0.1mm]{geometry}

\AtBeginShipout{\dosidebar}
\newcommand{\makeprofile}{
  \AtBeginShipoutFirst{\doprofile}
  \addfontfeatures{Color=darkgray}
  \hypersetup{
    colorlinks,
    linkcolor={sidebarbtm},
    citecolor={sidebarbtm},
    urlcolor={sidebarbtm}
  }
}

\RequirePackage{hyperref}
\hypersetup{
  colorlinks,
  linkcolor={sidecolor},
  citecolor={sidecolor},
  urlcolor={sidecolor}
}