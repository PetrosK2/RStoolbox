// This file was generated by Rcpp::compileAttributes
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// entropyCpp
NumericVector entropyCpp(NumericMatrix& x);
RcppExport SEXP RStoolbox_entropyCpp(SEXP xSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< NumericMatrix& >::type x(xSEXP);
    __result = Rcpp::wrap(entropyCpp(x));
    return __result;
END_RCPP
}
// gainOffsetRescale
NumericMatrix gainOffsetRescale(NumericMatrix x, NumericVector g, NumericVector o);
RcppExport SEXP RStoolbox_gainOffsetRescale(SEXP xSEXP, SEXP gSEXP, SEXP oSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< NumericMatrix >::type x(xSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type g(gSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type o(oSEXP);
    __result = Rcpp::wrap(gainOffsetRescale(x, g, o));
    return __result;
END_RCPP
}
// normImageCpp
NumericMatrix normImageCpp(NumericMatrix& x, NumericVector& M, NumericVector& S);
RcppExport SEXP RStoolbox_normImageCpp(SEXP xSEXP, SEXP MSEXP, SEXP SSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< NumericMatrix& >::type x(xSEXP);
    Rcpp::traits::input_parameter< NumericVector& >::type M(MSEXP);
    Rcpp::traits::input_parameter< NumericVector& >::type S(SSEXP);
    __result = Rcpp::wrap(normImageCpp(x, M, S));
    return __result;
END_RCPP
}
// specSimC
NumericMatrix specSimC(NumericMatrix& x, NumericMatrix& em);
RcppExport SEXP RStoolbox_specSimC(SEXP xSEXP, SEXP emSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< NumericMatrix& >::type x(xSEXP);
    Rcpp::traits::input_parameter< NumericMatrix& >::type em(emSEXP);
    __result = Rcpp::wrap(specSimC(x, em));
    return __result;
END_RCPP
}
// spectralIndicesCpp
NumericMatrix spectralIndicesCpp(NumericMatrix& x, CharacterVector& indices, const int redBand, const int blueBand, const int greenBand, const int nirBand, const int mirBand, const int swirBand, const double L, const double s, const double G, const double C1, const double C2, const double Levi);
RcppExport SEXP RStoolbox_spectralIndicesCpp(SEXP xSEXP, SEXP indicesSEXP, SEXP redBandSEXP, SEXP blueBandSEXP, SEXP greenBandSEXP, SEXP nirBandSEXP, SEXP mirBandSEXP, SEXP swirBandSEXP, SEXP LSEXP, SEXP sSEXP, SEXP GSEXP, SEXP C1SEXP, SEXP C2SEXP, SEXP LeviSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< NumericMatrix& >::type x(xSEXP);
    Rcpp::traits::input_parameter< CharacterVector& >::type indices(indicesSEXP);
    Rcpp::traits::input_parameter< const int >::type redBand(redBandSEXP);
    Rcpp::traits::input_parameter< const int >::type blueBand(blueBandSEXP);
    Rcpp::traits::input_parameter< const int >::type greenBand(greenBandSEXP);
    Rcpp::traits::input_parameter< const int >::type nirBand(nirBandSEXP);
    Rcpp::traits::input_parameter< const int >::type mirBand(mirBandSEXP);
    Rcpp::traits::input_parameter< const int >::type swirBand(swirBandSEXP);
    Rcpp::traits::input_parameter< const double >::type L(LSEXP);
    Rcpp::traits::input_parameter< const double >::type s(sSEXP);
    Rcpp::traits::input_parameter< const double >::type G(GSEXP);
    Rcpp::traits::input_parameter< const double >::type C1(C1SEXP);
    Rcpp::traits::input_parameter< const double >::type C2(C2SEXP);
    Rcpp::traits::input_parameter< const double >::type Levi(LeviSEXP);
    __result = Rcpp::wrap(spectralIndicesCpp(x, indices, redBand, blueBand, greenBand, nirBand, mirBand, swirBand, L, s, G, C1, C2, Levi));
    return __result;
END_RCPP
}
// whichColMinC
IntegerVector whichColMinC(NumericMatrix x, NumericMatrix centers);
RcppExport SEXP RStoolbox_whichColMinC(SEXP xSEXP, SEXP centersSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< NumericMatrix >::type x(xSEXP);
    Rcpp::traits::input_parameter< NumericMatrix >::type centers(centersSEXP);
    __result = Rcpp::wrap(whichColMinC(x, centers));
    return __result;
END_RCPP
}