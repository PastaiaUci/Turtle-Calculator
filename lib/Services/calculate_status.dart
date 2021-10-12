import 'dart:math';

const factors = {
  'min': {
    'mult': 0.3625,
    'exp': 5.425,
  },
  'max': {
    'mult': 0.3354,
    'exp': 8.976,
  },
  'avg': {
    'mult': 0.3424,
    'exp': 7.315,
  }
};

double factorize(l,mult,exp){
// min = 18.31 max = 21.44 avg  = 20.22
  return exp*(pow(l, mult));
}

List<double> computeFactors(length){

  double min = factorize(length, factors['min']['mult'], factors['min']['exp']);
  double max = factorize(length, factors['max']['mult'], factors['max']['exp']);
  double avg = factorize(length, factors['avg']['mult'], factors['avg']['exp']);

  return  [min, max, avg];
}

int testos(length, weight) {
  List<double> values =  computeFactors(length);
  if (weight <= values[0])
    return 0;
  if (weight <= values[1])
    return 1;
   return 2;
}