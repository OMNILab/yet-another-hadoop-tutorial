%==================================================
%% hpcmanual.cls for manual documentation in HPC center of SJTU
%% Encoding: UTF-8
%% ==================================================

% Production of a PDF requires that a LaTeX engine be installed (see --latex-engine, below), and assumes that the following LaTeX packages are available: amssymb, amsmath, ifxetex, ifluatex, listings (if the --listings option is used), fancyvrb, longtable, url, graphicx, hyperref, ulem, xltxtra and xunicode (if xelatex is used).
% Check pandoc -D latex for more advice

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{hpcmanual.cls}[2013/07/06 v0.1 hpcmanual document class]
\newif\ifhpc@typeinfo \hpc@typeinfotrue
\DeclareOption{notypeinfo}{\hpc@typeinfofalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions
\LoadClass[fancyhdr,fntef,UTF8,cs4size,adobefonts]{ctexart}[2005/11/25]

%% Import hpcmanual.cfg file
\AtEndOfPackage{\makeatletter\input{hpcmanual.cfg}\makeatother}

%% XeTeX Fonts Specification
\RequirePackage{fontspec}
\setmainfont{TeX Gyre Termes}

%% xcolor
\RequirePackage[dvipsnames]{xcolor}

%% Page Layout
\oddsidemargin 1.5 true cm
\if@twoside
  \evensidemargin 0 true cm
\else
  \evensidemargin 1.5 true cm
\fi
\textheight 21 true cm
\textwidth 14.5 true cm
\headheight 15pt
\parskip 0.5ex plus 0.25ex minus 0.25ex
\addtolength{\voffset}{-0.5cm}

%% Hyperref
\RequirePackage[setpagesize=false, % page size defined by xetex
            unicode=false, % unicode breaks when used with xetex
            xetex]{hyperref}
\hypersetup{breaklinks=true,
            bookmarks=true,
            % pdfauthor={$author-meta$},
            % pdftitle={$title-meta$},
            colorlinks=true,
            % urlcolor=$if(urlcolor)$$urlcolor$$else$blue$endif$,
            % linkcolor=$if(linkcolor)$$linkcolor$$else$magenta$endif$,
            pdfborder={0 0 0}}
\urlstyle{same}  % don't use monospace font for urls

%% Listings
\RequirePackage{listings}
\lstset{tabsize=4, %
  frame=shadowbox, %把代码用带有阴影的框圈起来
  commentstyle=\color{lightgray},%浅灰色的注释
  rulesepcolor=\color{cyan},%代码块边框为淡青色
  keywordstyle=\color{blue}\bfseries, %代码关键字的颜色为蓝色，粗体
  showstringspaces=false,%不显示代码字符串中间的空格标记
  showspaces=false, %
  stringstyle=\ttfamily, % 代码字符串的特殊格式
  keepspaces=true, %
  % numbers=left,%左侧显示行号
  % stepnumber=1,%
  % numberstyle=\tiny, %行号字体用小号
  basicstyle=\footnotesize\ttfamily, %
  flexiblecolumns=true, %
  % breaklines=true, %对过长的代码自动换行
  breakautoindent=true,%
  breakindent=4em, %
  aboveskip=1em, %代码块边框
  fontadjust,
  captionpos=t,
  framextopmargin=2pt,framexbottommargin=2pt,abovecaptionskip=-3pt,belowcaptionskip=3pt,
  xleftmargin=2em,xrightmargin=2em, % 设定listing左右的空白
  texcl=true,
  % 设定中文冲突，断行，列模式，数学环境输入，listing数字的样式
  extendedchars=false,columns=flexible,mathescape=false
}

%% Longtable
\RequirePackage{longtable}

%% Graphpath
\graphicspath{{figure/}{figures/}{logo/}{logos/}{graph/}{graphs}} 

%% End of file hpcmanual.cls
\endinput
