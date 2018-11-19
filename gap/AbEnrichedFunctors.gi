#
# AbEnrichedFunctors: The category of Ab-enriched functors between Ab-enriched categories
#
# Implementations
#

##
# TODO cache
AbEnrichedFunctors := FunctionWithCache( function ( C, D )
    local AbEnrichedFunctors;
    
    AbEnrichedFunctors := CreateCapCategory( Concatenation( "Category of Ab-enriched functors between \"", Name( C ), "\" and \"", Name( D ), "\"" ) );
    
    DisableAddForCategoricalOperations( AbEnrichedFunctors );
    
    AddObjectRepresentation( AbEnrichedFunctors, IsObjectInAbEnrichedFunctors );
    
    AddMorphismRepresentation( AbEnrichedFunctors, IsMorphismInAbEnrichedFunctors );
    
    ##
    if HasIsAbelianCategory( C ) and IsAbelianCategory( C ) and HasIsAbelianCategory( D ) and IsAbelianCategory( D ) then
        AddCokernelObject( AbEnrichedFunctors,
          function ( beta )
            local F, G, cokernel_object;
            
            F := Source( beta );
            G := Range( beta );

            cokernel_object := CapFunctor( Concatenation( "A cokernel in the category ", Name( AbEnrichedFunctors ) ), SourceCapCategory( F ), RangeCapCategory( F ) );

            AddObjectFunction( cokernel_object,
                function ( X )
                    return CokernelObject( MyApplyNaturalTransformation( beta, X ) );
            end );
            
            AddMorphismFunction( cokernel_object,
                function ( obj1, alpha, obj2 )
                    local A, B;
                    # TODO: this might be wrong
                    # TODO: stabil?
                    A := Source( alpha );
                    B := Range( alpha );
                    return CokernelObjectFunctorialWithGivenCokernelObjects( obj1, MyApplyNaturalTransformation( beta, obj1 ), MyApplyFunctor( G, alpha ), MyApplyNaturalTransformation( beta, obj2 ), obj2 );
            end );
            
            return AsObjectInAbEnrichedFunctors( cokernel_object );
            
        end );

        ##
        AddCokernelProjectionWithGivenCokernelObject( AbEnrichedFunctors,
          function ( beta, cokernel_object )
            local F, G, beta_trafo, cokernel_projection;
            
            F := Source( beta );
            G := Range( beta );

            cokernel_projection := NaturalTransformation( G, cokernel_object );
            AddNaturalTransformationFunction( cokernel_projection,
                function ( S, X, T )
                    return CokernelProjection( MyApplyNaturalTransformation( beta, X ) );
            end );
            
            return AsMorphismInAbEnrichedFunctors( cokernel_projection );
            
        end );
    fi;

    Finalize( AbEnrichedFunctors );

    return AbEnrichedFunctors;
end );

##
InstallMethod( AsObjectInAbEnrichedFunctors,
        "TODO",
        [ IsCapFunctor ],
        
  function ( F )
    local source_category, range_category, cat, object;
    
    source_category := AsCapCategory( Source( F ) );
    range_category := AsCapCategory( Range( F ) );
    
    cat := AbEnrichedFunctors( source_category, range_category );
    
    object := rec( );
    ObjectifyObjectForCAPWithAttributes( object, cat,
            AsCapFunctor, F,
            SourceCapCategory, source_category,
            RangeCapCategory, range_category
    );
    
    return object;
    
end );

##
InstallMethod( AsMorphismInAbEnrichedFunctors,
        "TODO",
        [ IsCapNaturalTransformation ],
        
  function ( natural_transformation )
    local F, G, source_category, range_category, cat, morphism;

    F := Source( natural_transformation );
    G := Range( natural_transformation );

    if not IsIdenticalObj( Source( F ), Source( G ) ) or not IsIdenticalObj( Range( F ), Range( G ) ) then
        Error( "given functors are not parallel" );
    fi;
    
    source_category := AsCapCategory( Source( F ) );
    range_category := AsCapCategory( Range( F ) );

    cat := AbEnrichedFunctors( source_category, range_category );
    
    morphism := rec( );
    ObjectifyMorphismForCAPWithAttributes( morphism, cat,
        AsCapNaturalTransformation, natural_transformation,
        Source, AsObjectInAbEnrichedFunctors( F ),
        Range, AsObjectInAbEnrichedFunctors( G )
    );
    
    return morphism;
    
end );

## convenience
InstallGlobalFunction( MyApplyFunctor, function ( F, A )
    if IsObjectInAbEnrichedFunctors( F ) then
        return ApplyFunctor( AsCapFunctor( F ), A );
    else
        return ApplyFunctor( F, A );
    fi;
end );

InstallGlobalFunction( MyApplyNaturalTransformation, function ( N, A )
    if IsMorphismInAbEnrichedFunctors( N ) then
        return ApplyNaturalTransformation( AsCapNaturalTransformation( N ), A );
    else
        return ApplyNaturalTransformation( N, A );
    fi;
end );

InstallMethod( NaturalTransformation,
        "TODO",
        [ IsObjectInAbEnrichedFunctors, IsObjectInAbEnrichedFunctors ],
        
  function ( F, G )
    
    return NaturalTransformation( AsCapFunctor( F ), AsCapFunctor( G ) );
    
end );
