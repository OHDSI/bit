#include <R.h>
#include <Rinternals.h>

void R_bit_set_attr(SEXP x, SEXP which, SEXP value)
{
  setAttrib(x, install(CHAR(STRING_ELT(which, 0))), value);  /* xx looking at R sources setAttrib would directly accept a string, however this is not documented */
}

