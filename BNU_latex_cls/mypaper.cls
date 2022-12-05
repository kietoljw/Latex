\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{mypaper}[2022/10/30 My Paper class] 

%\LoadClass[a4paper,zihao=-4]{ctexart}
\LoadClass[a4paper,zihao=5,fontset=none]{ctexart}

%定义标题====================================================
\RequirePackage{titlesec}
\RequirePackage{xeCJK}
\RequirePackage{fontspec}
\RequirePackage{setspace}
\RequirePackage{geometry}
\RequirePackage{cite}
\RequirePackage{cleveref}
\RequirePackage{fancyhdr}%设置页眉页脚
\RequirePackage{enumerate}%item编号格式宏包
%\RequirePackage{fanc}

%设置上标引用
\newcommand{\citeu}[1]{\textsuperscript{\cite{#1}}}

%调整页边距
\geometry{left=3.1cm,right=3.1cm,top=2.5cm,bottom=2.5cm}%自由设置页边距
%调整行间距
\setstretch{1.5}

%定义外部字体
\let\songti\relax
\let\kaishu\relax
\let\heiti\relax
\let\fangsong\relax


\setCJKfamilyfont{fangsong}{simfang.ttf}[
Path = fonts/
]
\setCJKfamilyfont{kaiti}{simkai.ttf}[
Path = fonts/
]
\setCJKfamilyfont{heiti}{simhei.ttf}[
Path = fonts/,
BoldFont = simheibd.ttf,
]
\setCJKfamilyfont{songti}{simsun.ttc}[
Path = fonts/,
BoldFont = simsunbd.ttf,
] %汉仪雪君体简体


\newcommand{\fangsong}{\CJKfamily{fangsong}}
\newcommand{\songti}{\CJKfamily{songti}}
\newcommand{\heiti}{\CJKfamily{heiti}}
\newcommand{\kaiti}{\CJKfamily{kaiti}}


%设置正文字体
\setCJKmainfont[
Path = fonts/,
BoldFont = simsunbd.ttf,
]{simsun.ttc}
\setmainfont{Times New Roman}


%设置标题字体
\titleformat{\section}%定义标题类型和标题样式，字体
{\zihao{4}\fangsong\centering}%定义标题格式:字号（大小），加粗，斜体
{\chinese{section}、}%定义标题的标签，即标题的标号等
{0em}%定义标题和标号之间的水平距离
{} %定义标题前的内容
[] %定义标题后的内容

\titleformat{\subsection}%定义标题类型和标题样式，字体
{\zihao{-4}\heiti}%定义标题格式:字号（大小），加粗，斜体
{\qquad（\chinese{subsection}）}%定义标题的标签，即标题的标号等
{0em}%定义标题和标号之间的水平距离
{} %定义标题前的内容
[] %定义标题后的内容

\titleformat{\subsubsection}%定义标题类型和标题样式，字体
{\zihao{5}\songti}%定义标题格式:字号（大小），加粗，斜体
{\qquad\arabic{subsubsection}.}%定义标题的标签，即标题的标号等
{0em}%定义标题和标号之间的水平距离
{} %定义标题前的内容
[] %定义标题后的内容

\titleformat{\paragraph}%定义标题类型和标题样式，字体
{\zihao{5}\songti}%定义标题格式:字号（大小），加粗，斜体
{(\arabic{paragraph})}%定义标题的标签，即标题的标号等
{0em}%定义标题和标号之间的水平距离
{} %定义标题前的内容
[] %定义标题后的内容


%设置标题前后段落的垂直分隔
\titlespacing{\section}{0pt}{3ex plus .0ex minus .0ex}{3ex plus .0ex}
\titlespacing{\subsection}{0pt}{1ex plus .0ex minus .0ex}{1ex plus .0ex}
\titlespacing{\subsubsection}{0pt}{2ex plus .0ex minus .0ex}{0.3ex plus .0ex}





%\maketitle设置
\makeatletter % change default title style
\renewcommand*\maketitle{%
	\begin{center}% 居中标题
		{\zihao{2}\songti\@title \par} % 2号宋体
		\vskip 2em% %%%  标题下面只有1em的缩进或margin
		{\zihao{3}\kaiti\@author}%
		{\global\let\date\@empty}%
		\thispagestyle{empty} %  不设置页面样式
		\vskip 4em
	\end{center}%
	\setcounter{footnote}{0}%
}


%定义摘要和关键词环境
\newcommand*{\@abstractname}{内容提要}
\newcommand*{\@keywordname}{关键词}


\renewenvironment{abstract}{%
	\begin{center}%
		{\zihao{4}\heiti\@abstractname：\vspace{0em}}%
	\end{center}%
	\quotation}
{\if@twocolumn\else\endquotation\null\fi}
\renewenvironment{quotation}
{\zihao{5}\fangsong\list{}{\listparindent 2em%
		\itemindent \listparindent
		\rightmargin\z@
		\leftmargin\z@
		\parsep \z@ \@plus\p@}%
	\item\relax}
{\endlist}

\newcommand\keywords[1]{%
	\renewcommand{\keywords}{#1}
	\par
	\vskip1ex
	{\noindent\zihao{4}\heiti\@keywordname：}~{\zihao{5}\fangsong\keywords}
}

%定义参考文献环境
\renewenvironment{thebibliography}[1]
{{\;\raggedright\zihao{5}\heiti\refname}%
	\@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}\vspace{1em}%
	\list{\@biblabel{\@arabic\c@enumiv}}%
	{\settowidth\labelwidth{\@biblabel{#1}}%
		\leftmargin\labelwidth
		\advance\leftmargin\labelsep
		\@openbib@code
		\usecounter{enumiv}%
		\let\p@enumiv\@empty
		\renewcommand\theenumiv{\@arabic\c@enumiv}}%
	\sloppy
	\clubpenalty4000
	\@clubpenalty \clubpenalty
	\widowpenalty4000%
	\sfcode`\.\@m}
{\def\@noitemerr
	{\@latex@warning{Empty `thebibliography' environment}}%
	\endlist}

\makeatother
