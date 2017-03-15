%% settings

\usepackage{url}

% Chinese
\usepackage{xeCJK}

% inlucde image
\usepackage{graphicx}

% figure force location
% refer: http://tex.stackexchange.com/questions/8625/force-figure-placement-in-text
\usepackage{float}

% url and url wrap
% refer: http://tex.stackexchange.com/questions/3033/forcing-linebreaks-in-url
\PassOptionsToPackage{hyphens}{url}\usepackage{hyperref}

% image path
\graphicspath{{latex/assets/}}

% line space
\linespread{1.25}

% indent
\usepackage{indentfirst}
\setlength{\parindent}{2em}

% list item space
% refer: http://tex.stackexchange.com/questions/86054/how-to-remove-the-whitespace-before-itemize-enumerate
\usepackage{enumitem}
\setlist[enumerate]{nosep, noitemsep} % {noitemsep, topsep=0pt}
\setlist[itemize]{nosep, noitemsep}

% code
% inline code
\newcommand{\code}{\texttt}
% verbatim global font size
\makeatletter
\def\verbatim{\small\@verbatim \frenchspacing\@vobeyspaces \@xverbatim}
\makeatother

% bibliography
\bibliographystyle{plain}


% markdown to latex fix
% \tightlist error
\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}
