@JS()
library daterangepicker;

import 'package:js/js.dart';
import 'package:resources_loader/resources_loader.dart';

@anonymous
@JS()
class DateRangePickerRange {
  external String get label;

  external set label(String v);
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

  external Locale get locale;

  external set locale(Locale v);
}

@anonymous
@JS()
class Locale {
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
}

@JS()
class JQuery {
  external daterangepicker(DateRangePickerOptions options);
}

@JS()
external JQuery $([String query]);

class DateRangePicker {
  ResourcesLoaderService _resourcesLoader;

  DateRangePicker(this._resourcesLoader, String query,
      DateRangePickerOptions options) {
    _resourcesLoader.loadStyle(
        'packages/daterangepicker/src/bower_components/bootstrap-daterangepicker/', 'daterangepicker.css');

    _resourcesLoader.loadScript('packages/daterangepicker/src/bower_components/moment/min/', 'moment.min.js', false);

    _resourcesLoader.loadScript(
        'packages/daterangepicker/src/bower_components/bootstrap-daterangepicker/', 'daterangepicker.js', false,
        onData: () {
          $(query).daterangepicker(options);
        });
  }
}
