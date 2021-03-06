#
# ZariskiFrames: Frames of Zariski open subsets
#
# Implementations
#

##
InstallGlobalFunction( IsHomSetInhabitedForFramesUsingCategoryOfRows,
  function( S, T )
    
    if HasDimensionOfComplement( S ) and HasDimensionOfComplement( T ) and
       DimensionOfComplement( S ) < DimensionOfComplement( T ) then
        return false;
    fi;
    
    S := MorphismOfUnderlyingCategory( S );
    T := MorphismOfUnderlyingCategory( T );
    
    return IsLiftable( S, T );
    
end );

##
InstallGlobalFunction( IsEqualForObjectsIfIsHomSetInhabitedForFramesUsingCategoryOfRows,
  function( S, T )
    
    S := UnderlyingMatrix( MorphismOfUnderlyingCategory( S ) );
    T := UnderlyingMatrix( MorphismOfUnderlyingCategory( T ) );
    
    return HilbertPoincareSeries( S ) = HilbertPoincareSeries( T );
    
end );

##
InstallMethod( ComplementAsClosedSubset,
        "for an object in a Zariski frame",
        [ IsObjectInZariskiFrame ],
        
  function( A )
    local C;
    
    C := CapCategory( A )!.ZariskiCoframe;
    
    if HasStandardMorphismOfUnderlyingCategory( A ) then
        A := StandardMorphismOfUnderlyingCategory( A );
        return C!.ConstructorByStandardMorphism( A );
    elif HasReducedMorphismOfUnderlyingCategory( A ) then
        A := ReducedMorphismOfUnderlyingCategory( A );
        return C!.ConstructorByReducedMorphism( A );
    elif HasListOfMorphismsOfRank1RangeOfUnderlyingCategory( A ) then
        A := ListOfMorphismsOfRank1RangeOfUnderlyingCategory( A );
        return C!.ConstructorByListOfMorphismsOfRank1Range( A );
    elif HasListOfReducedMorphismsOfUnderlyingCategory( A ) then
        A := ListOfReducedMorphismsOfUnderlyingCategory( A );
        return C!.ConstructorByListOfMorphismsOfRank1Range( A );
    else
        A := PreMorphismOfUnderlyingCategory( A );
    fi;
    
    return C!.Constructor( A );
    
end );

##
InstallMethod( Closure,
        "for an object in a meet-semilattice of formal single differences",
        [ IsObjectInMeetSemilatticeOfSingleDifferences ],
        
  function( A )
    local H;
    
    H := CapCategory( A )!.UnderlyingCategory;
    
    if HasIsCartesianClosedCategory( H ) and IsCartesianClosedCategory( H ) then
        return ComplementAsClosedSubset( NormalizedPairInUnderlyingHeytingOrCoHeytingAlgebra( A )[2] );
    fi;
    
    TryNextMethod( );
    
end );

##
InstallMethod( AsDifferenceOfClosed,
        "for an object in a Zariski frame",
        [ IsObjectInZariskiFrame ],
        
  function( A )
    
    return -ComplementAsClosedSubset( A );
    
end );

##
InstallMethod( \-,
        "for two objects in a Zariski frame",
        [ IsObjectInZariskiFrame, IsObjectInZariskiFrame ],
        
  function( A, B )
    
    return ComplementAsClosedSubset( B ) - ComplementAsClosedSubset( A );
    
end );

##
InstallMethod( \-,
        "for an object in a Zariski frame and an object in a Zariski coframe",
        [ IsObjectInZariskiFrame, IsObjectInZariskiCoframe ],
        
  function( A, B )
    
    return AsDifferenceOfClosed( A ) - B;
    
end );

##
InstallMethod( Closure,
        "for an object in a Zariski frame",
        [ IsObjectInZariskiFrame ],
        
  function( A )
    
    return Closure( AsDifferenceOfClosed( A ) );
    
end );

##
InstallMethod( LocallyClosedPart,
        "for an object in a Zariski frame",
        [ IsObjectInZariskiFrame ],
        
  function( A )
    
    A := AsDifferenceOfClosed( A );
    
    return LocallyClosedPart( A );
    
end );

##
InstallMethod( DistinguishedLocallyClosedPart,
        "for an object in a Zariski frame",
        [ IsObjectInZariskiFrame ],
        
  function( A )
    
    A := LocallyClosedPart( A );
    
    if IsObjectInZariskiCoframe( A ) then
        return A;
    fi;
    
    return DistinguishedLocallyClosedPart( A );
    
end );

##
InstallMethod( ViewString,
        "for an object in a Zariski frame",
        [ IsObjectInZariskiFrame ],

  function( A )
    local I, n, j, i;
    
    I := ValueOption( "Locales_name" );
    
    if I = fail then
        I := "<...>";
    fi;
    
    n := ValueOption( "Locales_number" );
    
    if n = fail then
        n := "";
    fi;
    
    j := ValueOption( "Locales_counter" );
    
    if j = fail then
        j := "";
    else
        j := Concatenation( "_", String( j ) );
    fi;
    
    i := ValueOption( "component_counter" );
    
    if i = fail then
        i := "";
    else
        if I = "<...>" then
            I := "K";
        fi;
        i := Concatenation( "_", String( i ) );
    fi;
    
    return Concatenation( "D_{", RingName( UnderlyingRing( A ) ), "}( ", I, String( n ), j, i, " )" );
    
end );

##
InstallMethod( String,
        "for an object in a Zariski frame",
        [ IsObjectInZariskiFrame ],
        
  ViewString );

##
InstallMethod( DisplayString,
        "for an object in a Zariski frame",
        [ IsObjectInZariskiFrame ],

  function( A )
    local L, str, l, C;
    
    L := ListOfMorphismsOfRank1RangeOfUnderlyingCategory( A );
    
    str := "";
    
    l := Length( L );
    
    if l > 1 then
        Append( str, "{ " );
    fi;
    
    Append( str, "D( <" );
    Append( str, JoinStringsWithSeparator( List( EntriesOfHomalgMatrix( UnderlyingMatrix( L[1] ) ), String ) ) );
    Append( str, "> )" );
    
    for C in L{[ 2 .. l ]} do
        Append( str, " ∩ " );
        Append( str, "D( <" );
        Append( str, JoinStringsWithSeparator( List( EntriesOfHomalgMatrix( UnderlyingMatrix( C ) ), String ) ) );
        Append( str, "> )" );
    od;
    
    if l > 1 then
        Append( str, " }" );
    fi;
    
    return str;
    
end );
