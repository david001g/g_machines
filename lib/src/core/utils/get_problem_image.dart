import 'package:flutter/material.dart';
import 'package:g_machines/src/core/constants/constants.dart';

Image getProblemImage(String problemType) {
  switch (problemType) {
    case 'FUEL':
      return Image.asset(ProblemTypeAssets.fuel, width: 40, height: 40);
    case 'WARNING':
      return Image.asset(ProblemTypeAssets.warning, width: 40, height: 40);
    case 'ERROR':
      return Image.asset(ProblemTypeAssets.error, width: 40, height: 40);
    case 'SERVICE':
      return Image.asset(ProblemTypeAssets.service, width: 40, height: 40);
    default:
      return Image.asset(ProblemTypeAssets.fuel, width: 40, height: 40);
  }
}
