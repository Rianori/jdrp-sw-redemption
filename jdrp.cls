%This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License. 
%To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/ or send a letter 
%  to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jdrp}[2016/12/28 JdR Manuel Class]
 
\LoadClass[10pt,twoside,twocolumn]{article}

\ProcessOptions\relax

\RequirePackage[french]{babel} 			% French language
\RequirePackage[margin=1.5cm]{geometry}	% Page margin
\RequirePackage[export]{adjustbox}
\RequirePackage[bottom]{footmisc} 		% Note de bas de page en bas plutôt que juste après le texte
\RequirePackage{enumitem}
\RequirePackage{lettrine}
\RequirePackage[table]{xcolor}
\RequirePackage[most]{tcolorbox}


\RequirePackage{hyperref}
\hypersetup{
    colorlinks=true,                         
    linkcolor=blue, 	% Couleur des liens internes
    citecolor=red, 		% Couleur des numéros de la biblio dans le corps
    urlcolor=blue  } 	% Couleur des url

\setcounter{DefaultLines}{3}
\setlength{\DefaultNindent}{0em}

\RequirePackage{wrapfig}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Biblio management 
\RequirePackage[style=verbose,sorting=none]{biblatex}
\setlength\bibitemsep{1.5\itemsep}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Backgrounding 
\RequirePackage{eso-pic}

\newcommand\AtTextUpperRight[1]{\AtTextUpperLeft{%
   \makebox[\textwidth][r]{#1}}}

\AddToShipoutPictureBG{%
	\ifnum\value{page}>1
  	\AtPageLowerLeft{\includegraphics[width=\paperwidth,height=\paperheight]{img/bg-a4-odd.jpg}}
  	\fi
  }

\AddToShipoutPicture{
	\ifthenelse{\isodd{\thepage}}
    	{\AtTextUpperLeft{\hspace{1.5\baselineskip}\hspace{\textwidth}\rotatebox{-90}{\scalebox{1.5}{\aurebesh\textcolor{uppergold}{\leftmark}}}}}
    	{\AtTextUpperLeft{\hspace{-2\baselineskip}\rotatebox{-90}{\scalebox{1.5}{\aurebesh\textcolor{uppergold}{\leftmark}}}}}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fonts
\RequirePackage[quiet]{fontspec}

\setmainfont[Path=font/noto-sans/,
    Extension=.ttf,
    UprightFont= *-Regular,
    SmallCapsFont=*-Regular,
    BoldFont=*-Bold,
    ItalicFont=*-Italic,
    BoldItalicFont=*-BoldItalic
]{NotoSans}

\newfontfamily{\jedifont}[Path=font/,Extension=.ttf,Ligatures=TeX]{Starjedi}
\newfontfamily\aurebesh[
	Path=font/,
    Extension=.otf
]{Aurebesh}

% Lettrine
\renewcommand{\LettrineFontHook}{\jedifont}
\renewcommand{\LettrineTextFont}{\upshape}	% Remove samll-caps, Noto doesn't support
\renewcommand{\DefaultNindent}{5pt}

\DeclareFieldFormat{citetitle}{\textit{#1}}
\DeclareFieldFormat{citeauthor}{#1}
\DeclareFieldFormat{citefield}{#1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Columns setup
\setlength{\columnsep}{1cm}
\raggedbottom % Align multi columns to the top of the page 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define colors 
\RequirePackage{color}
\definecolor{bgtan}{HTML}{F7F2E5}		% e.g. used for background and quotebox
\definecolor{titlered}{HTML}{58180D}	% e.g. used for titles
\definecolor{undergold}{HTML}{C9AD6A}	% e.g. used for titlerules
\definecolor{uppergold}{HTML}{B89A67}	%e.g. used for pagenumbers and footer
%\definecolor{puregold}{HTML}{E69A28}	%e.g. used for top line in newer monsterbox
%\definecolor{monstertan}{HTML}{FDF1DC}	%e.g. used for newer monsterblock
\definecolor{monstertandark}{HTML}{F0DBB5}	%e.g. used for older monsterbox
\definecolor{commentgreen}{HTML}{E0E5C1} % e.g. used in table and green commentbox
\definecolor{itemtablepink}{HTML}{E9CDC2} % e.g. used in item tables instead of the green
%\definecolor{rulered}{HTML}{9C2B1B}		%e.g. used for triangular rule in statsblock


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Footer - Must be before sectioning ...
\RequirePackage{fancyhdr} 			  % Adaptation of the footers

\thispagestyle{empty}
\pagestyle{fancy}

\footskip = 20pt %push the footer down so it fits with the decal from the bg-img
\fancyhfoffset[LE]{28pt} % push the footer left on even pages so it fits the decal
\fancyhfoffset[RO]{30pt} % push the footer right on odd pages so it fits the decalbg-img
\renewcommand{\headrulewidth}{0.0pt} %no rule for header
\renewcommand{\footrulewidth}{0.0pt} %no rule for footer

\fancyhead{} % clear all header fields
\fancyfoot{} % clear all footer fields

\fancyfoot[LE]{
	\textcolor{uppergold}{\thepage}
	\hspace*{0.2cm}
	\raisebox{-10pt}{\textcolor{uppergold}{\nouppercase\leftmark}}
	}

\fancyfoot[RO]{
	\raisebox{-10pt}{\textcolor{uppergold}{\nouppercase\rightmark}}
	\hspace*{1cm}
	\textcolor{uppergold}{\thepage}
	}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sectioning
\RequirePackage{titlesec}
\renewcommand\thesection{}
\renewcommand\thesubsection{}
\renewcommand\thesubsubsection{}

% Adjust section and subsection colors and font (change 0em to 1em if you commented the removal of section numbering)
\titleformat{\section}
{\color{titlered}\jedifont\Huge\raggedright}{\thesection}{0em}{}

\titleformat{\subsection}
{\color{titlered}\Large\raggedright}{\thesubsection}{0em}{}[{\titleline{\color{undergold}\titlerule[1pt]}}]

\titleformat{\subsubsection}
{\color{titlered}\large\raggedright}{\thesubsubsection}{0em}{}[]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Styling new commands
\RequirePackage{tcolorbox}
\newtcolorbox{commentbox}[2][]{
	frame hidden,
	boxrule=0pt,
	breakable,
	enhanced,
	before skip=8pt plus 1pt,
	toptitle=3mm,
	boxsep=0.25ex,
	left=8pt,
	right=8pt,
	arc=0mm,
	fonttitle=\bfseries\color{black},
	title=#2,
	parbox = false,
	colback=commentgreen,
	colframe=commentgreen,
	colbacktitle=commentgreen,
	after={\vspace{5pt plus 1pt}\noindent},
	#1
}

\newlist{rebelist}{itemize}{1}
\setlist[rebelist]{label=\jedifont{\$}}

\RequirePackage{tabularx}

\newenvironment{itemtable}[1][XX]{
	\par\vspace*{8pt}
	\noindent
	\rowcolors{1}{bgtan}{itemtablepink} % Alternate colors
	\tabularx{\linewidth}{#1}
	}
	{\endtabularx\vspace{8pt plus 1pt}\noindent} 

\newtcolorbox{paperbox}[2][]{
	frame hidden,
	boxrule=0pt,
	breakable,
	enhanced,
	before skip=11pt plus 1pt,
	toptitle=3mm,
	boxsep=0.25ex,
	left=8pt,
	right=8pt,
	fonttitle=\bfseries\color{black},
	title=#2,
	arc=0mm,
	parbox = false,
	borderline north={1pt}{-0.5pt}{black},
	borderline south={1pt}{-0.5pt}{black},
	colback=monstertandark,
	colframe=monstertandark,
	colbacktitle=monstertandark,
	fuzzy shadow={0mm}{-3.5pt}{-0.5pt}{0.4mm}{black!60!white},
	overlay={
		\fill [fill=black] (frame.south west) -- ++(7pt,0) -- ++(0,-5pt) -- cycle;
		\fill [fill=black] (frame.north west) -- ++(7pt,0) -- ++(0,5pt) -- cycle;
		\fill [fill=black] (frame.north east) -- ++(-7pt,0) -- ++(0,5pt) -- cycle;
		\fill [fill=black] (frame.south east) -- ++(-7pt,0) -- ++(0,-5pt) -- cycle;
		},
	after={\vspace{10pt plus 1pt}\noindent},
	#1
}

\newtcolorbox{quotebox}[1][]{
    enhanced jigsaw,
    frame hidden,
    boxrule=0pt,
    breakable,
    enhanced,
    before skip=10pt plus 1pt,
    boxsep=0.25ex,
    left=8pt,
    right=8pt,
    colback=bgtan,
    colframe=bgtan,
    arc=0mm,
    parbox = false,
    borderline west={1pt}{-0.5pt}{titlered},
    borderline east={1pt}{-0.5pt}{titlered},
    overlay={
        \foreach \n in {north east,north west,south east,south west}
        {\draw [titlered, fill=titlered] (frame.\n) circle (2pt); }; },
    after={\vspace{7.5pt plus 1pt}\noindent},
    #1
}