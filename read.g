#
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets
#
# Reading the implementation part of the package.
#

ReadPackage( "ZariskiFrames", "gap/ZariskiFrameOrCoframe.gi");
ReadPackage( "ZariskiFrames", "gap/ZariskiFrame.gi");
ReadPackage( "ZariskiFrames", "gap/ZariskiCoframe.gi");
ReadPackage( "ZariskiFrames", "gap/Affine.gi");
ReadPackage( "ZariskiFrames", "gap/AffineOpen.gi");
ReadPackage( "ZariskiFrames", "gap/AffineClosed.gi");
ReadPackage( "ZariskiFrames", "gap/RelativeAffineVarieties.gi");
ReadPackage( "ZariskiFrames", "gap/Projective.gi");
ReadPackage( "ZariskiFrames", "gap/ProjectiveOpen.gi");
ReadPackage( "ZariskiFrames", "gap/ProjectiveClosed.gi");
ReadPackage( "ZariskiFrames", "gap/RelativeProjectiveVarieties.gi");
ReadPackage( "ZariskiFrames", "gap/ConstructibleImage.gi");
ReadPackage( "ZariskiFrames", "gap/MapleTools.gi");

if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) then
    ReadPackage( "ZariskiFrames", "gap/Julia.gi");
fi;
