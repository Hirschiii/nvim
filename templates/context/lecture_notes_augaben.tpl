;; context
\setvariables[meta]
  [title={},
   subtitle={Abitur 2026},
   date={},
   author={Niklas von Hirschfeld, und Ihc},
  ]
\setupinteraction[title={\getvariable{meta}{title}}]

\starttext

\startfrontmatter
\component c_titlepage
\component c_toc
\stopfrontmatter

\setuppagenumber[number=1]

\startbodymatter
\stopbodymatter

\startbackmatter
\component c_definitions
% \component c_bibliography
\stopbackmatter

\stoptext
