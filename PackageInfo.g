#
# AbEnrichedFunctors: The category of Ab-enriched functors between Ab-enriched categories
#
# This file contains package meta data. For additional information on
# the meaning and correct usage of these fields, please consult the
# manual of the "Example" package as well as the comments in its
# PackageInfo.g file.
#
SetPackageInfo( rec(

PackageName := "AbEnrichedFunctors",
Subtitle := "The category of Ab-enriched functors between Ab-enriched categories",
Version := Maximum( [
                   "2018.11.19", ## Fabian's version
                   ## this line prevents merge conflicts
                   ] ),

Date := ~.Version{[ 1 .. 10 ]},
Date := Concatenation( ~.Date{[ 9, 10 ]}, "/", ~.Date{[ 6, 7 ]}, "/", ~.Date{[ 1 .. 4 ]} ),

Persons := [
  rec(
    IsAuthor := true,
    IsMaintainer := true,
    FirstNames := "Fabian",
    LastName := "Zickgraf",
    WWWHome := "https://github.com/zickgraf/",
    Email := "fabian.zickgraf@uni-siegen.de",
    PostalAddress := Concatenation(
               "Walter-Flex-Str. 3\n",
               "57068 Siegen\n",
               "Germany" ),
    Place := "Siegen",
    Institution := "University of Siegen",
  ),
],

SourceRepository := rec(
    Type := "git",
    URL := "https://github.com/zickgraf/AbEnrichedFunctors",
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
PackageWWWHome  := "https://github.com/zickgraf/AbEnrichedFunctors/",
PackageInfoURL  := Concatenation( ~.PackageWWWHome, "blob/master/PackageInfo.g" ),
README_URL      := Concatenation( ~.PackageWWWHome, "blob/master/README.md" ),
ArchiveURL      := Concatenation( ~.SourceRepository.URL,
                                 "/releases/download/v", ~.Version,
                                 "/", ~.PackageName, "-", ~.Version ),

ArchiveFormats := ".tar.gz",

##  Status information. Currently the following cases are recognized:
##    "accepted"      for successfully refereed packages
##    "submitted"     for packages submitted for the refereeing
##    "deposited"     for packages for which the GAP developers agreed
##                    to distribute them with the core GAP system
##    "dev"           for development versions of packages
##    "other"         for all other packages
##
Status := "dev",

AbstractHTML   :=  "",

PackageDoc := rec(
  BookName  := "AbEnrichedFunctors",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "The category of Ab-enriched functors between Ab-enriched categories",
),

Dependencies := rec(
  GAP := ">= 4.10",
  NeededOtherPackages := [
                   [ "AutoDoc", ">= 2018.09.20" ],
                   [ "CAP", ">= 2018.10.16" ],
                   ],
  SuggestedOtherPackages := [ ],
  ExternalConditions := [ ],
),

AvailabilityTest := ReturnTrue,

));


