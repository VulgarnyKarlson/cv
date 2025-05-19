\ProvidesClass{resume}
\LoadClass[12pt,letterpaper]{article}
\pagestyle{empty}
\RequirePackage{fontawesome}
\RequirePackage[parfill]{parskip}
\RequirePackage{array}
\RequirePackage{ifthen}
\RequirePackage[left=0.8in,top=0.6in,right=0.8in,bottom=0.6in]{geometry}
\RequirePackage[utf8]{inputenc}
\RequirePackage[russian]{babel}
\usepackage{hyperref}

\hypersetup{
    colorlinks=true,
    linkcolor=black,
    filecolor=black,
    urlcolor=black,
}

\def \name#1{\def\@name{#1}}
\def \headline#1{\def\@headline{#1}}
\def \addressSep {$\mid$}
\let \@addressone \relax
\def \address #1{\def \@addressone {#1}}
\def \printaddress #1{\begingroup\def \\ {\addressSep\ }{#1}\endgroup}
\def \printname {\begingroup{\namesize\textbf\@name}\endgroup\nameskip}
\def \printheadline {\begingroup{\headlinesize\textbf\@headline}\endgroup\headlineskip}

\AtBeginDocument{
    \printname \\
    \hspace{2pt}\printaddress{\@addressone}
}

\newenvironment{rSection}[1]{ % 1 input argument - section name
    \sectionskip
    \MakeUppercase{#1} % Section title
    \sectionlineskip
    \hrule % Horizontal line
    \begin{list}{}{ % List for each individual item in the section
        \setlength{\leftmargin}{0em} % Margin within the section
        \setlength{\itemindent}{0em} % Убирает отступ у элементов списка
        \setlength{\listparindent}{0em} % Убирает отступ у абзацев внутри списка
        \setlength{\itemsep}{-0.2em} % Устанавливает расстояние между элементами списка
         % Устанавливает расстояние между абзацами внутри элементов списка
    }
        \item[]
        }{
    \end{list}
}

\def\namesize{\LARGE}
\def\headlinesize{\MEDIUM}
\def\addressskip{\smallskip}
\def\sectionlineskip{\smallskip}
\def\nameskip{\smallskip}
\def\headlineskip{\smallskip}
\def\sectionskip{\smallskip}
