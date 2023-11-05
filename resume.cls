\ProvidesClass{resume}
\LoadClass[10pt,letterpaper]{article} % Font size and paper type
\nofiles                            % .aux files are not needed for resumes
\pagestyle{empty}
\RequirePackage{fontawesome}
\RequirePackage[parfill]{parskip} % Remove paragraph indentation
\RequirePackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\RequirePackage{ifthen} % Required for ifthenelse statements
\RequirePackage[left=0.5in,top=0.6in,right=0.5in,bottom=0.6in]{geometry} % Document margins
\RequirePackage[utf8]{inputenc}
\RequirePackage[russian]{babel}

\usepackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=black,
    filecolor=black,
    urlcolor=black,
}

\pagestyle{empty} % Suppress page numbers

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}}        % \name command can be used to set name
\def \@name {}                      % Set \@name to empty by default

\def \addressSep {$\mid$} % Set default address separator

% One, two or three address lines can be specified
\let \@addressone \relax
\let \@addresstwo \relax

% \address command can be used to set the first, second, and third address (last 2 optional)
\def \address #1{
    \@ifundefined{@addresstwo}{
        \def \@addresstwo {#1}
    }{
        \def \@addressone {#1}
    }
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
    \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
    \endgroup
    \par
    \addressskip
}

% \printname is used to print the name as a page header
\def \printname {
    \begingroup
    \centerline{\namesize\textbf\@name}
    \endgroup
    \nameskip
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------


\AtBeginDocument{
    \printname % Print the name specified with \name
    \@ifundefined{@addressone}{}{ % Print the first address if specified
        \printaddress{\@addressone}}
    \@ifundefined{@addresstwo}{}{ % Print the second address if specified
        \printaddress{\@addresstwo}}
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1]{ % 1 input argument - section name
    \sectionskip
    \MakeUppercase{#1} % Section title
    \sectionlineskip
    \hrule % Horizontal line
    \begin{list}{}{ % List for each individual item in the section
        \setlength{\leftmargin}{0em} % Margin within the section
    }
        \item[]
        }{
    \end{list}
}

%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSubsection}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
    \textbf{#1} \hfill {#2} % Bold company name and date on the right
    \ifthenelse{\equal{#3 #4}{}}{}{ % If the third argument is not specified, don't print the job title and location line
        \\
        {\em #3} \hfill {\em #4} % Italic job title and location
    }\smallskip
    \begin{list}{$\cdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
        \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
        }{
    \end{list}
    \vspace{0em} % Some space after the list of bullet points
}

% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\LARGE} % Size of the name at the top of the document
\def\addressskip{\smallskip} % The space between the two address (or phone/email) lines
\def\sectionlineskip{\smallskip} % The space above the horizontal line for each section
\def\nameskip{\medskip} % The space after your name at the top
\def\sectionskip{\medskip} % The space after the heading section
