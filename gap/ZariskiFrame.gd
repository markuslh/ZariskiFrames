#
# ZariskiFrames: Frames of Zariski open subsets
#
# Declarations
#

#! @Chapter Frames of Zariski open subsets

#! @Section GAP Categories

#! @Description
#!  The &GAP; category of objects in a Zariski frame.
#! @Arguments object
DeclareCategory( "IsObjectInZariskiFrame",
        IsObjectInZariskiFrameOrCoframe );

#! @Description
#!  The &GAP; category of morphisms in a Zariski frame.
#! @Arguments morphism
DeclareCategory( "IsMorphismInZariskiFrame",
        IsMorphismInZariskiFrameOrCoframe );

#! @Section Attributes

#! @Description
#!  The dimension of the closed complement of <A>A</A>.
#! @Arguments A
#! @Returns an integer
DeclareAttribute( "DimensionOfComplement",
        IsObjectInZariskiFrame );


#! @Description
#!  The degree of the closed complement of <A>A</A>.
#! @Arguments A
#! @Returns an integer
DeclareAttribute( "DegreeOfComplement",
        IsObjectInZariskiFrame );

#!
DeclareAttribute( "ComplementAsClosedSubset",
        IsObjectInZariskiFrame );

#!
DeclareAttribute( "AsDifferenceOfClosed",
        IsObjectInZariskiFrame );

# Tools
DeclareGlobalFunction( "IsHomSetInhabitedForFramesUsingCategoryOfRows" );

DeclareGlobalFunction( "IsEqualForObjectsIfIsHomSetInhabitedForFramesUsingCategoryOfRows" );
