import 'dart:core';

import 'package:js/js.dart';
import 'package:js/js_util.dart';

import 'package:daterangepicker/daterangepicker.dart';
import 'package:resources_loader/resources_loader.dart';


main() {

  ResourcesLoaderService resourcesLoader = new ResourcesLoaderService();

  var options = new DateRangePickerOptions()
  ..startDate = '01/21/2017';

  new DateRangePicker(resourcesLoader, "#daterangepicker", options);
}