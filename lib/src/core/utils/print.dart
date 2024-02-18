void printWarning(Object? object) {
  print('\x1B[33m$object\x1B[0m');
}

void printError(Object? object) {
  print('\x1B[31m$object\x1B[0m');
}