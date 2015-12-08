/*
# fast rle handling for bit and ff
# (c) 2007-2009 Jens Oehlschägel
# Licence: GPL2
# Provided 'as is', use at your own risk
# Created: 2007-08-24
# Last changed: 2007-11-29
*/

#include <R.h>
#include <Rinternals.h>

SEXP first_zero(SEXP x)
{
  int i;
  int n = LENGTH(x);
  int *p = INTEGER(x);
  SEXP ret_;
  PROTECT( ret_ = allocVector(INTSXP, 1) );
  INTEGER(ret_)[0] = 0;
  if (n){
    for (i=0;i<n;i++){
      if (p[i]==0){
        INTEGER(ret_)[0] = i + 1;
        break;
      }
    }
  }
  UNPROTECT(1);
  return ret_;
}


/* check for NA and not sorted ascending
   stop on finding NA but not on finding unsorted
   (guarantee any NA is found)
   return 0 (OK) 1 (unsorted) 2 (has NA)
*/
SEXP int_check_ascending(SEXP x)
{
  Rboolean status=TRUE;
  int i;
  int n = LENGTH(x);
  int *p = INTEGER(x);
  SEXP ret_;
  PROTECT( ret_ = allocVector(LGLSXP, 1) );

  if (n){
    if (p[0]==NA_INTEGER){
      status=NA_LOGICAL;
    }else{
      for (i=1;i<n;i++){
        if (p[i]==NA_INTEGER){
          status = NA_LOGICAL;
          break;
        }else if (p[i]<p[i-1]){
          status = FALSE;
        }
      }
    }
  }

  INTEGER(ret_)[0] = status;
  UNPROTECT(1);
  return ret_;
}

/* check for not sorted descending
   stop on finding unsorted
   (assume check for NAs has already be done successfully: no NAs)
   return 0 (OK) 1 (unsorted)
*/
SEXP int_check_descending(SEXP x)
{
  Rboolean status=TRUE;
  int i;
  int n = LENGTH(x);
  int *p = INTEGER(x);
  SEXP ret_;
  PROTECT( ret_ = allocVector(LGLSXP, 1) );

  if (n){
    for (i=1;i<n;i++){
      if (p[i]>p[i-1]){
        status = FALSE;
        break;
      }
    }
  }

  INTEGER(ret_)[0] = status;
  UNPROTECT(1);
  return ret_;
}



/* create integer rle
   NOTE if rle is not efficient we return NULL instead of an rle object
*/
SEXP int_rle(SEXP x_)
{
  register int lv,ln,i,c=0;
  int n2, n = LENGTH(x_);
  if (n<3)
    return R_NilValue;
  n2 = n / 3; /* xx max RAM requirement 2x, but rle only if at least 2/3 savings, using 2 instead of 3 would need 50% more time, have max RAM requirement 2.5x for savings of any size */

  int *x = INTEGER(x_);
  int *val, *len, *values, *lengths;
  SEXP ret_, lengths_, values_, names_, class_;

  val = Calloc(n2, int);
  len = Calloc(n2, int);
  if (n){
    lv = x[0];
    ln = 1;
    for (i=1;i<n;i++){
      if (x[i]==lv){
        ln++;
      }else{
        val[c] = lv;
        len[c] = ln;
        c++;
        if (c==n2){
          Free(val);
          Free(len);
          return R_NilValue;
        }
        lv = x[i];
        ln = 1;
      }
    }
    val[c] = lv;
    len[c] = ln;
    c++;
  }
  PROTECT( values_ = allocVector(INTSXP, c) );
  values = INTEGER(values_);
  for (i=0;i<c;i++)
    values[i] = val[i];
  Free(val);
  PROTECT( lengths_ = allocVector(INTSXP, c) );
  lengths = INTEGER(lengths_);
  for (i=0;i<c;i++)
    lengths[i] = len[i];
  Free(len);

  PROTECT( ret_ = allocVector(VECSXP, 2) );
  PROTECT( names_ = allocVector(STRSXP, 2));
  PROTECT( class_ = allocVector(STRSXP, 1));

  SET_STRING_ELT(names_, 0, mkChar("lengths"));
  SET_STRING_ELT(names_, 1, mkChar("values"));
  SET_STRING_ELT(class_, 0, mkChar("rle"));
  SET_VECTOR_ELT(ret_, 0, lengths_);
  SET_VECTOR_ELT(ret_, 1, values_);
  setAttrib(ret_, R_NamesSymbol, names_);
  classgets(ret_, class_);

  UNPROTECT(5);
  return ret_;
}


