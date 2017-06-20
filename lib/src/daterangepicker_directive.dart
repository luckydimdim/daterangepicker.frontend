import 'dart:core';
import 'package:angular2/core.dart';
import 'package:js/js_util.dart';
import 'package:daterangepicker/daterangepicker.dart';
import 'package:js/js.dart';
import 'package:angular_utils/js_converter.dart';

@Directive(selector: '[daterangepicker]')
class DateRangePickerDirective implements AfterViewInit {
  @Input('options')
  dynamic options = new DateRangePickerOptions();

  @Output()
  final selected = new EventEmitter<Object>();

  ElementRef input;

  DateRangePickerDirective(this.input);

  @override
  void ngAfterViewInit() {
    new DateRangePicker(input.nativeElement, options, allowInterop(onChange));
  }

  onChange(dynamic start, dynamic end, unknown) {
    var result = new Map<String, DateTime>();

    result['start'] = JsConverter.getDateTime(start);
    result['end'] = JsConverter.getDateTime(end);

    selected.emit(result);
  }

  setStartDate(String date) {
    $(input.nativeElement).data('daterangepicker').setStartDate(date);
  }

  setEndDate(String date) {
    $(input.nativeElement).data('daterangepicker').setEndDate(date);
  }
}
