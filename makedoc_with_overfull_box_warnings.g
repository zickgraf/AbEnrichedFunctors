#
# AbEnrichedFunctors: The category of Ab-enriched functors between Ab-enriched categories
#
# This file is a script which compiles the package manual.
#
if fail = LoadPackage("AutoDoc", "2018.09.20") then
    Error("AutoDoc version 2018.09.20 or newer is required.");
fi;

AutoDoc(
        rec(
            scaffold := rec( gapdoc_latex_options := rec(
                             LateExtraPreamble := "\\usepackage{amsmath}\\usepackage[T1]{fontenc}\n\\RecustomVerbatimEnvironment{Verbatim}{BVerbatim}{}"
                                                        ),
                             entities := [ "GAP4", "CAP" ],
                             ),

            autodoc := rec( files := [ "doc/Doc.autodoc" ] ),

            maketest := rec( folder := ".",
                             commands :=
                             [ "LoadPackage( \"AbEnrichedFunctors\" );",
                             ],
                           ),
            )
);

QUIT;
