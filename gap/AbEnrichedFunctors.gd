#
# AbEnrichedFunctors: The category of Ab-enriched functors between Ab-enriched categories
#
# Declarations
#

DeclareCategory( "IsObjectInAbEnrichedFunctors",
                 IsCapCategoryObject );

DeclareCategory( "IsMorphismInAbEnrichedFunctors",
                 IsCapCategoryMorphism );

DeclareAttribute( "AsCapFunctor",
        IsObjectInAbEnrichedFunctors );
DeclareAttribute( "SourceCapCategory",
        IsObjectInAbEnrichedFunctors );
DeclareAttribute( "RangeCapCategory",
        IsObjectInAbEnrichedFunctors );

DeclareAttribute( "AsCapNaturalTransformation",
        IsMorphismInAbEnrichedFunctors );

DeclareAttribute( "AsObjectInAbEnrichedFunctors",
        IsCapFunctor );

DeclareAttribute( "AsMorphismInAbEnrichedFunctors",
        IsCapNaturalTransformation );

# convenience
DeclareGlobalFunction( "MyApplyFunctor" );
DeclareGlobalFunction( "MyApplyNaturalTransformation" );
DeclareOperation( "NaturalTransformation",
        [ IsObjectInAbEnrichedFunctors, IsObjectInAbEnrichedFunctors ] );
