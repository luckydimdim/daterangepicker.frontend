import 'dart:core';
import 'package:angular2/core.dart';
import 'package:js/js_util.dart';
import 'package:daterangepicker/daterangepicker.dart';
import 'package:js/js.dart';

@Directive(selector: '[daterangepicker]')
class DateRangePickerDirective implements AfterViewInit {

  @Input('options')
  dynamic options = new DateRangePickerOptions();

  @Output()
  final selected  = new EventEmitter<Object>();

  ElementRef input;

  DateRangePickerDirective(this.input);

  @override
  void ngAfterViewInit() {
    new DateRangePicker(input.nativeElement, options, allowInterop(onChange));
  }

  onChange(dynamic start,dynamic end,unknown) {

    var result = new Map<String,DateTime>();

    result['start'] = getDateTime(start);
    result['end'] = getDateTime(end);

    selected.emit(result);
  }

  DateTime getDateTime(dynamic jsDate) {
    var month = callMethod(jsDate,'get',['month']);
    var year = callMethod(jsDate,'get',['year']);
    var date = callMethod(jsDate,'get',['date']);
    var hour = callMethod(jsDate,'get',['hour']);
    var minute = callMethod(jsDate,'get',['minute']);
    var second = callMethod(jsDate,'get',['second']);
    var millisecond = callMethod(jsDate,'get',['millisecond']);

    return new DateTime(year,month+1,date, hour,minute,second,millisecond);
  }

}