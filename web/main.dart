import 'dart:core';

import 'package:angular2/platform/browser.dart';
import 'package:angular2/core.dart';
import 'package:angular2/src/core/reflection/reflection.dart';
import 'package:angular2/router.dart';
import 'package:angular2/platform/common.dart';

import 'package:resources_loader/resources_loader.dart';
import 'package:master_layout/master_layout_component.dart';
import 'package:daterangepicker/daterangepicker_directive.dart';
import 'package:daterangepicker/daterangepicker.dart';
import 'package:alert/alert_service.dart';

bool get isDebug =>
  (const String.fromEnvironment('PRODUCTION', defaultValue: 'false')) != 'true';

@Component(selector: 'app')
@View(
  template: '''
    <master-layout>

          <input daterangepicker type="text" class="form-control" id="start-date"
                           placeholder="Укажите дату заключения договора"

                           [options]="optionsModel" (selected)="dateSelected(\$event)"/>

    </master-layout>''',
  directives: const [MasterLayoutComponent, DateRangePickerDirective])
class AppComponent {

  DateRangePickerOptions optionsModel = new DateRangePickerOptions();


  AppComponent() {
    var locale = new DateRangePickerLocale()
      ..format = 'DD.MM.YYYY'
      ..separator = ' - '
      ..applyLabel = 'Применить'
      ..cancelLabel = 'Отменить'
      ..fromLabel = 'С'
      ..toLabel = 'По'
      ..customRangeLabel = 'Custom'
      ..weekLabel = 'W'
      ..daysOfWeek = ['Вс', 'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб']
      ..monthNames = [
        'Январь',
        'Февраль',
        'Март',
        'Апрель',
        'Май',
        'Июнь',
        'Июль',
        'Август',
        'Сентябрь',
        'Октябрь',
        'Ноябрь',
        'Декабрь'
      ]
      ..firstDay = 1;

    optionsModel = new DateRangePickerOptions()
      ..singleDatePicker = true
      ..startDate = '02.03.2017'
      ..locale = locale;
  }

  dateSelected(e) {
    print(e['start']);
    print(e['end']);
  }

}

main() async {
  if (isDebug) {
    reflector.trackUsage();
  }

  ComponentRef ref = await bootstrap(AppComponent, [
    ROUTER_PROVIDERS,
    const Provider(LocationStrategy, useClass: HashLocationStrategy),
    const Provider(ResourcesLoaderService),
    const Provider(AlertService)
  ]);

  if (isDebug) {
    print('Application in DebugMode');
    enableDebugTools(ref);
    print('Unused keys: ${reflector.listUnusedKeys()}');
  }
}