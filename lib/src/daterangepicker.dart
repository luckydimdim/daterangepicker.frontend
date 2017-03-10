@JS()
library daterangepicker;

import 'package:js/js.dart';

@anonymous
@JS()
class DateRangePickerRange {
  external String get label;
  external set label(String v);

  external factory DateRangePickerRange({String label});
}

@anonymous
@JS()
class DateRangePickerLocale {
  external String get format;
  external set format(String v);

  external String get separator;
  external set separator(String v);

  external String get applyLabel;
  external set applyLabel(String v);

  external String get cancelLabel;
  external set cancelLabel(String v);

  external String get fromLabel;
  external set fromLabel(String v);

  external String get toLabel;
  external set toLabel(String v);

  external String get customRangeLabel;
  external set customRangeLabel(String v);

  external String get weekLabel;
  external set weekLabel(String v);

  external List<String> get daysOfWeek;
  external set daysOfWeek(List<String> v);

  external List<String> get monthNames;
  external set monthNames(List<String> v);

  external int get firstDay;
  external set firstDay(int v);

  external factory DateRangePickerLocale(
      {String format,
      String separator,
      String applyLabel,
      String cancelLabel,
      String fromLabel,
      String toLabel,
      String customRangeLabel,
      String weekLabel,
      List<String> daysOfWeek,
      List<String> monthNames,
      int firstDay});
}

@anonymous
@JS()
class DateRangePickerOptions {
  /*
  * (Date object, moment object or string) The start of the initially selected date range
  */
  external String get startDate;

  external set startDate(String v);

  /*
  * (Date object, moment object or string) The end of the initially selected date range
  */
  external String get endDate;

  external set endDate(String v);

  /*
  * (Date object, moment object or string) The earliest date a user may select
  */
  external String get minDate;

  external set minDate(String v);

  /*
  * (Date object, moment object or string) The latest date a user may select
  * */
  external String get maxDate;

  external set maxDate(String v);

  /*
  * (boolean) Show year and month select boxes above calendars to jump to a specific month and year
  * */
  external bool get showDropdowns;

  external set showDropdowns(bool v);

  /*
  * (boolean) Show localized week numbers at the start of each week on the calendars
  * */
  external bool get showWeekNumbers;

  external set showWeekNumbers(bool v);

  /*
  * (boolean) Allow selection of dates with times, not just dates
  * */
  external bool get timePicker;

  external set timePicker(bool v);

  /*
  * (boolean) Use 24-hour instead of 12-hour times, removing the AM/PM selection
  * */
  external bool get timePicker24Hour;

  external set timePicker24Hour(bool v);

  /*
  * (boolean) Show seconds in the timePicker
  * */
  external bool get timePickerSeconds;

  external set timePickerSeconds(bool v);

  /*
  * (boolean) Show only a single calendar to choose one date, instead of a range picker with two calendars;
  * the start and end dates provided to your callback will be the same single date chosen
  * */
  external bool get singleDatePicker;

  external set singleDatePicker(bool v);

  external DateRangePickerLocale get locale;

  external set locale(DateRangePickerLocale v);

  external bool get autoApply;

  external set autoApply(bool v);

  external factory DateRangePickerOptions(
      {String startDate,
      String endDate,
      String minDate,
      String maxDate,
      bool showDropdowns,
      bool showWeekNumbers,
      bool timePicker,
      bool timePicker24Hour,
      bool timePickerSeconds,
      bool singleDatePicker,
      DateRangePickerLocale locale,
      bool autoApply});
}

@JS()
class JQuery {
  external daterangepicker(DateRangePickerOptions options, dynamic callback);
}

@JS()
external JQuery $([String query]);

class DateRangePicker {
  DateRangePicker(
      dynamic query, DateRangePickerOptions options, dynamic callback) {
    $(query).daterangepicker(options, callback);
  }
}
